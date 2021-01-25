----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/23/2021 01:16:22 PM
-- Design Name: 1-Bit Identity Comparator Testbench
-- Module Name: eq1_testbench - behavioral
-- Project Name: Lab1
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 1-Bit Identity Comparator Testbench
-- 
-- Dependencies: eq1
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity eq1_testbench is
end eq1_testbench;

architecture behavioral of eq1_testbench is
  --inputs
  signal i0 : std_logic;
  signal i1 : std_logic;
  signal eq : std_logic;
begin

  -- Instantiate the Unit Under Test
  uut: entity work.eq1(sop) port map (
      i0 => i0,
      i1 => i1,
      eq => eq
      );

  -- Stimulus process
  stim_proc: process
  begin
    i0 <= '0';
    i1 <= '0';
    wait for 100 ns;
    i0 <= '1';
    i1 <= '0';
    wait for 100 ns;
    i0 <= '0';
    i1 <= '1';
    wait for 100 ns;
    i0 <= '1';
    i1 <= '1';
  end process;
end behavioral;