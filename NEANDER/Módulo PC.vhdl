library ieee;
use ieee.std_logic_1164.all;

entity modulo_pc is
    port(
        barr      : in std_logic_vector(7 downto 0);
        barrinc   : in std_logic;
        pc_rw     : in std_logic;
        clear     : in std_logic;
        clock     : in std_logic;
        endpc2mem : out std_logic_vector(7 downto 0)
    );
end entity;

architecture counter of modulo_pc is

-- ADDER
    component pcadder is 
        port(
                x    : in  std_logic_vector(7 downto 0);
                y    : in  std_logic_vector(7 downto 0);
                sadd : out std_logic_vector(7 downto 0);
                cin  : in  std_logic;
                dump : out std_logic
        );
    end component;

-- REGISTRADOR
    component regpc is
        port(
                mux2pc  : in std_logic_vector(7 downto 0);
                clock   : in std_logic;
                clear   : in std_logic;
                pc_rw   : in std_logic;
                pcatual : out std_logic_vector(7 downto 0)
            );
    end component;

-- MUX
    component mux2x8 is
        port(
            sadd    : in std_logic_vector(7 downto 0);
            barr    : in std_logic_vector(7 downto 0);
            barrinc : in std_logic;
            mux2pc  : out std_logic_vector(7 downto 0)
        );
    end component;

    signal ssadd    : std_logic_vector(7 downto 0);
    signal smux2pc  : std_logic_vector(7 downto 0);
    signal spcatual : std_logic_vector(7 downto 0);
    signal sdump   : std_logic;

begin

    u_add : pcadder port map("00000001", spcatual, ssadd, '0', sdump);
    u_mux : mux2x8 port map(ssadd, barr, barrinc, smux2pc);
    u_reg : regpc port map(smux2pc, clock, clear, pc_rw, spcatual);
    endpc2mem <= spcatual;
end architecture;
