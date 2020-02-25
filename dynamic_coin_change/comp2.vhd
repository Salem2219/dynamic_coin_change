library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp2 is
    port (a ,b : in std_logic_vector(1 downto 0);
    y : out std_logic);
end comp2;

architecture rtl of comp2 is
    begin
        y <= '1' when a = b else '0';
    end rtl;