-- DEMUX 1x2bit
library IEEE;
use IEEE.std_logic_1164.all;

-- Entidade
entity demux1_2bit is
port(
  i_sel: in std_logic;    -- entrada seletor
  i_q: in std_logic;      -- entrada q
  o_a: out std_logic;     -- saída a
  o_b: out std_logic);    -- saída b
end entity;

-- Arquitetura
architecture arch_demux1_2bit of demux1_2bit is
begin
  o_a <= i_q when i_sel='0' else '0';
  o_b <= i_q when i_sel='1' else '0';
end architecture;