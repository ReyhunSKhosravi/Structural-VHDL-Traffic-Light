library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop_tb is
end DFlipFlop_tb;

architecture Behavioral of DFlipFlop_tb is
    component DFlipFlop
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal D, clk, Q : STD_LOGIC;

begin
    -- UUT: Unit Under Test
    UUT: DFlipFlop
        Port map (
            D => D,
            clk => clk,
            Q => Q
        );

    -- Clock generation
    clk <= not clk after 10 ns;

    -- Stimulus process
    stim_proc: process
    begin
        D <= '0';
        wait for 20 ns;
        D <= '1';
        wait for 20 ns;
        D <= '0';
        wait for 20 ns;
        wait;
    end process;
end Behavioral;
