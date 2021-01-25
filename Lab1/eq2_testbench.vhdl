----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/23/2021 01:16:22 PM
-- Design Name: 2-Bit Identity Comparator Testbench
-- Module Name: eq1_testbench - behavioral
-- Project Name: Lab1
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 2-Bit Identity Comparator Testbench
-- 
-- Dependencies: eq2, eq1
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eq2_testbench is
end eq2_testbench;

architecture behavioral of eq2_testbench is
  --inputs
  signal a0 : std_logic;
  signal a1 : std_logic;
  signal b0 : std_logic;
  signal b1 : std_logic;
  signal eq : std_logic;
begin
  -- Instantiate the Unit Under Test
  uut: entity work.eq2(sop) port map (
      a0 => a0,
      a1 => a1,
      b0 => b0,
      b1 => b1,
      eq => eq
      );

  -- Stimulus process
  stim_proc: process
  begin
    a0 <= '0';
    a1 <= '0';
    b0 <= '0';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '0';
    b0 <= '0';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '1';
    b0 <= '0';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '1';
    b0 <= '0';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '0';
    b0 <= '1';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '0';
    b0 <= '1';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '1';
    b0 <= '1';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '1';
    b0 <= '1';
    b1 <= '0';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '0';
    b0 <= '0';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '0';
    b0 <= '0';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '1';
    b0 <= '0';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '1';
    b0 <= '0';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '0';
    b0 <= '1';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '0';
    b0 <= '1';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '1';
    b0 <= '1';
    b1 <= '1';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '1';
    b0 <= '1';
    b1 <= '1';
  end process;
end behavioral;
