library ieee;
use ieee.std_logic_1164.all;

entity mux2x8memoria is
    port(
         endereco_PC2mux          : in   std_logic_vector(7 downto 0);
         endereco_barramento2mux  : in   std_logic_vector(7 downto 0);
         sel_barr_pc2mux          : in   std_logic;
         saida_muxmem             : out  std_logic_vector(7 downto 0)
    );
end entity;

architecture muxmem of mux2x8memoria is
begin

saida_muxmem <= endereco_barramento2mux when sel_barr_pc2mux <= '0' else endereco_PC2mux;

end architecture;
