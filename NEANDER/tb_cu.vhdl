library ieee;
use ieee.std_logic_1164.all;

entity tb_cu is
end entity;

architecture teste of tb_cu is
    constant nada : time := 20 ns;

    component modulo_controle is
        port(
            dec2uc    : in std_logic_vector(10 downto 0);
            nz        : in std_logic_vector(1 downto 0);
            clear     : in std_logic;
            clock     : in std_logic;
            barr_ctrl : out std_logic_vector(10 downto 0)
        );
    end component;

    signal s_dec2uc : std_logic_vector(10 downto 0);
    signal s_nz     : std_logic_vector(1 downto 0);
    signal scl      : std_logic;
    signal sclk : std_logic := '0';
    signal s_barrctrl : std_logic_vector(10 downto 0);

begin

    sclk <= not(sclk) after nada/2;
    u_cu : modulo_controle port map(s_dec2uc, s_nz, scl, sclk, s_barrctrl);
    u_teste : process

    begin

        scl <= '0';
        wait for nada;
        scl <= '1';

        s_dec2uc <= "10000000000";
        wait for 8*nada;
        
        s_dec2uc <= "00000000001";
        wait for 8*nada;

        s_dec2uc <= "00001000000";
        wait for 8*nada;

        s_dec2uc <= "00000000100";
        wait for 8*nada;
        wait;
    end process;

end architecture;