library ieee;
use ieee.std_logic_1164.all;

entity nao is
    port(
        contador_not  : in  std_logic_vector(2 downto 0);
        out_not       : out std_logic_vector(10 downto 0)
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

architecture nunca of nao is
begin
    out_not(10) <= '1'; --barr/inc
    out_not(9) <= '1'; --barr/pc
    out_not(8 downto 6) <= "100"; --ula_op
    out_not(5) <= not(contador_not(2)) and not(contador_not(1)) and contador_not(0); --pc_rw
    out_not(4) <= contador_not(2) and contador_not(1) and (contador_not(0)); --ac_rw
    out_not(3) <= '0'; --mem_rw
    out_not(2) <= not(contador_not(2)) and not(contador_not(1)) and not(contador_not(0)); --rem_rw
    out_not(1) <= not(contador_not(2)) and not(contador_not(1)) and contador_not(0); --rdm_rw
    out_not(0) <= not(contador_not(2)) and contador_not(1) and not(contador_not(0)); --ri_rw
end architecture;
