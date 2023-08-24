-- Modulo Neander
library ieee;
use ieee.std_logic_1164.all;

entity neander is 
    port(
            clear : in std_logic;
            clock : in std_logic
    );
end entity;

-- COMPONENTES ----------------------------------------------------------
architecture modulo of neander is 
    component modulo_pc is
        port(
            barr      : in std_logic_vector(7 downto 0);
            barrinc   : in std_logic;
            pc_rw     : in std_logic;
            clear     : in std_logic;
            clock     : in std_logic;
            endpc2mem : out std_logic_vector(7 downto 0)
        );
    end component;

-- MODULO DE MEMORIA
    component modulo_memoria is
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
    end component;

-- MODULO ULA
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

-- MODULO DE CONTROLE/PROGRAM COUNTER
    component modulo_controle is
        port(
            instr_in : in std_logic_vector(7 downto 0);
            nz       : in std_logic_vector(1 downto 0);
            clear    : in std_logic;
            clock    : in std_logic;
            barr_ctrl : out std_logic_vector(10 downto 0)
        );
    end component;

-- SINAIS --------
    signal barr_data_instr : std_logic_vector(7 downto 0);
    signal barr_ctrl       : std_logic_vector(10 downto 0);
    signal flags2uc        : std_logic_vector(1 downto 0);
    signal pc2mem          : std_logic_vector(7 downto 0);

begin
    
    u_ula     : modulo_ula port map(barr_data_instr, barr_ctrl(3), barr_ctrl(4), clear, clock, barr_ctrl(8 downto 6), flags2uc);
    u_memoria : modulo_memoria port map(barr_data_instr, pc2mem, barr_data_instr, barr_ctrl(9), barr_ctrl(2), barr_ctrl(3), barr_ctrl(1), clear, clock);
    u_ctrl    : modulo_controle port map(barr_data_instr, flags2uc, clear, clock, barr_ctrl);
    u_pc      : modulo_pc port map(barr_data_instr, barr_ctrl(10), barr_ctrl(5), clear, clock, pc2mem);

end architecture;
