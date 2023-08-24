library ieee;
use ieee.std_logic_1164.all;

entity falsejnz is 
    port(
            contador_fjnz : in  std_logic_vector (2 downto 0);
            out_fjnz      : out std_logic_vector (10 downto 0)
    );
end entity;

architecture zero of falsejnz is 
begin
    out_fjnz(10) <= '1'; --barr/inc
    out_fjnz(9) <= '1'; --barr/pc
    out_fjnz(8 downto 6) <= "000"; --ula_op
    out_fjnz(5) <= not(contador_fjnz(2)) and contador_fjnz(0); --pc_rw
    out_fjnz(4) <= '0'; --ac_rw
    out_fjnz(3) <= '0'; --mem_rw
    out_fjnz(2) <= not(contador_fjnz(2)) and not(contador_fjnz(1)) and not(contador_fjnz(0)); --rem_rw
    out_fjnz(1) <= not(contador_fjnz(2)) and not(contador_fjnz(1)) and contador_fjnz(0); --rdm_rw
    out_fjnz(0) <= not(contador_fjnz(2)) and contador_fjnz(1) and not(contador_fjnz(0)); --ri_rw

end architecture;
