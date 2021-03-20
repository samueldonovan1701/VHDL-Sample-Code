----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/31/2021 01:16:22 PM
-- Design Name: 4-bit 2-to-1 Multiplexor
-- Module Name: FourTwoOneMultiplexor - Behavioral
-- Project Name: Lab2
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 4-bit 2-to-1 Multiplexor
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

entity FourTwoOneMultiplexor is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end FourTwoOneMultiplexor;

architecture Behavioral of FourTwoOneMultiplexor is
begin   
    Y <= A when sel='0' else 
         B;
end Behavioral;
