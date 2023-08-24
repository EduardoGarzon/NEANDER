-- REGISTRADOR COM CARGA PARA 8 BITS - RDM
library ieee;
use ieee.std_logic_1164.all; 

entity registradorRDM is
    port(
	        entrada_RDM : in  std_logic_vector(7 downto 0);
	        clk         : in  std_logic;
	        pr,cl       : in  std_logic;
	        rw_RDM_MBR  : in  std_logic;
	        saida_RDM   : out std_logic_vector(7 downto 0)
        );
end entity;

architecture regrdm of registradorRDM is
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
	u_reg0RDM: regCarga1bit port map(entrada_RDM(0), clk, '1', cl, rw_RDM_MBR, saida_RDM(0));
	u_reg1RDM: regCarga1bit port map(entrada_RDM(1), clk, '1', cl, rw_RDM_MBR, saida_RDM(1));
	u_reg2RDM: regCarga1bit port map(entrada_RDM(2), clk, '1', cl, rw_RDM_MBR, saida_RDM(2));
	u_reg3RDM: regCarga1bit port map(entrada_RDM(3), clk, '1', cl, rw_RDM_MBR, saida_RDM(3));
	u_reg4RDM: regCarga1bit port map(entrada_RDM(4), clk, '1', cl, rw_RDM_MBR, saida_RDM(4));
	u_reg5RDM: regCarga1bit port map(entrada_RDM(5), clk, '1', cl, rw_RDM_MBR, saida_RDM(5));
	u_reg6RDM: regCarga1bit port map(entrada_RDM(6), clk, '1', cl, rw_RDM_MBR, saida_RDM(6));
	u_reg7RDM: regCarga1bit port map(entrada_RDM(7), clk, '1', cl, rw_RDM_MBR, saida_RDM(7));
	
end architecture;
