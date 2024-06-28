library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjk is
    -- entidade vazia
end tb_ffjk;

architecture test of tb_ffjk is
    constant CLK_PERIOD : time := 20 ns;
    
    component ffjk is
        port(
            j, k : in bit;
            clock : in bit;
            pr, cl : in bit;
            q, nq : out bit
            );
    end component;
    
    signal sj, sk, spr, scl, sq, snq : bit;
    signal sclk : bit := '1';
    
begin
    -- instancia de JK e port map
    u_tbffjk : ffjk port map(sj, sk, sclk, spr, scl, sq, snq);
    
    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        sj <= '0';
        sk <= '0';
        
        wait for CLK_PERIOD;
        
        -- desativação de clear
        spr <= '1';
        scl <= '1';
        sj <= '0';
        sk <= '0';
        
        wait for CLK_PERIOD;
        
        -- alteração de J e K
        sj <= '1';
        
        wait for CLK_PERIOD;
        
        sk <= '1';
        
        wait for CLK_PERIOD;
        
        sj <= '0';
        
        wait for CLK_PERIOD;
        
    end process;
    
    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
    
end architecture test;
