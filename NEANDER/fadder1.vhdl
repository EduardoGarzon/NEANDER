library ieee;
use ieee.std_logic_1164.all;

entity fadder1 is
    port(
            A_fadder1     : in  std_logic;
            B_fadder1     : in  std_logic;
            Cin           : in  std_logic;
            Saida_fadder1 : out std_logic; 
            Cout          : out std_logic        
    );
end entity;

architecture paidefamilia of fadder1 is
begin
    Saida_fadder1 <= (A_fadder1 xor B_fadder1) xor Cin;
    Cout          <= (A_fadder1 and Cin) or (B_fadder1 and Cin) or (A_fadder1 and B_fadder1);
end architecture; 
