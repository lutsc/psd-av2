-- Testbench de DEMUX 1x2bit
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench_demux1_2bit is
end entity;

architecture tb of testbench_demux1_2bit is

-- Componente DUT
component mux2_1bit is
port(
  i_sel: in std_logic;    -- entrada seletor
  i_a: in std_logic;      -- entrada a
  i_b: in std_logic;      -- entrada b
  o_q: out std_logic);    -- saída q
end component;

-- Sinais temporários
signal w_sel, w_q, w_a, w_b: std_logic;

begin
  -- Conectando os sinais no DUT
  DUT: demux1_2bit port map(w_sel, w_q, w_a, w_b);

  process
  begin
  	w_sel <= '0';
    w_q <= '0';
    wait for 1 ns;
    assert(w_a='0' and w_b='0') report "Falhou em 0/0" severity error;
    --assert(w_b='0') report "Falhou em 0/0" severity error;
  
    assert false report "Teste feito." severity note;
    wait;
  end process;
end tb;
