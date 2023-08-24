library ieee;
use ieee.std_logic_1164.all;

entity lda is
    port(
        contador_lda : in  std_logic_vector(2 downto 0);
        out_lda      : out std_logic_vector(10 downto 0)
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

architecture load of lda is
begin
    out_lda(10) <= '1'; --barr/inc
    out_lda(9) <= not(contador_lda(2)) or contador_lda(1) or not(contador_lda(0)); --barr/pc
    out_lda(8 downto 6) <= "000"; --ula_op
    out_lda(5) <= not(contador_lda(1)) and (contador_lda(2) xor contador_lda(0)); --pc_rw
    out_lda(4) <= contador_lda(2) and contador_lda(1) and contador_lda(0); --ac_rw
    out_lda(3) <= '0'; --mem_rw
    out_lda(2) <= (not(contador_lda(1)) and (contador_lda(2) xnor contador_lda(0))) or (not(contador_lda(2)) and contador_lda(1) and contador_lda(0)); --rem_rw
    out_lda(1) <= (contador_lda(2) and not(contador_lda(0))) or (not(contador_lda(2)) and not(contador_lda(1)) and contador_lda(0)); --rdm_rw
    out_lda(0) <= not(contador_lda(2)) and contador_lda(1) and not(contador_lda(0)); --ri_rw
end architecture;
