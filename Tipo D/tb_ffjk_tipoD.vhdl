library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjkd is
    -- entidade vazia
end tb_ffjkd;

architecture test of tb_ffjkd is
    constant CLK_PERIOD : time := 20 ns;
    
    component ffjkd is
        port(
            d, j, k : in bit;
            clock : in bit;
            pr, cl : in bit;
            q, nq : out bit
            );
    end component;
    
    signal sd, sj, sk, spr, scl, sq, snq : bit;
    signal sclk : bit := '1';
    
begin
    -- instancia de JK e port map
    u_tbffjkd : ffjkd port map(sd, sj, sk, sclk, spr, scl, sq, snq);
    
    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sd <= '0';
        
        wait for CLK_PERIOD;
        
        -- desativação de clear
        spr <= '1';
        scl <= '1';
        
        wait for CLK_PERIOD;
        
        -- alteração de J e K
        sd <= '1';
        
        wait for CLK_PERIOD;
        
        spr <= '0';
        wait for CLK_PERIOD;
        
        spr <= '1';
        wait for CLK_PERIOD;
        
        
        sd <= '0';
        
        wait for CLK_PERIOD;
        
    end process;
    
    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
    
end architecture test;
