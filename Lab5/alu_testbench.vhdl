library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_testbench is
end alu_testbench;

architecture Behavioral of alu_testbench is
constant BUS_SIZE: natural := 4;
signal A, B, R: std_logic_vector(BUS_SIZE-1 downto 0);
signal FUNC : std_logic_vector(3 downto 0);
signal Cin : std_logic_vector(0 to 0);
signal N,Z,Cout,V: std_logic;
begin


ALU: entity work.alu (behavioral)
    generic map(BUS_SIZE=>BUS_SIZE)
    port map(A=>A,B=>B,F=>FUNC,Cin=>Cin(0), 
             R=>R,N=>N,Z=>Z,V=>V,Cout=>Cout);
       
test: process 


variable i, j, k: integer;
begin

A <= (others => '0');
B <= (others => '0');
FUNC <= (others => '0');
Cin <= (others => '0');

for i in 0 to 15 loop
    FUNC <= std_logic_vector(TO_UNSIGNED(i,4));
    for j in 0 to (2**BUS_SIZE)-1 loop
        A <= std_logic_vector(TO_UNSIGNED(j,BUS_SIZE));
        for k in 0 to (2**BUS_SIZE)-1 loop
            B <= std_logic_vector(TO_UNSIGNED(k,BUS_SIZE));
            wait for 1ns;
        end loop;
    end loop;    
end loop;

end process;
end Behavioral;