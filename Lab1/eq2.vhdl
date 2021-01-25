----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/23/2021 01:16:22 PM
-- Design Name: 2-Bit Identity Comparator
-- Module Name: eq2 - sod
-- Project Name: Lab1
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 2-Bit Identity Comparator
-- 
-- Dependencies: eq1
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eq2 is
    Port ( a1 : in STD_LOGIC;
           a0 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           b0 : in STD_LOGIC;
           eq : out STD_LOGIC);
end eq2;

architecture sop of eq2 is
    signal s0 : std_logic := '0';
    signal s1 : std_logic := '0';
begin
    eq0: entity work.eq1(sop) port map (
      i0 => a0,
      i1 => b0,
      eq => s0
      );
      
    eq1: entity work.eq1(sop) port map (
      i0 => a1,
      i1 => b1,
      eq => s1
      );
      
    eq <= s0 AND s1;
    
end sop;
