library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity two_to_one_mux is
  generic(BUS_SIZE: integer:=4);
  Port ( 
  A, B: in std_logic_vector(BUS_SIZE-1 downto 0);
  SEL: in std_logic;
  Y: out std_logic_vector(BUS_SIZE-1 downto 0)
  );
end two_to_one_mux;

architecture behavioral of two_to_one_mux is
begin
    Y <= A when SEL = '0' else B;
end behavioral;
