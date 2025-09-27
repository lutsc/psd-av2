-- Testbench de DEMUX 1x4bit
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench_demux1_4bit is
end entity; 

-- Arquitetura
architecture tb of testbench_demux1_4bit is

-- Componente para DUT
component demux1_4bit is
port(
  i_sel: in std_logic_vector(1 downto 0);     -- entrada seletor [0 para 1° demux, 1 para 2° e 3° demux]
  i_q: in std_logic;                          -- entrada q
  o_a: out std_logic;                         -- saída a
  o_b: out std_logic;                         -- saída b
  o_c: out std_logic;                         -- saída c
  o_d: out std_logic);                        -- saída d
end component;

-- Sinais temporários
signal w_sel: std_logic_vector(1 downto 0);
signal w_q, w_a, w_b, w_c, w_d: std_logic;

begin
  -- Conectando os sinais no DUT
  DUT: demux1_4bit port map(
    i_sel => w_sel,
    i_q => w_q,
    o_a => w_a,
    o_b => w_b,
    o_c => w_c,
    o_d => w_d);

  process
  begin
  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_q <= '0';
    wait for 1 ns;
    assert(w_a='0' and w_b='0' and w_c='0' and w_d='0') report "Falhou em 0/0/0" severity error;

  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_q <= '1';
    wait for 1 ns;
    assert(w_a='1' and w_b='0' and w_c='0' and w_d='0') report "Falhou em 0/0/1" severity error;

  	w_sel(0) <= '0';
  	w_sel(1) <= '1';
    w_q <= '1';
    wait for 1 ns;
    assert(w_a='0' and w_b='1' and w_c='0' and w_d='0') report "Falhou em 0/1/1" severity error;

  	w_sel(0) <= '1';
  	w_sel(1) <= '0';
    w_q <= '1';
    wait for 1 ns;
    assert(w_a='0' and w_b='0' and w_c='1' and w_d='0') report "Falhou em 1/0/1" severity error;

  	w_sel(0) <= '1';
  	w_sel(1) <= '1';
    w_q <= '1';
    wait for 1 ns;
    assert(w_a='0' and w_b='0' and w_c='0' and w_d='1') report "Falhou em 1/0/1" severity error;

    -- Zerando entradas
  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_q <= '0';

    assert false report "Teste feito." severity note;
    wait;
  end process;
end architecture;
