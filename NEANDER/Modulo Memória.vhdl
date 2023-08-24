library ieee;
use ieee.std_logic_1164.all;

entity modulo_memoria is
    port (
            barramento_mem : inout    std_logic_vector(7 downto 0);
            pc2mem         : in       std_logic_vector(7 downto 0);
            barr2mux       : in       std_logic_vector(7 downto 0);
            barrpc         : in       std_logic;
            rem_rw         : in       std_logic;
            mem_rw         : in       std_logic;
            rdm_rw         : in       std_logic;
            clear          : in       std_logic;
            clock          : in       std_logic
    );
end entity;

architecture trabalhodesd of modulo_memoria is

--MUX2X8

component mux2x8memoria is
    port(
         endereco_PC2mux          : in   std_logic_vector(7 downto 0);
         endereco_barramento2mux  : in   std_logic_vector(7 downto 0);
         sel_barr_pc2mux          : in   std_logic;
         saida_muxmem             : out  std_logic_vector(7 downto 0)
    );
end component;

--REGISTRADOR 8 BITS REM

component registradorREM is
    port(
	        entrada_REM : in  std_logic_vector(7 downto 0);
	        clk         : in  std_logic;
	        pr,cl       : in  std_logic;
	        rw_REM_MAR  : in  std_logic;
	        saida_REM   : out std_logic_vector(7 downto 0)
        );
end component;

--MEMORIA 256X8

component as_ram is
	port(
		addr  : in    std_logic_vector(7 downto 0);
		data  : inout std_logic_vector(7 downto 0);
		notrw : in    std_logic;
		reset : in    std_logic;
        clock : in    std_logic
	);
end component as_ram;

--REGISTRADOR 8 BITS RDM

component registradorRDM is
    port(
	        entrada_RDM : in  std_logic_vector(7 downto 0);
	        clk         : in  std_logic;
	        pr,cl       : in  std_logic;
	        rw_RDM_MBR  : in  std_logic;
	        saida_RDM   : out std_logic_vector(7 downto 0)
        );
end component;

--criando sinais:

--sinal do mux para a rem

signal s_mux2rem: std_logic_vector(7 downto 0);

--sinal da rem para a memória 

signal s_rem2mem: std_logic_vector(7 downto 0);

--sinal da memoria para a rdm 

signal s_mem2rdm: std_logic_vector(7 downto 0);

--sinal da rdm para o mux especial q é meio q o barramento

signal s_rdm2barramento: std_logic_vector(7 downto 0);

begin

--mux especial 

barramento_mem <= s_rdm2barramento when mem_rw = '0' else (others => 'Z');
s_mem2rdm <= barramento_mem when mem_rw = '1' else (others => 'Z');

--fazer as instancias 

u_mux2x8memoria     : mux2x8memoria     port map(pc2mem, barr2mux, barrpc, s_mux2rem);
u_registradorREM    : registradorREM    port map(s_mux2rem, clock,'1', clear, rem_rw, s_rem2mem);
u_as_ram            : as_ram            port map(s_rem2mem, s_mem2rdm, mem_rw, clear, clock);
u_registradorRDM    : registradorRDM    port map(s_mem2rdm, clock,'1', clear, rdm_rw, s_rdm2barramento);

end architecture;



