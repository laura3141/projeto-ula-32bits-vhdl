library ieee;
use ieee.std_logic_1164.all;

entity porta_not is

  port (a: in std_logic;
  s: out std_logic);
  
end porta_not;

architecture arch_porta_not of porta_not is
begin
  s<= not a;
  
end arch_porta_not;