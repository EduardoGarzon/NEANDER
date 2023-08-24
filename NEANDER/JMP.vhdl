library ieee;
use ieee.std_logic_1164.all;

entity jmp is
    port(
        contador_jmp : in  std_logic_vector(2 downto 0);
        out_jmp      : out std_logic_vector(10 downto 0)
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

architecture pula of jmp is
begin
    out_jmp(10) <= not(contador_jmp(2)) or (not(contador_jmp(1)) and not(contador_jmp(0))) or contador_jmp(1); --barr/inc
    out_jmp(9) <= '1'; --barr/pc
    out_jmp(8 downto 6) <= "000"; --ula_op
    out_jmp(5) <= not(contador_jmp(1)) and contador_jmp(0); --pc_rw
    out_jmp(4) <= '0'; --ac_rw
    out_jmp(3) <= '0'; --mem_rw
    out_jmp(2) <= (not(contador_jmp(2)) and not(contador_jmp(1)) and not(contador_jmp(0))) or (not(contador_jmp(2)) and contador_jmp(1) and contador_jmp(0)); --rem_rw
    out_jmp(1) <= (contador_jmp(2) and not(contador_jmp(1)) and not(contador_jmp(0))) or (not(contador_jmp(2)) and not(contador_jmp(1)) and contador_jmp(0)); --rdm_rw
    out_jmp(0) <= not(contador_jmp(2)) and contador_jmp(1) and not(contador_jmp(0)); --ri_rw
end architecture;
