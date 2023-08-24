library ieee;
use ieee.std_logic_1164.all;

entity ou is
    port(
        contador_or : in  std_logic_vector(2 downto 0);
        out_or      : out std_logic_vector(10 downto 0)
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

architecture talvez of ou is
begin
    out_or(10) <= '1'; --barr/inc
    out_or(9) <= not(contador_or(2)) or contador_or(1) or not(contador_or(0)); --barr/pc
    out_or(8 downto 6) <= "010"; --ula_op
    out_or(5) <= not(contador_or(1)) and (contador_or(2) xor contador_or(0)); --pc_rw
    out_or(4) <= contador_or(2) and contador_or(1) and contador_or(0); --ac_rw
    out_or(3) <= '0'; --mem_rw
    out_or(2) <= (not(contador_or(1)) and (contador_or(2) xnor contador_or(0))) or (not(contador_or(2)) and contador_or(1) and contador_or(0)); --rem_rw
    out_or(1) <= (contador_or(2) and not(contador_or(0))) or (not(contador_or(2)) and not(contador_or(1)) and contador_or(0)); --rdm_rw
    out_or(0) <= not(contador_or(2)) and contador_or(1) and not(contador_or(0)); --ri_rw
end architecture;
