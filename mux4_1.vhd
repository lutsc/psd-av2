-- MUX 4x1
library IEEE;
use IEEE.std_logic_1164.all;

-- Declaração das entradas e saídas
entity mux4_1bit is
port( 
  i_sel0: in std_logic;   -- entrada seletor0
  i_sel1: in std_logic;   -- entrada seletor1
  i_a: in std_logic;      -- entrada a
  i_b: in std_logic;      -- entrada b
  i_c: in std_logic;      -- entrada c
  i_d: in std_logic;      -- entrada d
  o_q: out std_logic);    -- saída q
end mux4_1bit;

architecture arch_1 of mux4_1bit is
  -- Declaração de componentes
  component mux2_1bit is
  port(
    sel: in std_logic;  -- entrada seletor
    a: in std_logic;    -- entrada a
    b: in std_logic;    -- entrada b
    q: out std_logic);  -- saída q
  end component;

  -- Sinais temporários
  signal temp0, temp1: std_logic;

  -- Instânciação dos componentes
  begin
  u_0: mux2_1bit port map(
    sel = i_sel0,
    a => i_a,
    b => i_b,
    temp0 => o_q);

  u_1: mux2_1bit port map(
    sel = i_sel0,
    a => i_c,
    b => i_d,
    temp1 => o_q);

  u_3: mux2_1bit port map(
    sel = i_sel1,
    a => temp0;
    b => temp1;
    q => o_q);
end arch_1;