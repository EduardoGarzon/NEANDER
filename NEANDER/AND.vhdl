library ieee;
use ieee.std_logic_1164.all;

entity e is
    port(
        contador_and : in  std_logic_vector(2 downto 0);
        out_and      : out std_logic_vector(10 downto 0)
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

architecture osdois of e is
begin
    out_and(10) <= '1'; --barr/inc
    out_and(9) <= not(contador_and(2)) or contador_and(1) or not(contador_and(0)); --barr/pc
    out_and(8 downto 6) <= "011"; --ula_op
    out_and(5) <= not(contador_and(1)) and (contador_and(2) xor contador_and(0)); --pc_rw
    out_and(4) <= contador_and(2) and contador_and(1) and contador_and(0); --ac_rw
    out_and(3) <= '0'; --mem_rw
    out_and(2) <= (not(contador_and(1)) and (contador_and(2) xnor contador_and(0))) or (not(contador_and(2)) and contador_and(1) and contador_and(0)); --rem_rw
    out_and(1) <= (contador_and(2) and not(contador_and(0))) or (not(contador_and(2)) and not(contador_and(1)) and contador_and(0)); --rdm_rw
    out_and(0) <= not(contador_and(2)) and contador_and(1) and not(contador_and(0)); --ri_rw
end architecture;
