library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjkt is
    -- entidade vazia
end tb_ffjkt;

architecture test of tb_ffjkt is
    constant CLK_PERIOD : time := 20 ns;
    
    component ffjkt is
        port(
            t, j, k : in bit;
            clock : in bit;
            pr, cl : in bit;
            q, nq : out bit
            );
    end component;
    
    signal st, sj, sk, spr, scl, sq, snq : bit;
    signal sclk : bit := '1';
    
begin
    -- instancia de JK e port map
    u_tbffjkt : ffjkt port map(st, sj, sk, sclk, spr, scl, sq, snq);
    
    -- process
    tbp : process
    begin
        spr <= '1';
        scl <= '0';
        st <= '0';
        
        wait for CLK_PERIOD;
        
        -- desativação de clear
        scl <= '1';
        
        wait for CLK_PERIOD;
        
        -- alteração de J e K
        st <= '1';
        
        wait for CLK_PERIOD;
        
        st <= '0';
        
        wait for CLK_PERIOD;
        
    end process;
    
    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
    
end architecture test;
