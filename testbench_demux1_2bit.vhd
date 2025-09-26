-- Testbench de DEMUX 1x2bit
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench_demux1_2bit is
end entity;

architecture tb of testbench_demux1_2bit is

-- Componente DUT
component demux1_2bit is
port(
  i_sel: in std_logic;    -- entrada seletor
  i_q: in std_logic;      -- entrada q
  o_a: out std_logic;     -- saída a
  o_b: out std_logic);    -- saída b
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
  
    w_sel <= '0';
    w_q <= '1';
    wait for 1 ns;
    assert(w_a='1' and w_b='0') report "Falhou em 0/1" severity error;

    w_sel <= '1';
    w_q <= '1';
    wait for 1 ns;
    assert(w_a='0' and w_b='1') report "Falhou em 1/1" severity error;
  
    w_sel <= '1';
    w_q <= '0';
    wait for 1 ns;
    assert(w_a='0' and w_b='0') report "Falhou em 1/0" severity error;

    -- Zera entradas
    w_sel <= '0';
    w_q <= '0';

    assert false report "Teste feito." severity note;
    wait;
  end process;
end tb;
