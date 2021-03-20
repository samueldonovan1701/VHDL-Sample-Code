library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity branch_test_unit is
    type flag_array is record
        N: STD_LOGIC;
        Z: STD_LOGIC;
        C: STD_LOGIC;
        V: STD_LOGIC;
    end record flag_array;
     
    Port ( cond : in STD_LOGIC_VECTOR (3 downto 0);
           flags : in flag_array;
           take_branch : out STD_LOGIC);
end branch_test_unit;

architecture behavioral of branch_test_unit is

begin


end behavioral;
