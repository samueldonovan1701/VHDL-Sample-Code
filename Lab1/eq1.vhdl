----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/23/2021 01:16:22 PM
-- Design Name: 1-Bit Identity Comparator
-- Module Name: eq1 - sod
-- Project Name: Lab1
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 1-Bit Identity Comparator
-- 
-- Dependencies: 
-- 
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity eq1 is
    Port ( i0 : in STD_LOGIC;
           i1 : in STD_LOGIC;
           eq : out STD_LOGIC);
end eq1;
-- TEST
architecture sop of eq1 is
begin
    eq <= (i1 AND i0) OR ((NOT i1) and (NOT i0)); 
end sop;
