-- MUX 2x1
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity mux2_1bit is
port(
  i_sel: in std_logic;      -- entrada seletor
  i_a: in std_logic;        -- entrada a
  i_b: in std_logic;        -- entrada b
  o_q: out std_logic);      -- saída q
end mux2_1bit;

architecture arch_mux2_1bit of mux2_1bit is
begin
  process(i_sel, i_a, i_b) is
  begin
    o_q <= (i_a and not i_sel) or (i_b and i_sel);
  end process;
end arch_mux2_1bit;