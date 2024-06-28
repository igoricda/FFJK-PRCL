library ieee;
use ieee.std_logic_1164.all;

entity ffjk is
    port(
        j, k : in bit;
        clock : in bit;
        pr, cl : in bit;
        q, nq : out bit
        );
end ffjk;

architecture ff of ffjk is
    signal s_snj , s_snk : bit;
    signal s_sns , s_snr : bit;
    signal s_sns2, s_snr2 : bit;
    signal s_eloS, s_eloR : bit;
    signal s_eloQ, s_elonQ: bit;
    signal s_nClock : bit;
begin

    
    s_nClock <= not(clock);
    -- envio de saídas de NAND para Q e NQ
    q <= s_eloq;
    nq <= s_elonq;
       
    -- s_snj
    s_snj <= not(j and clock and s_elonQ);
    
    -- s_snk
    s_snk <= not(k and clock and s_eloQ);
    
    -- s_sns
    s_sns <= not(s_snj and pr and s_eloR);
    
    -- s_snr
    s_snr <= not(s_snk and cl and s_eloS);
    
    -- s_sns2
    s_sns2 <= s_sns nand s_nClock;
    
    -- s_snr2
    s_snr2 <= s_snr nand s_nClock;
    
    -- s_eloS
    s_eloS <= s_sns;
    
    -- s_eloR
    s_eloR <= s_snr;
    
    -- s_eloQ
    s_eloq <= not(pr and s_sns2 and s_elonQ);
    
    -- s_elonQ
    s_elonq <= not(s_eloQ and s_snr2 and cl);
end architecture ff;
