library ieee;
use ieee.std_logic_1164.all;

entity mux2x8 is
    port(
        sadd    : in std_logic_vector(7 downto 0);
        barr    : in std_logic_vector(7 downto 0);
        barrinc : in std_logic;
        mux2pc  : out std_logic_vector(7 downto 0)
    );
end entity;

architecture escolha of mux2x8 is
begin
    mux2pc <= barr when barrinc = '0' else sadd;
    end architecture;