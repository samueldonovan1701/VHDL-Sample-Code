library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_adder is
    generic(N: integer:=4);
    Port ( A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (N-1 downto 0);
           Cout : out STD_LOGIC);
end nbit_adder;

architecture Behavioral of nbit_adder is
    signal C: STD_LOGIC_VECTOR (N downto 0);
begin
    C(0) <= Cin;
    
    gen_adders: for i in N-1 downto 0 generate
        full_adderN: entity work.full_adder (Behvioral)
            port map(A=>A(i), B=>B(i), Cin=>C(i), S=>S(i), Cout=>C(i+1));
    end generate gen_adders;
    
    Cout <= C(N);
end Behavioral;
