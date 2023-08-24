-- REGISTRADOR COM CARGA PARA 8 BITS - FLAGS
library ieee;
use ieee.std_logic_1164.all; 

entity reg_flags is
    port(
	        entrada_flags : in  std_logic_vector(1 downto 0);
	        clk           : in  std_logic;
	        pr, cl        : in  std_logic;
	        nrw_flags     : in  std_logic;
	        saida_flags   : out std_logic_vector(1 downto 0)
        );
end entity;

architecture reg8bit of reg_flags is
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
	u_reg0: regCarga1bit port map(entrada_flags(0), clk, '1', cl, nrw_flags, saida_flags(0));
	u_reg1: regCarga1bit port map(entrada_flags(1), clk, cl, '1', nrw_flags, saida_flags(1));
end architecture;
