library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
  generic(BUS_SIZE: natural :=1);
  Port (
  A, B: in std_logic_vector(BUS_SIZE-1 downto 0);
  F: in std_logic_vector(3 downto 0);
  Cin: in std_logic;
  R: out std_logic_vector(BUS_SIZE-1 downto 0);
  N,Z,Cout,V: out std_logic
  );
end alu;

architecture behavioral of alu is
    signal BLOCK_SEL: std_logic_vector(1 downto 0);
    signal FUNC_SEL: std_logic_vector(1 downto 0);
    signal N_mux,Z_mux,Cout_mux,V_mux : std_logic_vector(2 downto 0);
    signal SUM, SHIFTED, BITWISE : std_logic_vector(BUS_SIZE-1 downto 0);
    signal ZeroVec : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    constant SHIFTER_LAYERS: natural := natural(ceil(log2(real(BUS_SIZE))));
    signal SHFT_AMT : STD_LOGIC_VECTOR(SHIFTER_LAYERS-1 downto 0);
begin        
    ZeroVec <= (others => '0');
    FUNC_SEL <= F(2 downto 1); 
    BLOCK_SEL <= F(3) & F(0);
    
    
    addsub: entity work.addsub (behavioral)
        generic map(BUS_SIZE=>BUS_SIZE)
        port map(A=>A,B=>B,Cin=>Cin,S=>SUM,N=>N_mux(0),Z=>Z_mux(0),V=>V_mux(0),Cout=>Cout_mux(0),FUNC=>FUNC_SEL);
    logic_unit: entity work.logic_unit (behavioral)
        generic map(BUS_SIZE=>BUS_SIZE)
        port map(A=>A,B=>B,Y=>BITWISE, N=>N_mux(1), Z=>Z_mux(1), FUNC=>FUNC_SEL);
        V_mux(1) <= '0';
        Cout_mux(1) <= '0';
    shifter: entity work.shifter (behavioral)
        generic map(BUS_SIZE=>BUS_SIZE, N_LAYERS=>SHIFTER_LAYERS)
        port map(rIN=>A, rOUT=>SHIFTED, shftAmnt=>B(SHIFTER_LAYERS-1 downto 0),N=>N_mux(2),Z=>Z_mux(2),V=>V_mux(2),Cout=>Cout_mux(2),FUNC=>FUNC_SEL);
        SHFT_AMT <= B(SHIFTER_LAYERS-1 downto 0);
        
        
        
   with BLOCK_SEL select
    R <= SUM     when "00", --ADD/SUB
         BITWISE when "11", --Logic
         SHIFTED when "10", --Shifter
         ZeroVec when others; --Reserved (Return 0)
         
    with BLOCK_SEL select
    N <= N_mux(0)   when "00", --ADD/SUB
         N_mux(1)   when "11", --Logic
         N_mux(2)   when "10", --Shifter
         '0'        when others; --Reserved (Return 0)
    
    with BLOCK_SEL select
    Z <= Z_mux(0)   when "00", --ADD/SUB
         Z_mux(1)   when "11", --Logic
         Z_mux(2)   when "10", --Shifter
         '0'        when others; --Reserved (Return 0)
    
    with BLOCK_SEL select
    V <= V_mux(0)     when "00", --ADD/SUB
         V_mux(1)  when "11", --Logic
         V_mux(2)   when "10", --Shifter
         '0'  when others; --Reserved (Return 0)
         
    with BLOCK_SEL select
    Cout <= Cout_mux(0) when "00", --ADD/SUB
         '0'            when "11", --Logic
         Cout_mux(0)    when "10", --Shifter
         '0'            when others; --Reserved (Return 0)
     
end behavioral;