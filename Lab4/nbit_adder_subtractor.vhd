library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_adder_subtractor is
    generic(N: integer:=4);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (N-1 downto 0);
           Cout : out STD_LOGIC;
           V : out STD_LOGIC;
           F: in STD_LOGIC_VECTOR (1 downto 0)); -- [ADD/SUB, W/CARRY?]
end nbit_adder_subtractor;

architecture Behavioral of nbit_adder_subtractor is
    signal Carry: STD_LOGIC_VECTOR (N downto 0);
    signal B_MOD: STD_LOGIC_VECTOR (N-1 downto 0); -- B, Modified
    signal SUM: STD_LOGIC_VECTOR (N-1 downto 0);
begin
    Carry(0) <= Cin when F(0)='1' else F(1); --Only set during carry
    B_MOD <= NOT B when F(1)='1' else B; --Only set during subtraction
    
    gen_adders: for i in N-1 downto 0 generate
        full_adderN: entity work.full_adder
            port map(A=>A(i), B=>B_MOD(i), Cin=>Carry(i), S=>SUM(i), Cout=>Carry(i+1));
    end generate gen_adders;
    
    V <= (NOT A(N-1) AND NOT B(N-1) AND SUM(N-1)) OR (A(N-1) AND B(N-1) AND NOT SUM(N-1));
    S <= SUM;
    Cout <= Carry(N);
end Behavioral;
