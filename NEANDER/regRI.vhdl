-- REGISTRADOR COM CARGA PARA 8 BITS
library ieee;
use ieee.std_logic_1164.all; 

entity regri is
    port(
	        in_ri  : in  std_logic_vector(7 downto 0);
	        clock  : in  std_logic;
			clear  : in  std_logic;
	        ri_rw  : in  std_logic;
	        out_ri : out std_logic_vector(7 downto 0)
        );
end entity;

architecture reg of regri is
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
	u_reg0: regCarga1bit port map(in_ri(0), clock, '1', clear, ri_rw, out_ri(0));
	u_reg1: regCarga1bit port map(in_ri(1), clock, '1', clear, ri_rw, out_ri(1));
	u_reg2: regCarga1bit port map(in_ri(2), clock, '1', clear, ri_rw, out_ri(2));
	u_reg3: regCarga1bit port map(in_ri(3), clock, '1', clear, ri_rw, out_ri(3));
	u_reg4: regCarga1bit port map(in_ri(4), clock, '1', clear, ri_rw, out_ri(4));
	u_reg5: regCarga1bit port map(in_ri(5), clock, '1', clear, ri_rw, out_ri(5));
	u_reg6: regCarga1bit port map(in_ri(6), clock, '1', clear, ri_rw, out_ri(6));
	u_reg7: regCarga1bit port map(in_ri(7), clock, '1', clear, ri_rw, out_ri(7));
	
end architecture;
