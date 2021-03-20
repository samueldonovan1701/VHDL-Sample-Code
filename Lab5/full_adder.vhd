library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end full_adder;

architecture behavioral of full_adder is

begin
    S <= (NOT A AND NOT B AND Cin) 
        OR (NOT A AND B AND NOT Cin) 
        OR (A AND NOT B AND NOT Cin)
        OR (A AND B AND Cin);
    
    Cout <= (B AND Cin)
        OR (A AND Cin)
        OR (A AND B);
end behavioral;
