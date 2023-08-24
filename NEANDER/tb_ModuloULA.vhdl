library ieee;
use ieee.std_logic_1164.all;

entity tb_moduloula is
end entity;

architecture teste of tb_moduloula is 

    constant clock_period : time := 20 ns;
    
    component modulo_ula is
        port (
                interface_barramento : inout std_logic_vector(7 downto 0);
                mem_rw               : in    std_logic;
                ac_rw                : in    std_logic;
                clear                : in    std_logic;
                clock                : in    std_logic;
                ula_op               : in    std_logic_vector(2 downto 0);
                interface_flags      : out   std_logic_vector(1 downto 0)
        );
    end component;
    signal sinterface_barramento : std_logic_vector(7 downto 0);
    signal smem_notrw            : std_logic;
    signal sAC_notrw             : std_logic;
    signal srst                  : std_logic;
    signal sclock                : std_logic := '0'; 
    signal sULA_operador         : std_logic_vector(2 downto 0);
    signal sinterface_flags      : std_logic_vector(1 downto 0);
  
begin
    u_moduloULA : modulo_ula port map(sinterface_barramento, smem_notrw, sAC_notrw, srst, sclock, sULA_operador, sinterface_flags);

    sclock <= not(sclock) after clock_period/2;
 
    u_tb : process
    begin
        
        srst <= '0';
        wait for clock_period; 
        srst <= '1';
        
        sinterface_barramento <= "10000000";
        sULA_operador         <= "000";
        smem_notrw            <= '0'; -- 
        sAC_notrw             <= '1';
        wait for clock_period;

        sinterface_barramento <= "00000000";
        sULA_operador         <= "001";        
        sAC_notrw             <= '0';
        wait for clock_period;

        sULA_operador         <= "100";        
        sAC_notrw             <= '1';
        wait for clock_period;

    wait;
    end process;

end architecture;
