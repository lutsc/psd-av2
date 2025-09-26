-- Circuito MUX 2x1bit conectado a DEMUX 1x2bit 
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity mux2_1_demux1_2bit is
port( 
  i_sel0: in std_logic;     -- seletor [mux]
  i_sel1: in std_logic;     -- seletor [demux]
  i_a: in std_logic;                          -- entrada a [mux]
  i_b: in std_logic;                          -- entrada b [mux]
  i_q: in std_logic;                          -- saída q   [mux]
  o_q: in std_logic;                          -- entrada q [demux]
  o_x: out std_logic;                         -- saída x   [demux]
  o_y: out std_logic);                        -- saída q   [demux]
end mux2_1_demux1_2bit;

-- Arquitetura
architecture arch_mux2_1_demux1_2bit of mux2_1_demux1_2bit is
  -- Declaração de componentes
  component mux2_1bit is
  port(
    i_sel: in std_logic;                      -- entrada seletor
    i_a: in std_logic;                        -- entrada a
    i_b: in std_logic;                        -- entrada b
    o_q: out std_logic);                      -- saída q
  end component;

  component demux1_2bit is
  port(
    i_sel: in std_logic;                      -- entrada seletor
    i_q: in std_logic;                        -- entrada q
    o_a: out std_logic;                       -- saída a
    o_b: out std_logic);                      -- saída b
  end component;

  -- Sinais temporários
  --signal w_temp0, w_temp1: std_logic;

  -- Instânciação dos componentes
  begin
  u_0: mux1_2bit port map(
    i_sel => i_sel(0),
    i_q => i_q,
    o_a => w_temp0,
    o_b => w_temp1);

  u_1: demux1_2bit port map(
    i_sel => i_sel1,
    i_q => w_temp0,
    o_a => o_a,
    o_b => o_b);
end arch_mux2_1_demux1_2bit; 