-- MUX 2 para 1
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1bit is
port(
  i_sel: in std_logic; -- entrada seletor
  i_a: in std_logic; -- entrada a
  i_b: in std_logic; -- entrada b
  o_q: out std_logic); -- saída q
end mux2_1bit;

architecture arch_1 of mux2_1bit is
begin
  process(sel, a, b) is
  begin
    q <= (a and not sel) or (b and sel);
  end process;
end arch_1;