library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity logic_unit is
  generic(BUS_SIZE: natural :=1);
  Port (
  A, B: in std_logic_vector(BUS_SIZE-1 downto 0);
  Y: out std_logic_vector(BUS_SIZE-1 downto 0);
  N,Z: out std_logic;
  FUNC: in std_logic_vector(1 downto 0)
  );
end logic_unit;

architecture behavioral of logic_unit is
  signal R: std_logic_vector(BUS_SIZE-1 downto 0);
begin

    with FUNC select
        R <= not(B)     when "00",
             (A and B)  when "01",
             (A or B)   when "10",
             (A xor B)  when others;
             
    Y <= R;  
    N <= R(BUS_SIZE-1);
    Z <= '1' when (R = 0) else '0';
end behavioral;
