-- Testbench de MUX 2x1
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench_mux2_1 is
-- empty
end testbench_mux2_1; 

architecture tb of testbench is

-- Component DUT
component mux2_1bit is
port(
  i_sel: in std_logic;    -- entrada seletor
  i_a: in std_logic;      -- entrada a
  i_b: in std_logic;      -- entrada b
  o_q: out std_logic);    -- saída q
end mux2_1bit;

signal w_sel, w_a, w_b, w_q: std_logic;

begin
  -- Conecta no DUT
  DUT: mux2_1bit port map(w_sel, w_a, w_b, w_q);

  process
  begin
  	w_sel <= '0';
    w_a <= '0';
    w_b <= '0';
    wait for 1 ns;
    assert(w_q='0') report "Falhou em 0/0/0" severity error;
  
    w_sel <= '1';
    w_a <= '0';
    w_b <= '0';
    wait for 1 ns;
    assert(w_q='0') report "Falhou em 1/0/0" severity error;

	  w_sel <= '0';
    w_a <= '1';
    w_b <= '0';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 0/1/0" severity error;

	  w_sel <= '0';
    w_a <= '0';
    w_b <= '1';
    wait for 1 ns;
    assert(w_q='0') report "Falhou em 0/0/1" severity error;
    
    w_sel <= '1';
    w_a <= '1';
    w_b <= '0';
    wait for 1 ns;
    assert(w_q='0') report "Falhou em 1/1/0" severity error;
    
    w_sel <= '1';
    w_a <= '0';
    w_b <= '1';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 1/0/1" severity error;
    
    w_sel <= '0';
    w_a <= '1';
    w_b <= '1';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 0/1/1" severity error;
    
    w_sel <= '1';
    w_a <= '1';
    w_b <= '1';
    wait for 1 ns;
    assert(w_q='1') report "Falhou em 1/1/1" severity error;
    
    -- Zera entradas
    w_sel <= '0';
    w_a <= '0';
    w_b <= '0';

    assert false report "Teste feito." severity note;
    wait;
  end process;
end tb;
