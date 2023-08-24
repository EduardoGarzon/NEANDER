library ieee;
use ieee.std_logic_1164.all;

entity modulo_ula is
    port (
            interface_barramento : inout std_logic_vector(7 downto 0);
            mem_rw               : in    std_logic;
            ac_rw                : in    std_logic;
            clear                : in    std_logic;
            clock                : in    std_logic;
            ula_op               : in    std_logic_vector(2 downto 0);
            interface_flags      : out   std_logic_vector(1 downto 0)
    );
end entity;

architecture modulo of modulo_ula is
   
   -- Registrador Acumulador
   component acumulador is
       port(
	        entrada_ac : in  std_logic_vector(7 downto 0);
	        clk        : in  std_logic;
	        pr, cl     : in  std_logic;
	        nrw_ac     : in  std_logic;
	        saida_ac   : out std_logic_vector(7 downto 0)
        );
   end component;

   -- Registrador de FLAGS
   component reg_flags is
        port(
	        entrada_flags : in  std_logic_vector(1 downto 0);
	        clk           : in  std_logic;
	        pr, cl        : in  std_logic;
	        nrw_flags     : in  std_logic;
	        saida_flags   : out std_logic_vector(1 downto 0)
        );
    end component;

    -- ULA ALU
    component ulalu is 
        port (
            x_ulalu     : in  std_logic_vector(7 downto 0);
            y_ulalu     : in  std_logic_vector(7 downto 0);
            saida_ulalu : out std_logic_vector(7 downto 0);
            ULA_op      : in  std_logic_vector(2 downto 0);    
            nz_ulalu    : out std_logic_vector(1 downto 0)
        );
    end component;

    -- sinal acumulador para mux    
    signal s_ac2ula   : std_logic_vector(7 downto 0);
    -- sinal saida da ULA para o acumulador    
    signal s_ula2ac   : std_logic_vector(7 downto 0);
    -- sinal ac(detector NZ) para o reg de flags 
    signal s_ac2flags : std_logic_vector(1 downto 0);

begin
    interface_barramento <= s_ac2ula when mem_rw='1' else (others => 'Z');

    u_ula        : ulalu      port map(s_ac2ula, interface_barramento, s_ula2ac, ula_op, s_ac2flags);
    u_acumulador : acumulador port map(s_ula2ac, clock, '1', clear, ac_rw, s_ac2ula);
    u_flags      : reg_flags  port map(s_ac2flags, clock, '1', clear, ac_rw, interface_flags);
    
end architecture;
