-- REGISTRADOR COM CARGA PARA 8 BITS
library ieee;
use ieee.std_logic_1164.all; 

entity regpc is
    port(
	        mux2pc  : in std_logic_vector(7 downto 0);
	        clock   : in std_logic;
			clear   : in std_logic;
	        pc_rw   : in std_logic;
	        pcatual : out std_logic_vector(7 downto 0)
        );
end entity;

architecture reg of regpc is
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
	u_reg0: regCarga1bit port map(mux2pc(0), clock, '1', clear, pc_rw, pcatual(0));
	u_reg1: regCarga1bit port map(mux2pc(1), clock, '1', clear, pc_rw, pcatual(1));
	u_reg2: regCarga1bit port map(mux2pc(2), clock, '1', clear, pc_rw, pcatual(2));
	u_reg3: regCarga1bit port map(mux2pc(3), clock, '1', clear, pc_rw, pcatual(3));
	u_reg4: regCarga1bit port map(mux2pc(4), clock, '1', clear, pc_rw, pcatual(4));
	u_reg5: regCarga1bit port map(mux2pc(5), clock, '1', clear, pc_rw, pcatual(5));
	u_reg6: regCarga1bit port map(mux2pc(6), clock, '1', clear, pc_rw, pcatual(6));
	u_reg7: regCarga1bit port map(mux2pc(7), clock, '1', clear, pc_rw, pcatual(7));
	
end architecture;
