library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity nbit_adder_sim is
end nbit_adder_sim;

architecture testbench of nbit_adder_sim is
    constant N: integer := 4;
    signal A,B,S: std_logic_vector(N-1 downto 0);
    signal Cin,Cout: std_logic;
begin

fourbit_adder: entity work.nbit_adder (behavioral)
    generic map(N=>N)
    port map(A=>A, B=>B, Cin=>Cin, S=>S, Cout=>Cout);

test: process
    begin
        --2+2
        A <= "0010"; --0x2
        B <= "0010"; --0x2
        Cin <= '0';
        wait for 20ns; --Expect "0100" (0x4) + '0'
        
        --2+2+Carry
        A <= "0010"; --0x2
        B <= "0010"; --0x2
        Cin <= '1';
        wait for 20ns; --Expect "0101" (0x5) + '0'
        
        --Overflow (no carry)
        A <= "1111";
        B <= "0001";
        Cin <= '0';
        wait for 20ns; --Expect "0000"(0x0) + '1' 
        
        --Overflow (carry only)
        A <= "1111"; --0xF
        B <= "0000"; --0x0
        Cin <= '1';
        wait for 20ns; --Expect "0000"(0x0) + '1'
        
        --Overflow (with carry)
        A <= "1111"; --0xF
        B <= "0001"; --0x1
        Cin <= '1';
        wait for 20ns; --Expect: "0001"(0x1) + '1'
        
        --Overflow (zero sum)
        A <= "1001"; --0x9
        B <= "0111"; --0x7
        Cin <= '0';
        wait for 20ns; --Expect: "0000"(0x0) + '1'
        
        --Overflow (nonzero sum)
        A <= "1001"; --0x9
        B <= "1011"; --0xB
        Cin <= '0';
        wait for 20ns; --Expect: "0100"(0x4) + '1'
        
        assert false;
    end process;

end testbench;
