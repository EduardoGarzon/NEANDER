-- Detector NZ
library ieee;
use ieee.std_logic_1164.all;

entity NZ is
    port (
            datain_nz : in  std_logic_vector(7 downto 0);
            saida_nz  : out std_logic_vector(1 downto 0)
    );
end entity;

architecture detectorNZ of NZ is
begin
      
    saida_nz(1) <= datain_nz(7);
    saida_nz(0) <= not(datain_nz(7)) and not(datain_nz(6)) and not(datain_nz(5)) and not(datain_nz(4)) and not(datain_nz(3)) and not(datain_nz(2)) and
                   not(datain_nz(1)) and not(datain_nz(0));    
end architecture;
