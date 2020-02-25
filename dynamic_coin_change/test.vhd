library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is
    port (clk, rst, start : in std_logic;
    A : in std_logic_vector(3 downto 0));
end test;

architecture rtl of test is
    component toplevel is
        port (clk, rst, start : in std_logic;
        denom, C, A : in std_logic_vector(3 downto 0);
        C_wr : out std_logic;
        C_row, denom_addr : out std_logic_vector(1 downto 0);
        C_col, C_din : out std_logic_vector(3 downto 0));
    end component;
    component rom_4x4bit is
        port(addr: in std_logic_vector (1 downto 0);
        data: out std_logic_vector (3 downto 0));
    end component;
    component matrix4x16_4bit is
        port(clk, wr : in std_logic;
        row_addr : in std_logic_vector(1 downto 0);
        col_addr : in std_logic_vector(3 downto 0);
        din : in std_logic_vector(3 downto 0);
        dout : out std_logic_vector(3 downto 0));
    end component;
    signal C_wr : std_logic;
    signal denom, C, C_col, C_din  : std_logic_vector(3 downto 0);
    signal C_row, denom_addr : std_logic_vector(1 downto 0);
    begin
        u1 : toplevel port map (clk, rst, start, denom, C, A, C_wr, C_row, denom_addr, C_col, C_din);
        denom_ram : rom_4x4bit port map (denom_addr, denom);
        C_matrix : matrix4x16_4bit port map (clk, C_wr, C_row, C_col, C_din, C);
    end rtl;
