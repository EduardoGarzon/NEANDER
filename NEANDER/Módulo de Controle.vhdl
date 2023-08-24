library ieee;
use ieee.std_logic_1164.all;

entity modulo_controle is
    port(
        instr_in : in std_logic_vector(7 downto 0);
        nz       : in std_logic_vector(1 downto 0);
        clear    : in std_logic;
        clock    : in std_logic;
        barr_ctrl : out std_logic_vector(10 downto 0)
    );
end entity;

architecture controle of modulo_controle is

    component regri is
        port(
                in_ri  : in  std_logic_vector(7 downto 0);
                clock  : in  std_logic;
                clear  : in  std_logic;
                ri_rw  : in  std_logic;
                out_ri : out std_logic_vector(7 downto 0)
            );
    end component;

    component decodificador is
        port(
            opcode : in  std_logic_vector(7 downto 0);
            instr  : out std_logic_vector(10 downto 0)
        );
    end component;

    component cu is
        port(
            dec2uc    : in std_logic_vector(10 downto 0);
            nz        : in std_logic_vector(1 downto 0);
            clear     : in std_logic;
            clock     : in std_logic;
            barr_ctrl : out std_logic_vector(10 downto 0)
        );
    end component;

    signal s_barrctrl : std_logic_vector(10 downto 0);
    signal s_dec2uc   : std_logic_vector(10 downto 0);
    signal s_ri2dec   : std_logic_vector(7 downto 0);

begin

    barr_ctrl <= s_barrctrl;
    u_cu  : cu port map(s_dec2uc, nz, clear, clock, s_barrctrl);
    u_dec : decodificador port map(s_ri2dec, s_dec2uc);
    u_reg : regri port map(instr_in, clock, clear, s_barrctrl(0), s_ri2dec);

end architecture;