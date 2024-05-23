library ieee;
use ieee.std_logic_1164.all;

entity porta_or is

  port (a, b: in std_logic;
  s: out std_logic);
  
end porta_or;

architecture arch_porta_or of porta_or is
begin
  s<= a or b;
  
end arch_porta_or;