library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port (e1, e2,e3,e4: in std_logic;
  		sel: in std_logic_vector (1 downto 0);
  s: out std_logic);
end mux;

architecture arch_mux of mux is
begin
  with sel select --sel e a expressao de selecao
  s <= e1 when "00",
  	e2 when "01",
    e3 when "10",
    e4 when others;
  
end arch_mux;