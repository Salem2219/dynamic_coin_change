library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity x_or is
    port (a, b : in std_logic;
    y : out std_logic);
end x_or;

architecture rtl of x_or is
    begin
        y <= a or b;
    end rtl;