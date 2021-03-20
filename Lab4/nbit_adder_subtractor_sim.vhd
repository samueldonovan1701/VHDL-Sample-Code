library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_adder_subtractor_sim is
end nbit_adder_subtractor_sim;

architecture testbench of nbit_adder_subtractor_sim is
    constant N: integer := 4;
    signal A,B,S: std_logic_vector(N-1 downto 0);
    signal F: std_logic_vector(1 downto 0);
    signal Cin,Cout,V: std_logic;
begin

fourbit_adder: entity work.nbit_adder_subtractor (behavioral)
    generic map(N=>N)
    port map(A=>A, B=>B, Cin=>Cin, S=>S, Cout=>Cout, V=>V, F=>F);

test: process
    begin
    --ADD
    F <= "00";
    
    A <= "0010"; --2
    B <= "0010"; --2
    Cin <= '0';  --No Carry
    wait for 1ns; --Expected: 0100
    
    A <= "0010"; --2
    B <= "0010"; --2
    Cin <= '1';  --Carry
    wait for 1ns; --Expected: 0100
    
    A <= "1101"; --13           
    B <= "0111"; --7           
    Cin <= '1';  --Carry       
    wait for 1ns; --Expected: 10100 (0100 + Carry)
    
    A <= "1101"; --13           
    B <= "1000"; --8           
    Cin <= '1';  --Carry       
    wait for 1ns; --Expected: 10101 (0101 + Carry + Overflow)
    
    
    --ADC
    F <= "01";
    
    A <= "0011"; --3
    B <= "0010"; --2
    Cin <= '0';  --No Carry
    wait for 1ns; --Expected: 0101
    
    A <= "0010"; --2
    B <= "0010"; --2
    Cin <= '1';  --Carry
    wait for 1ns; --Expected: 0101
    
    A <= "1101"; --13         
    B <= "0111"; --7           
    Cin <= '1';  --Carry       
    wait for 1ns; --Expected: 10101 (0101 + Carry)
    
        
    A <= "1101"; --13           
    B <= "1000"; --8           
    Cin <= '1';  --Carry       
    wait for 1ns; --Expected: 10110 (0100 + Carry + Overflow)
        
    --SUB
    F <= "10";
    
    A <= "0011"; --3
    B <= "1010"; --12 -> 0101
    Cin <= '0';  --No Carry (Gets set to 1)
    wait for 1ns; --Expected: 1001
    
    A <= "0011"; --3
    B <= "1010"; --12 -> 0101
    Cin <= '1';  --Carry (Gets set to 1)
    wait for 1ns; --Expected: 1001
    
    A <= "0111"; --7
    B <= "0010"; --2 -> 1101
    Cin <= '1';  --Carry (Gets set to 1)
    wait for 1ns; --Expected: 10101 (0101 + Carry)
    
    A <= "1111"; --15
    B <= "1110"; --14 -> 0001
    Cin <= '1';  --Carry (Gets set to 1)
    wait for 1ns; --Expected: 10000 (0000 + Carry + Overflow)
    
     --SBC
    F <= "11";
    
    A <= "1000"; --8
    B <= "1000"; --8 -> 0111
    Cin <= '0';  --No Carry
    wait for 1ns; --Expected: 1111
    
    A <= "0011"; --3
    B <= "0011"; --3 -> 1100
    Cin <= '1';  --Carry
    wait for 1ns; --Expected: 10000 (0000 + Carry)
    
    A <= "0011"; --3
    B <= "0011"; --3 -> 1100
    Cin <= '0';  --Carry
    wait for 1ns; --Expected: 1111 (Overflow)
    
    A <= "1111"; --15
    B <= "1110"; --14 -> 0001
    Cin <= '0';  --Carry
    wait for 1ns; --Expected: 10000 (0000 + Carry + Overflow)
end process;
end testbench;
