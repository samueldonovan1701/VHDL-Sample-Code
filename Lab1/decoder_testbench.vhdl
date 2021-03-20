----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/23/2021 01:16:22 PM
-- Design Name: 2x4 Decoder Testbench
-- Module Name: decoder_testbench - behavioral
-- Project Name: Lab1
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 2x4 Decoder Testbench
-- 
-- Dependencies: decoder
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_testbench is
end decoder_testbench;

architecture behavioral of decoder_testbench is
  --inputs
  signal a0 : std_logic;
  signal a1 : std_logic;
  --outputs
  signal Y0 : std_logic;
  signal Y1 : std_logic;
  signal Y2 : std_logic;
  signal Y3 : std_logic;
begin
    uut: entity work.decoder(sop) port map (
          a0 => a0,
          a1 => a1,
          Y0 => Y0,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3
          );

  -- Stimulus process
  stim_proc: process
  begin
    a0 <= '0';
    a1 <= '0';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '0';
    wait for 100 ns;
    a0 <= '0';
    a1 <= '1';
    wait for 100 ns;
    a0 <= '1';
    a1 <= '1';
    wait for 100 ns;
  end process;
end behavioral;
