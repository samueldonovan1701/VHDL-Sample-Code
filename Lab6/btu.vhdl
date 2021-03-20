library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity btu is
        port ( cond : in STD_LOGIC_VECTOR (3 downto 0);
           flags: in STD_LOGIC_VECTOR(3 downto 0);
           take_branch : out STD_LOGIC);
end btu;

architecture behavioral of btu is
    signal N,Z,C,V : STD_LOGIC;
    
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
    
    
begin
    N <= flags(0);
    Z <= flags(1);
    C <= flags(2);
    V <= flags(3);

    with cond select take_branch <=
        '1' when al,
        N when mi,
        NOT(N) when pl,
        Z when eq,
        NOT(Z) when ne,
        C when cs,
        NOT(C) when cc,
        V when vs,
        NOT(V) when vc,
        N XOR V when lt,
        (N AND NOT(Z)) OR (NOT(N) AND V)when gt,
        Z OR (N XOR V) when le,
        NOT (N XOR V) when ge,
        --NOT(C) when lo, --Convered by cc
        C AND NOT(Z) when hi,
        NOT(C) OR Z when ls,
        --C when hs, --Covered by cs
        '0' when others; --also nv
end behavioral;
