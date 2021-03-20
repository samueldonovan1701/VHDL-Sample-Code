library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_shifter is
    generic(N_LAYERS : natural := 3);
    port(rIN : in STD_LOGIC_VECTOR(2**N_LAYERS-1 downto 0);
         rOUT : out STD_LOGIC_VECTOR(2**N_LAYERS-1 downto 0);
         shftAmnt : in STD_LOGIC_VECTOR(N_LAYERS-1 downto 0);
         Cout : out STD_LOGIC;
         func : in STD_LOGIC_VECTOR (1 downto 0)
         );
end nbit_shifter;

architecture behavioral of nbit_shifter is
constant BUS_SIZE : natural := 2**N_LAYERS;

type STD_LOGIC_VECTOR_2 is array (integer range<>) of STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    signal A : STD_LOGIC_VECTOR_2(N_LAYERS-1 downto 0);
    signal B : STD_LOGIC_VECTOR_2(N_LAYERS-1 downto 0);
    signal Y : STD_LOGIC_VECTOR_2(N_LAYERS-1 downto -1);
    signal ZeroVec : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    signal OneVec : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
begin
    ZeroVec <= (others => '0');
    OneVec <= (others => '1');
    Y(-1) <= rIN;
    
    muxes: for layer in N_LAYERS-1 downto 0 generate
        muxN: entity work.two_to_one_mux (behavioral)
            generic map(BUS_SIZE=>BUS_SIZE)
            port map(A=>A(layer),
                     B=> B(layer),
                     SEL=>shftAmnt(layer), 
                     Y=>Y(layer));
        A(layer) <= Y(layer-1);
        
        B(layer) <= Y(layer-1)(BUS_SIZE-1-2**layer downto 0) & ZeroVec(2**layer-1 downto 0) when func="01" else --LSL
                ZeroVec(2**layer-1 downto 0) & Y(layer-1)(BUS_SIZE-1 downto 2**layer) when func="10" else   --LSR
                ZeroVec(2**layer-1 downto 0) & Y(layer-1)(BUS_SIZE-1 downto 2**layer) when (func="11" and rIN(BUS_SIZE-1)='0') else --ASR (0)
                OneVec(2**layer-1 downto 0) & Y(layer-1)(BUS_SIZE-1 downto 2**layer) when (func="11" and rIN(BUS_SIZE-1)='1') else  --ASR (1)
                A(layer); --No shift
    end generate muxes;
    
    
    
    rOUT <= Y(N_LAYERS-1);
end behavioral;