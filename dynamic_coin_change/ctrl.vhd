library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
    port (clk, rst, start, denomgrj, Clttemp, jeqAplus1, ieq0 : in std_logic;
    Ccol_sel, j_sel, i_sel, j_ld, i_ld, temp_ld, temp2_ld, C_wr : out std_logic;
    Crow_sel, Cdin_sel : out std_logic_vector(1 downto 0));
end ctrl;

architecture rtl of ctrl is
    type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9, s10, s11, s12, s13, s14, s15, s16);
    signal current_state, next_state: state_type; 
    begin
        process (rst, clk)
        begin
            if (rst ='1') then
            current_state <= s0;
            elsif (rising_edge(clk)) then
            current_state <= next_state;
            end if;
        end process;
        process (current_state, start, denomgrj, Clttemp, jeqAplus1, ieq0)
        begin
            case current_state is
                when s0 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s1;
                when s1 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                if(start = '1') then
                    next_state <= s2;
                else
                    next_state <= s1;
                end if;
                when s2 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                if(jeqAplus1 = '0') then
                    next_state <= s3;
                else
                    next_state <= s5;
                end if;
                when s3 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '1';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s4;
                when s4 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '1';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s2;
                when s5 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '1';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s6;
                when s6 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                if (ieq0 = '0') then
                    next_state <= s7;
                else
                    next_state <= s1;
                end if;
                when s7 =>
                Ccol_sel <= '0';
                j_sel <= '1';
                i_sel <= '0';
                j_ld <= '1';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s8;
                when s8 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                if(jeqAplus1 = '0') then
                next_state <= s9;
                else
                next_state <= s16;
                end if;
                when s9 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                if (denomgrj = '1') then
                    next_state <= s10;
                else
                    next_state <= s12;
                end if;
                when s10 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '1';
                C_wr <= '0';
                Crow_sel <= "10";
                Cdin_sel <= "00";
                next_state <= s11;
                when s11 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '1';
                Crow_sel <= "01";
                Cdin_sel <= "01";
                next_state <= s15;
                when s12 =>
                Ccol_sel <= '1';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '1';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "01";
                Cdin_sel <= "00";
                next_state <= s13;
                when s13 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "10";
                Cdin_sel <= "00";
                if(Clttemp = '1') then
                next_state <= s10;
                else
                next_state <= s14;
                end if;
                when s14 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '0';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '1';
                Crow_sel <= "01";
                Cdin_sel <= "10";
                next_state <= s15;
                when s15 =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '0';
                j_ld <= '1';
                i_ld <= '0';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s8;
                when others =>
                Ccol_sel <= '0';
                j_sel <= '0';
                i_sel <= '1';
                j_ld <= '0';
                i_ld <= '1';
                temp_ld <= '0';
                temp2_ld <= '0';
                C_wr <= '0';
                Crow_sel <= "00";
                Cdin_sel <= "00";
                next_state <= s6;
            end case;
        end process;
    end rtl;
