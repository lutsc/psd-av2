-- DEMUX 1x4bit
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity demux1_4bit is
port(
  i_sel: in std_logic_vector(1 downto 0);     -- entrada seletor
  i_q: in std_logic;                          -- entrada q
  o_a: out std_logic;                         -- saída a
  o_b: out std_logic;                         -- saída b
  o_c: out std_logic;                         -- saída c
  o_d: out std_logic);                        -- saída d
end entity;

-- Arquitetura
architecture arch_demux1_4bit of demux1_4bit is
  -- Declaração de componentes
  component demux1_2bit is
  port(
    i_sel: in std_logic;                      -- entrada seletor
    i_q: in std_logic;                        -- entrada q
    o_a: out std_logic;                       -- saída a
    o_b: out std_logic);                      -- saída b
  end component;

  -- Sinais temporários
  signal w_temp0, w_temp1: std_logic;

  -- Instânciação dos componentes
  begin
  u_0: demux1_2bit port map(
    i_sel => i_sel(0),
    i_q => i_q,
    o_a => w_temp0,
    o_b => w_temp1);

  u_1: demux1_2bit port map(
    i_sel => i_sel(1),
    i_q => w_temp0,
    o_a => o_a,
    o_b => o_b);

  u_2: demux1_2bit port map(
    i_sel => i_sel(1),
    i_q => w_temp1,
    o_a => o_c,
    o_b => o_d);
end architecture;