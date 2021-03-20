library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_sim is
end shifter_sim;

architecture testbench of shifter_sim is
    constant N_LAYERS : natural := 3;
    constant BUS_SIZE : natural := 2**N_LAYERS;
    signal rIN : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    signal rOUT : STD_LOGIC_VECTOR(BUS_SIZE-1 downto 0);
    signal shftAmnt : STD_LOGIC_VECTOR(N_LAYERS-1 downto 0); 
    signal Cout : STD_LOGIC;
    signal func : STD_LOGIC_VECTOR(1 downto 0);
begin


shifter: entity work.nbit_shifter (behavioral)
    generic map(N_LAYERS=>N_LAYERS)
    port map(rIN=>rIN, rOUT=>rOUT, shftAmnt=>shftAmnt, Cout=>Cout, func=>func);


test:   process begin
        func <= "00"; --None
        rIN <= "11110000"; --7
        shftAmnt <= "010";
        wait for 5ns;
        func <= "01"; --LSL
        wait for 5ns;
        func <= "10"; --LSR
        wait for 5ns;
        func <= "11"; --ASR
        wait for 5ns;

    end process;

end testbench;
