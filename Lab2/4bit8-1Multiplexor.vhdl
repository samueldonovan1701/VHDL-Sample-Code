----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/31/2021 01:16:22 PM
-- Design Name: 4-bit 8-to-1 Multiplexor
-- Module Name: FourTwoOneMultiplexor - Behavioral
-- Project Name: Lab2
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 4-bit 8-to-1 Multiplexor
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

entity FourEightOneMultiplexor is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           E : in STD_LOGIC_VECTOR (3 downto 0);
           F : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           H : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 1);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end FourEightOneMultiplexor;

architecture Behavioral of FourEightOneMultiplexor is
begin
    Y <= A when sel=x"0" else 
         B when sel=x"1" else 
         C when sel=x"2" else 
         D when sel=x"3" else 
         E when sel=x"4" else 
         F when sel=x"5" else 
         G when sel=x"6" else 
         H;
end Behavioral;
