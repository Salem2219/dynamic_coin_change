library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    denom, C, A : in std_logic_vector(3 downto 0);
    C_wr : out std_logic;
    C_row, denom_addr : out std_logic_vector(1 downto 0);
    C_col, C_din : out std_logic_vector(3 downto 0));
end toplevel;

architecture rtl of toplevel is
    component dp is
        port (clk, rst, Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld : in std_logic;
        Crow_sel, Cdin_sel : in std_logic_vector(1 downto 0);
        denom, C, A : in std_logic_vector(3 downto 0);
        denomgrj, Clttemp, jeqAplus1, ieq0 : out std_logic;
        C_row, denom_addr : out std_logic_vector(1 downto 0);
        C_col, C_din : out std_logic_vector(3 downto 0));
    end component;
    component ctrl is
        port (clk, rst, start, denomgrj, Clttemp, jeqAplus1, ieq0 : in std_logic;
        Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld, C_wr : out std_logic;
        Crow_sel, Cdin_sel : out std_logic_vector(1 downto 0));
    end component;
    signal Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld,  denomgrj, Clttemp, jeqAplus1, ieq0 : std_logic;
    signal Crow_sel, Cdin_sel : std_logic_vector(1 downto 0);
    begin
        datapath : dp port map (clk, rst, Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld, Crow_sel, Cdin_sel, denom, C, A, denomgrj, Clttemp, jeqAplus1, ieq0, C_row, denom_addr, C_col, C_din);
        control : ctrl port map (clk, rst, start, denomgrj, Clttemp, jeqAplus1, ieq0, Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld, C_wr, Crow_sel, Cdin_sel);
    end rtl;