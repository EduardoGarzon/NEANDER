library ieee;
use ieee.std_logic_1164.all;

entity nop is
    port(
        contador_nop  : in  std_logic_vector(2 downto 0);
        out_nop       : out std_logic_vector(10 downto 0)
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

architecture nada of nop is
begin
    out_nop(10) <= '1'; --barr/inc
    out_nop(9) <= '1'; --barr/pc
    out_nop(8 downto 6) <= "000"; --ula_op
    out_nop(5) <= not(contador_nop(2)) and not(contador_nop(1)) and contador_nop(0); --pc_rw
    out_nop(4) <= '0'; --ac_rw
    out_nop(3) <= '0'; --mem_rw
    out_nop(2) <= not(contador_nop(2)) and not(contador_nop(1)) and not(contador_nop(0)); --rem_rw
    out_nop(1) <= not(contador_nop(2)) and not(contador_nop(1)) and contador_nop(0); --rdm_rw
    out_nop(0) <= not(contador_nop(2)) and contador_nop(1) and not(contador_nop(0)); --ri_rw
end architecture;
