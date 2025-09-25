-- DEMUX 1x2
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity demux1_2bit is
port(
  i_sel: in std_logic;      -- entrada seletor
  i_q: in std_logic;        -- entrada q
  o_a: out std_logic;       -- saída a
  o_b: out std_logic);      -- saída b
end demux1_2bit;

architecture arch_demux1_2bit of demux1_2bit is
begin
  process(i_sel, i_q) is
  begin
    if(i_sel = '0') then
        o_a <= i_q
    elsif(i_sel = '1') then
        o_b <= i_q
    end if;
  end process;
end arch_demux1_2bit;