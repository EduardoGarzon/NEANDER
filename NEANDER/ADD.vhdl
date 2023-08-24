library ieee;
use ieee.std_logic_1164.all;

entity add is
    port(
        contador_add : in  std_logic_vector(2 downto 0);
        out_add      : out std_logic_vector(10 downto 0)
        --10: barr/inc
        --9:  barr/pc
        --8:  ula_op(2)
        --7:  ula_op(1)
        --6:  ula_op(0)
        --5:  pc_rw
        --4:  ac_rw
        --3:  mem_rw
        --2:  rem_rw
        --1:  rdm_rw
        --0:  ri_rw
    );
end entity;

architecture sum of add is
begin                                 
    out_add(10) <= '1'; --barr/inc
    out_add(9) <= not(contador_add(2)) or contador_add(1) or not(contador_add(0)); --barr/pc
    out_add(8 downto 6) <= "001"; --ula_op
    out_add(5) <= not(contador_add(1)) and (contador_add(2) xor contador_add(0)); --pc_rw
    out_add(4) <= contador_add(2) and contador_add(1) and contador_add(0); --ac_rw
    out_add(3) <= '0'; --mem_rw
    out_add(2) <= (not(contador_add(1)) and (contador_add(2) xnor contador_add(0))) or (not(contador_add(2)) and contador_add(1) and contador_add(0)); --rem_rw
    out_add(1) <= (contador_add(2) and not(contador_add(0))) or (not(contador_add(2)) and not(contador_add(1)) and contador_add(0)); --rdm_rw
    out_add(0) <= not(contador_add(2)) and contador_add(1) and not(contador_add(0)); --ri_rw
end architecture;
