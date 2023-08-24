library ieee;
use ieee.std_logic_1164.all;

entity ulalu is 
    port (
            x_ulalu     : in  std_logic_vector(7 downto 0);
            y_ulalu     : in  std_logic_vector(7 downto 0);
            saida_ulalu : out std_logic_vector(7 downto 0);
            ULA_op      : in  std_logic_vector(2 downto 0);    
            nz_ulalu    : out std_logic_vector(1 downto 0)
    );
end entity;

architecture modulo of ulalu is
    
    -- fadder8  
    component fadder8 is 
        port(
                A_fadder8     : in  std_logic_vector(7 downto 0);
                B_fadder8     : in  std_logic_vector(7 downto 0);
                Cin_geral     : in  std_logic;
                Saida_fadder8 : out std_logic_vector(7 downto 0);
                Cout_geral    : out std_logic
        );
    end component;

    -- componente mux5x8
    component mux5x8 is
        port(
                c0        : in  std_logic_vector(7 downto 0);
                c1        : in  std_logic_vector(7 downto 0);
                c2        : in  std_logic_vector(7 downto 0);
                c3        : in  std_logic_vector(7 downto 0);
                c4        : in  std_logic_vector(7 downto 0);
                sel       : in  std_logic_vector(2 downto 0);
                saida_mux : out std_logic_vector(7 downto 0)
        );
    end component;

    -- componente Detector NZ
    component NZ is
        port (
                datain_nz : in  std_logic_vector(7 downto 0);
                saida_nz  : out std_logic_vector(1 downto 0)
        );
    end component;
    

    signal ssaida_mux     : std_logic_vector(7 downto 0); -- signal mux5x8 
    signal sSaida_fadder8 : std_logic_vector(7 downto 0); -- signal fadder8
    signal sCout_geral    : std_logic;                    -- signal fadder8
    signal ssaida_nz      : std_logic_vector(1 downto 0); -- signal NZ
    
    signal snot           : std_logic_vector(7 downto 0); -- signal porta not
    signal sand           : std_logic_vector(7 downto 0); -- signal porta and
    signal sor            : std_logic_vector(7 downto 0); -- signal porta or
begin
    snot        <= not(x_ulalu);        -- porta not
    sand        <= x_ulalu and y_ulalu; -- porta and
    sor         <= x_ulalu or y_ulalu;  -- porta or
    saida_ulalu <= ssaida_mux;
    nz_ulalu    <= ssaida_nz;
    
    u_fadder8 : fadder8 port map (x_ulalu, y_ulalu, '0', sSaida_fadder8, sCout_geral);    
    u_mux     : mux5x8  port map (y_ulalu, sSaida_fadder8, sor, sand, snot, ULA_op, ssaida_mux);
    u_NZ      : NZ      port map (ssaida_mux, ssaida_nz);

end architecture;
