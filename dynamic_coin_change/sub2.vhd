library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity sub2 is
    port (a, b : in std_logic_vector(1 downto 0);
    y : out std_logic_vector(1 downto 0));
end sub2;

architecture rtl of sub2 is
    signal y_uns : unsigned(1 downto 0);
    begin
        y_uns <= unsigned(a) - unsigned(b);
        y <= std_logic_vector(y_uns);
    end rtl;