library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity matrix4x16_4bit is
    port(clk, wr : in std_logic;
    row_addr : in std_logic_vector(1 downto 0);
    col_addr : in std_logic_vector(3 downto 0);
    din : in std_logic_vector(3 downto 0);
    dout : out std_logic_vector(3 downto 0));
end matrix4x16_4bit;
    
architecture rtl of matrix4x16_4bit is
    type ram_type is array (0 to 3, 0 to 15) of
    std_logic_vector(3 downto 0);
    signal program: ram_type;
    begin
    process(clk)
    begin
    if (rising_edge(clk)) then
    if (wr = '1') then
    program(conv_integer(unsigned(row_addr)), conv_integer(unsigned(col_addr))) <= din;
    end if;
    end if;
    end process;
    dout <= program(conv_integer(unsigned(row_addr)), conv_integer(unsigned(col_addr)));
    end rtl;