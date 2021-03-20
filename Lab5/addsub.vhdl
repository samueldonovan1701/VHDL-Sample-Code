library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity addsub is
    generic(BUS_SIZE: natural:=4);
    Port ( A : in STD_LOGIC_VECTOR (BUS_SIZE-1 downto 0);
           B : in STD_LOGIC_VECTOR (BUS_SIZE-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (BUS_SIZE-1 downto 0);
           N,Z,V,Cout : out STD_LOGIC;
           FUNC: in STD_LOGIC_VECTOR (1 downto 0)); -- [ADD/SUB, W/CARRY?]
end addsub;

architecture behavioral of addsub is
    signal Carry: STD_LOGIC_VECTOR (BUS_SIZE downto 0);
    signal B_MOD: STD_LOGIC_VECTOR (BUS_SIZE-1 downto 0); -- B, Modified
    signal SUM: STD_LOGIC_VECTOR (BUS_SIZE-1 downto 0);
begin
    Carry(0) <= Cin when FUNC(0)='1' else FUNC(1); --Only set during carry
    B_MOD <= NOT B when FUNC(1)='1' else B; --Only set during subtraction
    
    gen_adders: for i in BUS_SIZE-1 downto 0 generate
        full_adderN: entity work.full_adder
            port map(A=>A(i), B=>B_MOD(i), Cin=>Carry(i), S=>SUM(i), Cout=>Carry(i+1));
    end generate gen_adders;
    
    S <= SUM;
    V <= (NOT A(BUS_SIZE-1) AND NOT B(BUS_SIZE-1) AND SUM(BUS_SIZE-1)) OR (A(BUS_SIZE-1) AND B(BUS_SIZE-1) AND NOT SUM(BUS_SIZE-1));
    N <= SUM(BUS_SIZE-1);
    Z <= '1' when SUM = 0 else '0';
    Cout <= Carry(BUS_SIZE);
end behavioral;
