library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld : in std_logic;
    Crow_sel, Cdin_sel : in std_logic_vector(1 downto 0);
    denom, C, A : in std_logic_vector(3 downto 0);
    denomgrj, Clttemp, jeqAplus1, ieq0 : out std_logic;
    C_row, denom_addr : out std_logic_vector(1 downto 0);
    C_col, C_din : out std_logic_vector(3 downto 0));
end dp;

architecture rtl of dp is
    component adder5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    component comp2 is
        port (a ,b : in std_logic_vector(1 downto 0);
        y : out std_logic);
    end component;
    component comp5 is
        port (a ,b : in std_logic_vector(4 downto 0);
        y : out std_logic);
    end component;
    component compgr4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component complt4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component mux2_2 is
        port (s : in std_logic;
        a, b: in std_logic_vector(1 downto 0);
        y: out std_logic_vector(1 downto 0)) ;
    end component;
    component mux2_4 is
        port (s : in std_logic;
        a, b: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0)) ;
    end component;
    component mux2_5 is
        port (s : in std_logic;
        a, b: in std_logic_vector(4 downto 0);
        y: out std_logic_vector(4 downto 0)) ;
    end component;
    component mux4_2 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(1 downto 0);
        y: out std_logic_vector(1 downto 0));
    end component;
    component mux4_4 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0));
    end component;
    component reg2 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(1 downto 0);
        reg_out: out std_logic_vector(1 downto 0));
    end component;
    component reg4 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(3 downto 0);
        reg_out: out std_logic_vector(3 downto 0));
    end component;
    component reg5 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(4 downto 0);
        reg_out: out std_logic_vector(4 downto 0));
    end component;
    component sub4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component x_or is
        port (a, b : in std_logic;
        y : out std_logic);
    end component;
    component sub2 is
        port (a, b : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(1 downto 0));
    end component;    
    component adder2 is
        port (a, b : in std_logic_vector(1 downto 0);
        y : out std_logic_vector(1 downto 0));
    end component;
    signal i,  i_in, iminus1, iplus1 : std_logic_vector(1 downto 0);
    signal jminusdenom, temp2 : std_logic_vector(3 downto 0);
    signal C5, A5, Aplus1, j, jplus1, j_in, temp, temp_in : std_logic_vector(4 downto 0);
    begin
        C5(4) <= '0';
        C5(3 downto 0) <= C;
        A5(4) <= '0';
        A5(3 downto 0) <= A;
        A_adder : adder5 port map (A5, "00001", Aplus1);
        Aplus1_comp : comp5 port map (Aplus1, j, jeqAplus1);
        Crow_mux : mux4_2 port map (Crow_sel, "11", i, iplus1, "00", C_row);
        i_adder : adder2 port map (i, "01", iplus1);
        i_sub : sub2 port map (i, "01", iminus1);
        j_sub : sub4 port map (j(3 downto 0), denom, jminusdenom);
        Ccol_mux : mux2_4 port map (Ccol_sel, j(3 downto 0), jminusdenom, C_col);
        Cdin_mux : mux4_4 port map (Cdin_sel, j(3 downto 0), temp2, temp(3 downto 0), "0000", C_din);
        j_adder : adder5 port map (j, "00001", jplus1);
        j_mux : mux2_5 port map (j_sel, jplus1, "00000", j_in);
        i_mux : mux2_2 port map (i_sel, "10", iminus1, i_in);
        j_reg : reg5 port map (clk, rst, j_ld, j_in, j);
        i_reg : reg2 port map (clk, rst, i_ld, i_in, i);
        i_comp : comp2 port map (i, "00", ieq0);
        C_adder : adder5 port map ("00001", C5, temp_in);
        temp_reg : reg5 port map (clk, rst, temp_ld, temp_in, temp);
        denom_comp : compgr4 port map (denom, j(3 downto 0), denomgrj);
        C_comp : complt4 port map (C, temp(3 downto 0), Clttemp);
        temp2_reg : reg4 port map (clk, rst, temp2_ld, C, temp2);
        denom_addr <= i;
    end rtl;