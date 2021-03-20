----------------------------------------------------------------------------------
-- Company: SDSM&T CENG 342
-- Engineer: Samuel Donovan
-- 
-- Create Date: 01/23/2021 01:16:22 PM
-- Design Name: 2x4 Decoder 
-- Module Name: decoder - sop
-- Project Name: Lab1
-- Target Devices: Nexys A7-100T (xc7a100tcsg324-1)
-- Tool Versions: 
-- Description: 2x4 Decoder
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

entity decoder is
    Port ( a0 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC);
end decoder;

architecture sop of decoder is

begin
    Y0 <= a0 OR a1;
    Y1 <= (NOT a0) OR a1;
    Y2 <= a0 OR (NOT a1);
    Y3 <= (NOT a0) OR (NOT a1);
end sop;
