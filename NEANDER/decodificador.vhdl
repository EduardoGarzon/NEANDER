library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
	port(
		opcode : in  std_logic_vector(7 downto 0);
		instr  : out std_logic_vector(10 downto 0)
		-- 1  =  nop
		-- 2  =  sta
		-- 3  =  lda
		-- 4  =  add
		-- 5  =  or
		-- 6  =  and
		-- 7  =  not
		-- 8  =  jmp
		-- 9  =  jn
		-- 10 =  jz
		-- 11 =  hlt
	);
end entity;

architecture decode of decodificador is

begin
	instr <= "10000000000" when opcode = "00000000" else
		"01000000000" when opcode = "00010000" else
		"00100000000" when opcode = "00100000" else
		"00010000000" when opcode = "00110000" else
		"00001000000" when opcode = "01000000" else
		"00000100000" when opcode = "01010000" else
		"00000010000" when opcode = "01100000" else
		"00000001000" when opcode = "10000000" else
		"00000000100" when opcode = "10010000" else
		"00000000010" when opcode = "10100000" else
		"00000000001" when opcode = "11110000" else (others => 'Z');

end architecture;
