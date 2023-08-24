-- FFJK TIPO D
library ieee;
use ieee.std_logic_1164.all; -- std_logic para detectar erros


entity FFJKD is
    port(
        entrada_ffjkd : in  std_logic;
        clk           : in  std_logic;
        pr, cl        : in  std_logic;
        q, nq         : out std_logic
    );
end entity;

architecture latch of FFJKD is
    component ffjk_process is
        port(
            j, k   : in  std_logic;
            clk    : in  std_logic;
            pr, cl : in  std_logic;
            q, nq  : out std_logic
        );
    end component;

    signal sq  : std_logic := '0'; -- opcional -> valor inicial
    signal snq : std_logic := '1';
    signal nj  : std_logic;
begin

    nj <= not(entrada_ffjkd);
    u_td : ffjk_process port map(entrada_ffjkd, nj, clk, pr, cl, q, nq);

end architecture;
