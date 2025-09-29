-- Testbench de MUX 4x1bit
library IEEE;
use IEEE.std_logic_1164.all;

-- Entidade
entity testbench_mux4_1bit is
end entity; 

-- Arquitetura
architecture tb of testbench_mux4_1bit is

-- Componente para DUT
component mux4_1bit is
port( 
  i_sel: in std_logic_vector(1 downto 0);     -- entrada seletor [0 para 1° e 2° mux, 1 para 3° mux]
  i_a: in std_logic;                          -- entrada a
  i_b: in std_logic;                          -- entrada b
  i_c: in std_logic;                          -- entrada d
  i_d: in std_logic;                          -- entrada c
  o_q: out std_logic);                        -- saída q
end component;

-- Sinais temporários
signal w_sel: std_logic_vector(1 downto 0);
signal w_a, w_b, w_c, w_d, w_q: std_logic;

begin
  -- Conectando os sinais no DUT
  DUT: mux4_1bit port map(
    i_sel => w_sel,
    i_a => w_a,
    i_b => w_b,
    i_c => w_c,
    i_d => w_d,
    o_q => w_q);

  process
  begin
  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_a <= '0';
    w_b <= '0';
    w_c <= '0';
    w_d <= '0';
    wait for 1 ns;
    assert(w_q='0') report "Falhou em 0/0/0/0/0/0" severity error;

  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_a <= '1';
    w_b <= '0';
    w_c <= '0';
    w_d <= '0';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 0/0/1/0/0/0" severity error;

  	w_sel(0) <= '1';
  	w_sel(1) <= '0';
    w_a <= '0';
    w_b <= '1';
    w_c <= '0';
    w_d <= '0';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 1/0/0/1/0/0" severity error;

  	w_sel(0) <= '0';
  	w_sel(1) <= '1';
    w_a <= '0';
    w_b <= '0';
    w_c <= '1';
    w_d <= '0';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 0/1/0/0/1/0" severity error;

  	w_sel(0) <= '1';
  	w_sel(1) <= '1';
    w_a <= '0';
    w_b <= '0';
    w_c <= '0';
    w_d <= '1';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 1/1/0/0/0/1" severity error;

    -- Zerando entradas
  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_a <= '0';
    w_b <= '0';
    w_c <= '0';
    w_d <= '0';

    assert false report "Teste feito." severity note;
    wait;
  end process;
end architecture;