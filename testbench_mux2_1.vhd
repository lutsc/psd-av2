-- Testbench para MUX 2 para 1
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component mux2_1bit is
port(
  i_sel: in std_logic; -- entrada seletor
  i_a: in std_logic; -- entrada a
  i_b: in std_logic; -- entrada b
  o_q: out std_logic); -- saída q
end mux2_1bit;

signal sel_in, a_in, b_in, q_out: std_logic;

begin

  -- Connect DUT
  DUT: mux2_1bit port map(sel_in, a_in, b_in, q_out);

  process
  begin
  	sel_in <= '0';
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    assert(q_out='0') report "Fail 0/0/0" severity error;
  
    sel_in <= '1';
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    assert(q_out='0') report "Fail 1/0/0" severity error;

	sel_in <= '0';
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    assert(q_out='1') report "Fail 0/1/0" severity error;

	sel_in <= '0';
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    assert(q_out='0') report "Fail 0/0/1" severity error;
    
    sel_in <= '1';
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    assert(q_out='0') report "Fail 1/1/0" severity error;
    
    sel_in <= '1';
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    assert(q_out='1') report "Fail 1/0/1" severity error;
    
    sel_in <= '0';
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    assert(q_out='1') report "Fail 0/1/1" severity error;
    
    sel_in <= '1';
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    assert(q_out='1') report "Fail 1/1/1" severity error;
    
    -- Clear inputs
    sel_in <= '0';
    a_in <= '0';
    b_in <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
