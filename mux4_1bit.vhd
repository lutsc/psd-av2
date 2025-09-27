-- MUX 4x1bit
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity mux4_1bit is
port( 
  i_sel: in std_logic_vector(1 downto 0);     -- entrada seletor [0 para 1° e 2° mux, 1 para 3° mux]
  i_a: in std_logic;                          -- entrada a
  i_b: in std_logic;                          -- entrada b
  i_d: in std_logic;                          -- entrada d
  i_c: in std_logic;                          -- entrada c
  o_q: out std_logic);                        -- saída q
end entity;

-- Arquitetura
architecture arch_mux4_1bit of mux4_1bit is
  -- Declaração de componentes
  component mux2_1bit is
  port(
    i_sel: in std_logic;                      -- entrada seletor
    i_a: in std_logic;                        -- entrada a
    i_b: in std_logic;                        -- entrada b
    o_q: out std_logic);                      -- saída q
  end component;

  -- Sinais temporários
  signal w_temp: std_logic_vector(1 downto 0);

  -- Instânciação dos componentes
  begin
  u_0: mux2_1bit port map(
    i_sel => i_sel(0),
    i_a => i_a,
    i_b => i_b,
    o_q => w_temp(0));

  u_1: mux2_1bit port map(
    i_sel => i_sel(0),
    i_a => i_c,
    i_b => i_d,
    o_q => w_temp(1));

  u_3: mux2_1bit port map(
    i_sel => i_sel(1),
    i_a => w_temp(0),
    i_b => w_temp(1),
    o_q => o_q);
end architecture;