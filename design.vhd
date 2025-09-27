-- Circuito MUX 2x1bit conectado a DEMUX 1x2bit 
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity design is
port( 
  i_sel: in std_logic_vector(1 downto 0);     -- seletor    [mux (0), demux (1)]
  i_a: in std_logic;                          -- entrada a  [mux]
  i_b: in std_logic;                          -- entrada b  [mux]
  o_a: out std_logic;                         -- saída a    [demux]
  o_b: out std_logic);                        -- saída b    [demux]
end entity;

-- Arquitetura
architecture arch_design of design is
  -- Declaração de componentes
  component mux2_1bit is
  port(
    i_sel: in std_logic;
    i_a: in std_logic;
    i_b: in std_logic;
    o_q: out std_logic);
  end component;

  component demux1_2bit is
  port(
    i_sel: in std_logic;
    i_q: in std_logic;
    o_a: out std_logic;
    o_b: out std_logic);
  end component;

  -- Sinais temporários
  signal w_temp: std_logic;

  -- Instânciação dos componentes
  begin
  u_mux: mux2_1bit port map(
    i_sel => i_sel(0),
    i_a => i_a,
    i_b => i_b,
    o_q => w_temp);

  u_demux: demux1_2bit port map(
    i_sel => i_sel(1),
    i_q => w_temp,
    o_a => o_a,
    o_b => o_b);
end architecture; 