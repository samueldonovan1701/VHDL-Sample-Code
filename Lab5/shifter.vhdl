library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.ALL;

entity shifter is
    generic(BUS_SIZE: natural := 8;
            N_LAYERS: natural := 3); --N-LAYERS = log2(BUS_SIZE)
    port(rIN : in STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
         rOUT : out STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
         shftAmnt : in STD_LOGIC_VECTOR(N_LAYERS-1 downto 0);
         N,Z,V,Cout : out STD_LOGIC;
         FUNC : in STD_LOGIC_VECTOR (1 downto 0)
         );
end shifter;

architecture behavioral of shifter is
    type STD_LOGIC_VECTOR_2 is array (integer range<>) of STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    signal A : STD_LOGIC_VECTOR_2(N_LAYERS-1 downto 0);
    signal B : STD_LOGIC_VECTOR_2(N_LAYERS-1 downto 0);
    signal Y : STD_LOGIC_VECTOR_2(N_LAYERS-1 downto -1);
    signal ZeroVec : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    signal OneVec : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    constant NOP: STD_LOGIC_VECTOR(1 downto 0) := "00";
    constant LSL: STD_LOGIC_VECTOR(1 downto 0) := "01";
    constant LSR: STD_LOGIC_VECTOR(1 downto 0) := "10";
    constant ASR: STD_LOGIC_VECTOR(1 downto 0) := "11";
begin
    ZeroVec <= (others => '0');
    OneVec <= (others => '1');
    Y(-1) <= rIN;
    
    muxes: for layer in N_LAYERS-1 downto 0 generate
        muxN: entity work.mux (behavioral)
            generic map(BUS_SIZE=>BUS_SIZE)
            port map(A=>A(layer),
                     B=> B(layer),
                     SEL=>shftAmnt(layer), 
                     Y=>Y(layer));
        A(layer) <= Y(layer-1);        
        B(layer) <= Y(layer-1)(BUS_SIZE-1-2**layer downto 0) & ZeroVec(2**layer-1 downto 0) when FUNC=LSL else
                ZeroVec(2**layer-1 downto 0) & Y(layer-1)(BUS_SIZE-1 downto 2**layer) when FUNC=LSR else
                ZeroVec(2**layer-1 downto 0) & Y(layer-1)(BUS_SIZE-1 downto 2**layer) when (FUNC=ASR and rIN(BUS_SIZE-1)='0') else
                OneVec(2**layer-1 downto 0) & Y(layer-1)(BUS_SIZE-1 downto 2**layer) when (FUNC=ASR and rIN(BUS_SIZE-1)='1') else
                A(layer); --No shift
    end generate muxes;
    
    
    rOUT <= Y(N_LAYERS-1);
    N <= Y(N_LAYERS-1)(BUS_SIZE-1);
    Z <= '1' when Y(N_LAYERS-1) = 0 else '0';
    V <= '1' when Y(N_LAYERS-1)(BUS_SIZE-1) /= rIN(BUS_SIZE-1) AND FUNC=LSL else '0';
    Cout <= rIN(BUS_SIZE - 1 - to_integer(unsigned(shftAmnt))) when shftAmnt /= 0 AND FUNC /= NOP else '0';
end behavioral;