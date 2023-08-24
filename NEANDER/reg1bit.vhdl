-- REGISTRADOR DE 1 BIT 
library ieee;
use ieee.std_logic_1164.all; 

entity regCarga1bit is
    port(
        entrada_reg1bit : in  std_logic;
        clk              : in  std_logic;
        pr, cl           : in  std_logic;
        nrw_reg1bit      : in  std_logic;
        saida_reg1bit    : out std_logic
    );
end entity;

architecture reg1bit of regCarga1bit is
    component FFJKD is
        port(
            entrada_ffjkd : in  std_logic;
            clk           : in  std_logic;
            pr, cl        : in  std_logic;
            q, nq         : out std_logic
        );
    end component;
    
    signal reg1bit_datain, reg1bit_dataout : std_logic;

begin
	saida_reg1bit <= reg1bit_dataout;
	
	reg1bit_datain <= entrada_reg1bit when nrw_reg1bit = '1' else reg1bit_dataout when nrw_reg1bit = '0' else 'Z';
	
	u_reg: FFJKD port map(reg1bit_datain, clk, '1', cl, reg1bit_dataout);
end architecture;
