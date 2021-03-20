library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gen_reg_file is
    generic(
        REG_SIZE: integer := 8;
        N_REGS: integer := 2
        );
    Port ( 
        clk, reset, writeEnable: in std_logic;
        InputSel: in std_logic_vector(natural(ceil(log2(real(N_REGS))))-1 downto 0);
        Input: in std_logic_vector(REG_SIZE-1 downto 0);
        OutputASel, OutputBSel: in std_logic_vector(natural(ceil(log2(real(N_REGS))))-1 downto 0);
        OutputA, OutputB: out std_logic_vector (REG_SIZE-1 downto 0)
    );
end gen_reg_file;

architecture Behavioral of gen_reg_file is
    type REG_ARR is array(N_REGS-1 downto 0) of
        std_logic_vector(REG_SIZE-1 downto 0);
        
    signal regs: REG_ARR;
    
begin
    process(clk, reset)
    begin
        if(reset = '1') then
            regs <= (others=>(others=>'0')); --Clear all registers
        elsif(clk='1') then --CLK Rising edge
            if writeEnable='1' then --Write is enable
                regs(to_integer(unsigned(InputSel)))<= Input;
            end if;
        end if;
     end process;
  OutputA <= regs(to_integer(unsigned(OutputASel)));
  OutputB <= regs(to_integer(unsigned(OutputBSel)));

end Behavioral;