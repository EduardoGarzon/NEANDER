library ieee;
use ieee.std_logic_1164.all;

entity hlt is 
    port(
            contador_hlt : in  std_logic_vector (2 downto 0);
            out_hlt      : out std_logic_vector (10 downto 0)
    );
end entity;

architecture halt of hlt is 
begin
    out_hlt(10) <= '1';
    out_hlt(9) <= '1';
    out_hlt(8 downto 6) <= "000";
    out_hlt(5) <= '0';
    out_hlt(4) <= '0';
    out_hlt(3) <= '0';
    out_hlt(2) <= '0';
    out_hlt(1) <= '0';
    out_hlt(0) <= '0';
end architecture;
