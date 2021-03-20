library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package samsBTUpkg is

    type CCR is record
        N: STD_LOGIC;
        Z: STD_LOGIC;
        C: STD_LOGIC;
        V: STD_LOGIC;
    end record CCR;
    
    
    component btu is
        port ( cond : in STD_LOGIC_VECTOR (3 downto 0);
           flags: in CCR;
           take_branch : out STD_LOGIC);
    end component btu;
    
    constant al : std_logic_vector(3 downto 0) := "0000"; --Always
    constant mi : std_logic_vector(3 downto 0) := "0001"; --Less than zero (< 0)
    constant pl : std_logic_vector(3 downto 0) := "0010"; --Greater than or equal to zero (>= 0)
    constant eq : std_logic_vector(3 downto 0) := "0011"; --Equal
    constant ne : std_logic_vector(3 downto 0) := "0100"; --Not Equal
    constant cs : std_logic_vector(3 downto 0) := "0101"; --Carry set
    constant cc : std_logic_vector(3 downto 0) := "0110"; --Carry clear
    constant vs : std_logic_vector(3 downto 0) := "0111"; --Overflow
    constant vc : std_logic_vector(3 downto 0) := "1000"; --No overflow
    constant lt : std_logic_vector(3 downto 0) := "1001"; --Less than (<)
    constant gt : std_logic_vector(3 downto 0) := "1010"; --Greater than (>)
    constant le : std_logic_vector(3 downto 0) := "1011"; --Less or equal (<=)
    constant ge : std_logic_vector(3 downto 0) := "1100"; --Greater or equal (>=)
    constant lo : std_logic_vector(3 downto 0) := "0110"; --Lower (unsigned <)
    constant hi : std_logic_vector(3 downto 0) := "1101"; --Higher (unsigned >)
    constant ls : std_logic_vector(3 downto 0) := "1111"; --Lower or same (unsigned <=)
    constant hs : std_logic_vector(3 downto 0) := "0101"; --Higher or same (unsigned >=)
    constant nv : std_logic_vector(3 downto 0) := "1111"; --Never
end package samsBTUpkg;