library ieee;
use ieee.std_logic_1164.all;

entity contador is
	port(
		clk, cl : in std_logic;
		s       : out std_logic_vector(2 downto 0)
	);
end entity;

architecture ihavenoideawhatimdoing of contador is
	constant clk_period : time := 20 ns;
	component ffjk_process is
	    port(
		j, k   : in std_logic;
		clk    : in std_logic;
		pr, cl : in std_logic;
		q, nq  : out std_logic
	    );
	end component;
	signal saida1, saida2, saida3 : std_logic;
begin
	ff0 : ffjk_process port map('1', '1', clk, '1', cl, saida1);
	ff1 : ffjk_process port map('1', '1', saida1, '1', cl, saida2);
	ff2 : ffjk_process port map('1', '1', saida2, '1', cl, saida3);
	
	s(0) <= saida1;
	s(1) <= saida2;
	s(2) <= saida3;
	
end architecture;
