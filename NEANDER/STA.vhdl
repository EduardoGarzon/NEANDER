library ieee;
use ieee.std_logic_1164.all;

entity sta is
    port(
        contador_sta  : in  std_logic_vector(2 downto 0);
        out_sta       : out std_logic_vector(10 downto 0)
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

architecture salva of sta is
begin
    out_sta(10) <= '1'; --barr/inc
    out_sta(9) <= not(contador_sta(2) and not contador_sta(1) and contador_sta(0)); --barr/pc
    out_sta(8 downto 6) <= "000"; --ula_op
    out_sta(5) <= not(contador_sta(1)) and (contador_sta(2) xor contador_sta(0)); --pc_rw
    out_sta(4) <= '0'; --ac_rw
    out_sta(3) <= contador_sta(2) and contador_sta(1) and not(contador_sta(0)); --mem_rw
    out_sta(2) <= (not(contador_sta(2)) and (contador_sta(1) xnor contador_sta(0))) or (not(contador_sta(1)) and contador_sta(2) and contador_sta(0)); --rem_rw
    out_sta(1) <= not(contador_sta(1)) and (contador_sta(2) xor contador_sta(0)); --rdm_rw
    out_sta(0) <= not(contador_sta(2)) and contador_sta(1) and not(contador_sta(0)); --ri_rw
end architecture;
