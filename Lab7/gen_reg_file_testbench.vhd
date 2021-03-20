library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.ENV.STOP;

entity gen_reg_file_testbench is
end gen_reg_file_testbench;

architecture Behavioral of gen_reg_file_testbench is
    constant REGSIZE: integer := 8;
    constant NREGS:   integer := 16;
    constant SELSIZE: natural := natural(ceil(log2(real(NREGS))));
    signal CLK, RESET, WE: STD_LOGIC := '0';
    signal InputSel, OutputASel, OutputBSel: STD_LOGIC_VECTOR(SELSIZE-1 downto 0);
    signal Input, OutputA, OutputB : STD_LOGIC_VECTOR(REGSIZE-1 downto 0);

begin

reg_file: entity work.gen_reg_file (behavioral)
            generic map(REG_SIZE=>REGSIZE, N_REGS=>NREGS)
            port map(
                clk=>CLK,
                reset=>RESET,
                writeEnable=>WE,
                InputSel=>InputSel,
                Input=>Input,
                OutputASel=>OutputASel,
                OutputBSel=>OutputBSel,
                OutputA=>OutputA,
                OutputB=>OutputB
            );

testProc: process
    
begin
    --Set signals 0
    CLK <= '0';
    RESET <= '0';
    WE <= '0';
    InputSel <= (others => '0');
    Input <= (others => '0');
    OutputASel <= (others => '0');
    OutputBSel <= (others => '0');
    wait for 1ns;
    
    --Reset
    RESET <= '1';
    wait for 0.5ns;
    CLK <= '1';
    wait for 0.5ns;
    CLK <= '0';
    RESET <= '0';
    
    --Write 56 to reg 5
    WE <= '1';
    Input <= std_logic_vector(to_unsigned(56, REGSIZE));
    InputSel <= std_logic_vector(to_unsigned(5, SELSIZE));
    wait for 0.5ns;
    CLK <= '1';
    wait for 0.5ns;
    CLK <= '0';
    Input <= std_logic_vector(to_unsigned(0, REGSIZE));
    InputSel <= std_logic_vector(to_unsigned(0, SELSIZE));
    
    --Write 206 to reg 3
    WE <= '1';
    Input <= std_logic_vector(to_unsigned(206, REGSIZE));
    InputSel <= std_logic_vector(to_unsigned(3, SELSIZE));
    wait for 0.5ns;
    CLK <= '1';
    wait for 0.5ns;
    CLK <= '0';
    WE <= '0';
    Input <= std_logic_vector(to_unsigned(0, REGSIZE));
    InputSel <= std_logic_vector(to_unsigned(0, SELSIZE));
    
    --Write 128 to reg 9
    WE <= '1';
    Input <= std_logic_vector(to_unsigned(128, REGSIZE));
    InputSel <= std_logic_vector(to_unsigned(9, SELSIZE));
    wait for 0.5ns;
    CLK <= '1';
    wait for 0.5ns;
    CLK <= '0';
    WE <= '0';
    Input <= std_logic_vector(to_unsigned(0, REGSIZE));
    InputSel <= std_logic_vector(to_unsigned(0, SELSIZE));
    
    --Read reg 5 to output A
    OutputASel <= std_logic_vector(to_unsigned(5, SELSIZE));
    wait for 1ns;
    
    --Read reg 3 to output 
    OutputBSel <= std_logic_vector(to_unsigned(3, SELSIZE));
    wait for 1ns;
    
    --Read reg 9 to output A
    OutputASel <= std_logic_vector(to_unsigned(9, SELSIZE));
    wait for 1ns;
    
    --Read reg 9 to output B
    OutputBSel <= std_logic_vector(to_unsigned(9, SELSIZE));
    wait for 1ns;
    
    --Reset
    RESET <= '1';
    wait for 0.5ns;
    CLK <= '1';
    wait for 0.5ns;
    CLK <= '0';
    RESET <= '0';
    
    stop;
end process;
end Behavioral;
