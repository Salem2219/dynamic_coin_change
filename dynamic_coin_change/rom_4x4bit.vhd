library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity rom_4x4bit is
port(addr: in std_logic_vector (1 downto 0);
data: out std_logic_vector (3 downto 0));
end rom_4x4bit;
architecture rtl of rom_4x4bit is
type rom_type is array (0 to 3) of
std_logic_vector (3 downto 0);
constant program : rom_type := (
"0000", -- any number
"1010", -- 10
"0110", -- 6
"0001"); -- 1

begin
data <= program(conv_integer(unsigned(addr)));
end rtl;