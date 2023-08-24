library ieee;
use ieee.std_logic_1164.all;

entity cu is
    port(
        dec2uc    : in std_logic_vector(10 downto 0);
        nz        : in std_logic_vector(1 downto 0);
        clear     : in std_logic;
        clock     : in std_logic;
        barr_ctrl : out std_logic_vector(10 downto 0)
    );
end entity;

architecture ctrl of cu is

    component nop is
        port(
            contador_nop  : in  std_logic_vector(2 downto 0);
            out_nop       : out std_logic_vector(10 downto 0)
        );
    end component;

    component sta is
        port(
            contador_sta  : in  std_logic_vector(2 downto 0);
            out_sta       : out std_logic_vector(10 downto 0)
        );
    end component;

    component lda is
        port(
            contador_lda : in  std_logic_vector(2 downto 0);
            out_lda      : out std_logic_vector(10 downto 0)
        );
    end component;

    component add is
        port(
            contador_add : in  std_logic_vector(2 downto 0);
            out_add      : out std_logic_vector(10 downto 0)
        );
    end component;

    component e is
        port(
            contador_and : in  std_logic_vector(2 downto 0);
            out_and      : out std_logic_vector(10 downto 0)
        );
    end component;

    component ou is
        port(
            contador_or : in  std_logic_vector(2 downto 0);
            out_or      : out std_logic_vector(10 downto 0)
        );
    end component;

    component nao is
        port(
            contador_not  : in  std_logic_vector(2 downto 0);
            out_not       : out std_logic_vector(10 downto 0)
        );
    end component;

    component jmp is
        port(
            contador_jmp : in  std_logic_vector(2 downto 0);
            out_jmp      : out std_logic_vector(10 downto 0)
        );
    end component;

    component hlt is 
        port(
                contador_hlt : in  std_logic_vector (2 downto 0);
                out_hlt      : out std_logic_vector (10 downto 0)
        );
    end component;

    component falsejnz is 
        port(
                contador_fjnz : in  std_logic_vector (2 downto 0);
                out_fjnz      : out std_logic_vector (10 downto 0)
        );
    end component;

    component contador is
        port(
		        clk, cl : in std_logic;
		        s       : out std_logic_vector(2 downto 0)
	    );
    end component;

    signal instr_nop : std_logic_vector(10 downto 0);
    signal instr_sta : std_logic_vector(10 downto 0);
    signal instr_lda : std_logic_vector(10 downto 0);
    signal instr_add : std_logic_vector(10 downto 0);
    signal instr_and : std_logic_vector(10 downto 0);
    signal instr_or  : std_logic_vector(10 downto 0);
    signal instr_not : std_logic_vector(10 downto 0);
    signal instr_jmp : std_logic_vector(10 downto 0);
    signal instr_jn  : std_logic_vector(10 downto 0);
    signal instr_jz  : std_logic_vector(10 downto 0);
    signal instr_hlt : std_logic_vector(10 downto 0);
    signal instr_jnz : std_logic_vector(10 downto 0);
    signal counter   : std_logic_vector(2 downto 0);

begin

    u_nop : nop      port map(counter, instr_nop);
    u_sta : sta      port map(counter, instr_sta);
    u_lda : lda      port map(counter, instr_lda);
    u_add : add      port map(counter, instr_add);
    u_and : e        port map(counter, instr_and);
    u_or  : ou       port map(counter, instr_or);
    u_not : nao      port map(counter, instr_not);
    u_jmp : jmp      port map(counter, instr_jmp);
    u_jnz : falsejnz port map(counter, instr_jnz);
    u_hlt : hlt      port map(counter, instr_hlt);
    u_cnt : contador port map(clock, clear, counter);

    barr_ctrl <= instr_nop  when dec2uc = "10000000000" else
                 instr_sta  when dec2uc = "01000000000" else
                 instr_lda  when dec2uc = "00100000000" else
                 instr_add  when dec2uc = "00010000000" else
                 instr_and  when dec2uc = "00001000000" else
                 instr_or   when dec2uc = "00000100000" else
                 instr_not  when dec2uc = "00000010000" else
                 instr_jmp  when dec2uc = "00000001000" else
                 instr_jmp  when dec2uc = "00000000100" and NZ = "10" else
                 instr_jmp  when dec2uc = "00000000010" and NZ = "01" else
                 instr_hlt  when dec2uc = "00000000001" else
                 instr_jnz  when dec2uc = "00000000100" else
                 instr_jnz  when dec2uc = "00000000010" else (others => 'Z');
end architecture;
