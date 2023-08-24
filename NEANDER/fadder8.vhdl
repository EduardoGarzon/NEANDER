library ieee;
use ieee.std_logic_1164.all;

entity fadder8 is 
    port(
            A_fadder8     : in  std_logic_vector(7 downto 0);
            B_fadder8     : in  std_logic_vector(7 downto 0);
            Cin_geral     : in  std_logic;
            Saida_fadder8 : out std_logic_vector(7 downto 0);
            Cout_geral    : out std_logic
    );
end entity;

architecture paievoluido of fadder8 is 
    component fadder1 is
        port(
            A_fadder1     : in  std_logic;
            B_fadder1     : in  std_logic;
            Cin           : in  std_logic;
            Saida_fadder1 : out std_logic; 
            Cout          : out std_logic        
        );
    end component;
    
    signal sCout : std_logic_vector(7 downto 0);
begin       
        
        u_fadder0 : fadder1 port map(A_fadder8(0), B_fadder8(0), Cin_geral,  Saida_fadder8(0), sCout(0));
        u_fadder1 : fadder1 port map(A_fadder8(1), B_fadder8(1), sCout(0),   Saida_fadder8(1), sCout(1));
        u_fadder2 : fadder1 port map(A_fadder8(2), B_fadder8(2), sCout(1),   Saida_fadder8(2), sCout(2));
        u_fadder3 : fadder1 port map(A_fadder8(3), B_fadder8(3), sCout(2),   Saida_fadder8(3), sCout(3));
        u_fadder4 : fadder1 port map(A_fadder8(4), B_fadder8(4), sCout(3),   Saida_fadder8(4), sCout(4));
        u_fadder5 : fadder1 port map(A_fadder8(5), B_fadder8(5), sCout(4),   Saida_fadder8(5), sCout(5));
        u_fadder6 : fadder1 port map(A_fadder8(6), B_fadder8(6), sCout(5),   Saida_fadder8(6), sCout(6));
        u_fadder7 : fadder1 port map(A_fadder8(7), B_fadder8(7), sCout(6),   Saida_fadder8(7), Cout_geral);
end architecture;
