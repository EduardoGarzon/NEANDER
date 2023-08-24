library ieee;
use ieee.std_logic_1164.all;

entity tb_modulomemoria is
end entity;


architecture teste of tb_modulomemoria is 
     
     constant clock_period : time := 20 ns;   
     component ModuloMemoria is
        port (
            interface_barramento_memoria : inout    std_logic_vector(7 downto 0);
            endereco_PC2mux              : in       std_logic_vector(7 downto 0);
            endereco_barramento2mux      : in       std_logic_vector(7 downto 0);
            sel_barr_pc_mem              : in       std_logic;
            rw_REM_MAR                   : in       std_logic;
            notrw_mem                    : in       std_logic;
            rw_RDM_MBR                   : in       std_logic;
            cl                           : in       std_logic;
            clk                          : in       std_logic
    );
    end component;
    signal sinterface_barramento_memoria : std_logic_vector(7 downto 0);
    signal sendereco_PC2mux              : std_logic_vector(7 downto 0);
    signal sendereco_barramento2mux      : std_logic_vector(7 downto 0);

    signal ssel_barr_pc_mem              : std_logic;
    signal srw_REM_MAR                   : std_logic;
    signal snotrw_mem                    : std_logic;
    signal srw_RDM_MBR                   : std_logic;

    signal sclear                        : std_logic;
    signal sclock                        : std_logic := '0'; 
begin
    u_memoria : ModuloMemoria port map(sinterface_barramento_memoria, sendereco_PC2mux, sendereco_barramento2mux, ssel_barr_pc_mem,
                                       srw_REM_MAR, snotrw_mem, srw_RDM_MBR, sclear, sclock);
    
    sclock <= not(sclock) after clock_period/2;

    u_tb : process
    begin
        sclear <= '0';
        wait for clock_period;
        sclear <= '1';

        -- leitura de intrucao memoria 240 com dado 0
        sendereco_PC2mux <= "11110000"; 
        ssel_barr_pc_mem <= '1'; 
        srw_REM_MAR      <= '1';
        snotrw_mem       <= '0';  
        srw_RDM_MBR      <= '0';
        wait for clock_period;

        srw_REM_MAR <= '0';
        srw_RDM_MBR <= '1';
        wait for clock_period;

        srw_RDM_MBR <= '0';
        wait for clock_period;
        
        -- gravacao de dado no endereco 240 recebe 10
        sendereco_barramento2mux <= "11110000";
        ssel_barr_pc_mem <= '0'; 
        srw_REM_MAR      <= '1'; 
        snotrw_mem       <= '0';   
        srw_RDM_MBR      <= '0';     
        wait for clock_period;

        srw_REM_MAR      <= '0'; 
        snotrw_mem       <= '1';   
        sinterface_barramento_memoria <= "00001010";
        wait for clock_period;

        snotrw_mem       <= '0';
        wait for clock_period;   


        --leitura de dado na memoria 240 com dado 10
        sendereco_barramento2mux <= "11110000";
        ssel_barr_pc_mem <= '0'; 
        srw_REM_MAR      <= '1';
        snotrw_mem       <= '0'; 
        srw_RDM_MBR      <= '0';
        wait for clock_period;

        srw_REM_MAR      <= '0';
        srw_RDM_MBR      <= '1';
        wait for clock_period;

        srw_RDM_MBR      <= '0';
        wait for clock_period;
    wait;
    end process;
    
end architecture;
