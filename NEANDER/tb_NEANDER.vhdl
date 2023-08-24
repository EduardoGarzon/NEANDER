library ieee;
use ieee.std_logic_1164.all;

entity tb_neander is
end entity;

architecture teste of tb_neander is
constant nada : time := 20 ns;

    component neander is 
        port(
                clear : in std_logic;
                clock : in std_logic
        );
    end component;

    signal scl : std_logic;
    signal sclk : std_logic := '0';

begin

    sclk <= not(sclk) after nada/2;

    u_neander : neander port map(scl, sclk);

    u_teste : process
    begin

        scl <= '0';
        wait for nada;
        scl <= '1';
        wait;
    end process;
end architecture;