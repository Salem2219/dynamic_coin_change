library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity compgr4 is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end compgr4;

architecture rtl of compgr4 is
    begin
        y <= '1' when unsigned(a) > unsigned(b) else '0';
    end rtl;