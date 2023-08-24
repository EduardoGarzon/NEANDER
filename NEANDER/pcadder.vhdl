library ieee;
use ieee.std_logic_1164.all;

entity pcadder is 
    port(
            x    : in  std_logic_vector(7 downto 0);
            y    : in  std_logic_vector(7 downto 0);
            sadd : out std_logic_vector(7 downto 0);
            cin  : in  std_logic;
            dump : out std_logic
    );
end entity;

architecture paievoluido of pcadder is 
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
        
        u_fadder0 : fadder1 port map(x(0), y(0), cin,  sadd(0), sCout(0));
        u_fadder1 : fadder1 port map(x(1), y(1), sCout(0),   sadd(1), sCout(1));
        u_fadder2 : fadder1 port map(x(2), y(2), sCout(1),   sadd(2), sCout(2));
        u_fadder3 : fadder1 port map(x(3), y(3), sCout(2),   sadd(3), sCout(3));
        u_fadder4 : fadder1 port map(x(4), y(4), sCout(3),   sadd(4), sCout(4));
        u_fadder5 : fadder1 port map(x(5), y(5), sCout(4),   sadd(5), sCout(5));
        u_fadder6 : fadder1 port map(x(6), y(6), sCout(5),   sadd(6), sCout(6));
        u_fadder7 : fadder1 port map(x(7), y(7), sCout(6),   sadd(7), dump);
end architecture;
