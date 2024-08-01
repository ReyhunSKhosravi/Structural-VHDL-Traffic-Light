library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timer_tb is
end Timer_tb;

architecture Behavioral of Timer_tb is
    component Timer
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               digit_high : out STD_LOGIC_VECTOR(3 downto 0);
               digit_low : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal clk, reset : STD_LOGIC;
    signal digit_high, digit_low : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- UUT: Unit Under Test
    UUT: Timer
        Port map (
            clk => clk,
            reset => reset,
            digit_high => digit_high,
            digit_low => digit_low
        );

    -- Clock generation
    clk <= not clk after 10 ns;

    -- Stimulus process
    stim_proc: process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 1000 ns;  -- Wait for some time to observe the timer
        wait;
    end process;
end Behavioral;
