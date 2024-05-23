library ieee;
use ieee.std_logic_1164.all;

entity mux_invert is
  port (b,nB : in std_logic;
  		sel: in std_logic;
  s: out std_logic);
end mux_invert;

architecture arch_mux_invert of mux_invert is
begin
  with sel select --sel e a expressao de selecao
  s <= b when '0',
  	nB when others;
end arch_mux_invert;