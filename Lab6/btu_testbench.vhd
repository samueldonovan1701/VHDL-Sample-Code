library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.samsBTUpkg.all;
use IEEE.NUMERIC_STD.ALL;

entity btu_testbench is
end btu_testbench;

architecture Behavioral of btu_testbench is
    signal condition : STD_LOGIC_VECTOR(3 downto 0);
    signal CCR : STD_LOGIC_VECTOR(3 downto 0);
    signal btu_return : STD_LOGIC;
begin

btu: entity work.btu (behavioral)
    port map(cond=>condition, flags=>CCR, take_branch=>btu_return);
    
test: process
variable i, j: integer;
begin

condition <= (others => '0');
CCR <= (others => '0');

for i in 0 to 7 loop
    condition <= std_logic_vector(TO_UNSIGNED(i,4));
    for j in 0 to 4 loop
        CCR <= std_logic_vector(TO_UNSIGNED(j,4));
        wait for 1ns;
    end loop;    
end loop;


end process;
end Behavioral;
