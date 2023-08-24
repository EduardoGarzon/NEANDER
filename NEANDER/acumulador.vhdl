-- REGISTRADOR COM CARGA PARA 8 BITS - ACUMULADOR
library ieee;
use ieee.std_logic_1164.all; 

entity acumulador is
    port(
	        entrada_ac : in  std_logic_vector(7 downto 0);
	        clk        : in  std_logic;
	        pr, cl     : in  std_logic;
	        nrw_ac     : in  std_logic;
	        saida_ac   : out std_logic_vector(7 downto 0)
        );
end entity;

architecture reg8bit of acumulador is
	component regCarga1bit is
	    port(
            entrada_reg1bit : in  std_logic;
            clk             : in  std_logic;
            pr, cl          : in  std_logic;
            nrw_reg1bit     : in  std_logic;
            saida_reg1bit   : out std_logic
        );
	end component;
	
begin
	u_reg0: regCarga1bit port map(entrada_ac(0), clk, '1', cl, nrw_ac, saida_ac(0));
	u_reg1: regCarga1bit port map(entrada_ac(1), clk, '1', cl, nrw_ac, saida_ac(1));
	u_reg2: regCarga1bit port map(entrada_ac(2), clk, '1', cl, nrw_ac, saida_ac(2));
	u_reg3: regCarga1bit port map(entrada_ac(3), clk, '1', cl, nrw_ac, saida_ac(3));
	u_reg4: regCarga1bit port map(entrada_ac(4), clk, '1', cl, nrw_ac, saida_ac(4));
	u_reg5: regCarga1bit port map(entrada_ac(5), clk, '1', cl, nrw_ac, saida_ac(5));
	u_reg6: regCarga1bit port map(entrada_ac(6), clk, '1', cl, nrw_ac, saida_ac(6));
	u_reg7: regCarga1bit port map(entrada_ac(7), clk, '1', cl, nrw_ac, saida_ac(7));
	
end architecture;
