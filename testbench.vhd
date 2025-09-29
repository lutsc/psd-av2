-- Testbench do circuito principal 
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
end entity; 

-- Arquitetura
architecture tb of testbench is
  
-- Componente para DUT
component design is
port(
i_sel: in std_logic_vector(1 downto 0);     -- seletor    [mux (0), demux (1)]
i_a: in std_logic;                          -- entrada a  [mux]
i_b: in std_logic;                          -- entrada b  [mux]
o_a: out std_logic;                         -- saída a    [demux]
o_b: out std_logic);                        -- saída b    [demux]
end component;

-- Sinais temporários
signal w_sel: std_logic_vector(1 downto 0);
signal w_a, w_b, w_x, w_y: std_logic;

begin
  -- Conectando os sinais no DUT
  DUT: design port map(
    i_sel => w_sel,
    i_a => w_a,
    i_b => w_b,
    o_a => w_x,
    o_b => w_y);

  process
  begin
  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_a <= '0';
    w_b <= '0';
    wait for 1 ns;
    assert(w_x='0' and w_y='0') report "Falhou em 0/0/0/0" severity error;

  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_a <= '1';
    w_b <= '0';
    wait for 1 ns;
    assert(w_x='1' and w_y='0') report "Falhou em 0/0/1/0" severity error;

  	w_sel(0) <= '0';
  	w_sel(1) <= '1';
    w_a <= '1';
    w_b <= '0';
    wait for 1 ns;
    assert(w_x='0' and w_y='1') report "Falhou em 0/1/1/0" severity error;    

  	w_sel(0) <= '1';
  	w_sel(1) <= '0';
    w_a <= '0';
    w_b <= '1';
    wait for 1 ns;
    assert(w_x='1' and w_y='0') report "Falhou em 1/0/0/1" severity error;

  	w_sel(0) <= '1';
  	w_sel(1) <= '1';
    w_a <= '0';
    w_b <= '1';
    wait for 1 ns;
    assert(w_x='0' and w_y='1') report "Falhou em 1/1/0/1" severity error;

    -- Zerando entradas
  	w_sel(0) <= '0';
  	w_sel(1) <= '0';
    w_a <= '0';
    w_b <= '0';

    assert false report "Teste feito." severity note;
    wait;
  end process;
end architecture;