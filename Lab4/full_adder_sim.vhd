library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_sim is
end full_adder_sim;

architecture testbench of full_adder_sim is
    signal A,B,Cin,S,Cout: std_logic;
begin
    fulladdr: entity work.full_adder (behavioral)
        port map(A=>A, B=>B, Cin=>Cin, S=>S, Cout=>Cout);

    process begin
        Cin <= '0'; --No Carry
        A <= '0';
        B <= '0';
        wait for 20ns;
        A <= '1';
        B <= '0';
        wait for 20ns;
        A <= '0';
        B <= '1';
        wait for 20ns;
        A <= '1';
        B <= '1';
        wait for 20ns;

        Cin <= '1'; --With Carry
        A <= '0';
        B <= '0';
        wait for 20ns;
        A <= '1';
        B <= '0';
        wait for 20ns;
        A <= '0';
        B <= '1';
        wait for 20ns;
        A <= '1';
        B <= '1';
        wait for 20ns;
    end process;
end testbench;
