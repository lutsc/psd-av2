-- Testbench de MUX 2x1
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- Component DUT
component mux2_1bit is
port(
  i_sel: in std_logic;    -- entrada seletor
  i_a: in std_logic;      -- entrada a
  i_b: in std_logic;      -- entrada b
  o_q: out std_logic);    -- saída q
end mux2_1bit;

signal sel_in, a_in, b_in, q_out: std_logic;

begin

  -- Conecta no DUT
  DUT: mux2_1bit port map(i_sel, i_a, i_b, o_q);

  process
  begin
  	i_sel <= '0';
    i_a <= '0';
    i_b <= '0';
    wait for 1 ns;
    assert(o_q='0') report "Falhou em 0/0/0" severity error;
  
    i_sel <= '1';
    i_a <= '0';
    i_b <= '0';
    wait for 1 ns;
    assert(o_q='0') report "Falhou em 1/0/0" severity error;

	i_sel <= '0';
    i_a <= '1';
    i_b <= '0';
    wait for 1 ns;
    assert(o_q='1') report "Falhou em 0/1/0" severity error;

	i_sel <= '0';
    i_a <= '0';
    i_b <= '1';
    wait for 1 ns;
    assert(o_q='0') report "Falhou em 0/0/1" severity error;
    
    i_sel <= '1';
    i_a <= '1';
    i_b <= '0';
    wait for 1 ns;
    assert(o_q='0') report "Falhou em 1/1/0" severity error;
    
    i_sel <= '1';
    i_a <= '0';
    i_b <= '1';
    wait for 1 ns;
    assert(o_q='1') report "Falhou em 1/0/1" severity error;
    
    i_sel <= '0';
    i_a <= '1';
    i_b <= '1';
    wait for 1 ns;
    assert(o_q='1') report "Falhou em 0/1/1" severity error;
    
    i_sel <= '1';
    i_a <= '1';
    i_b <= '1';
    wait for 1 ns;
    assert(o_q='1') report "Falhou em 1/1/1" severity error;
    
    -- Zera entradas
    i_sel <= '0';
    i_a <= '0';
    i_b <= '0';

    assert false report "Teste feito." severity note;
    wait;
  end process;
end tb;
