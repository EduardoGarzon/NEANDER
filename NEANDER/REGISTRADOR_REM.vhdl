-- REGISTRADOR COM CARGA PARA 8 BITS - REM
library ieee;
use ieee.std_logic_1164.all; 

entity registradorREM is
    port(
	        entrada_REM : in  std_logic_vector(7 downto 0);
	        clk         : in  std_logic;
	        pr,cl       : in  std_logic;
	        rw_REM_MAR  : in  std_logic;
	        saida_REM   : out std_logic_vector(7 downto 0)
        );
end entity;

architecture regrem of registradorREM is

component regCarga1bit is
    port(
        entrada_reg1bit  : in  std_logic;
        clk              : in  std_logic;
        pr, cl           : in  std_logic;
        nrw_reg1bit      : in  std_logic;
        saida_reg1bit    : out std_logic
    );
end component;

	
begin
	u_reg0REM: regCarga1bit port map(entrada_REM(0), clk, '1', cl, rw_REM_MAR, saida_REM(0));
	u_reg1REM: regCarga1bit port map(entrada_REM(1), clk, '1', cl, rw_REM_MAR, saida_REM(1));
	u_reg2REM: regCarga1bit port map(entrada_REM(2), clk, '1', cl, rw_REM_MAR, saida_REM(2));
	u_reg3REM: regCarga1bit port map(entrada_REM(3), clk, '1', cl, rw_REM_MAR, saida_REM(3));
	u_reg4REM: regCarga1bit port map(entrada_REM(4), clk, '1', cl, rw_REM_MAR, saida_REM(4));
	u_reg5REM: regCarga1bit port map(entrada_REM(5), clk, '1', cl, rw_REM_MAR, saida_REM(5));
	u_reg6REM: regCarga1bit port map(entrada_REM(6), clk, '1', cl, rw_REM_MAR, saida_REM(6));
	u_reg7REM: regCarga1bit port map(entrada_REM(7), clk, '1', cl, rw_REM_MAR, saida_REM(7));
	
end architecture;
