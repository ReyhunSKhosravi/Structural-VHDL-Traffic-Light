library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLight_tb is
end TrafficLight_tb;

architecture Behavioral of TrafficLight_tb is
    component TrafficLight
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               car : in STD_LOGIC;
               red : out STD_LOGIC;
               green : out STD_LOGIC;
               segment_high : out STD_LOGIC_VECTOR(6 downto 0);
               segment_low : out STD_LOGIC_VECTOR(6 downto 0);
               next_signal : out STD_LOGIC);
    end component;

    signal clk, reset, car : STD_LOGIC;
    signal red, green, next_signal : STD_LOGIC;
    signal segment_high, segment_low : STD_LOGIC_VECTOR(6 downto 0);

begin
    -- UUT: Unit Under Test
    UUT: TrafficLight
        Port map (
            clk => clk,
            reset => reset,
            car => car,
            red => red,
            green => green,
            segment_high => segment_high,
            segment_low => segment_low,
            next_signal => next_signal
        );

    -- Clock generation
    clk <= not clk after 10 ns;

    -- Stimulus process
    stim_proc: process
    begin
        reset <= '1';
        car <= '0';
        wait for 20 ns;
        reset <= '0';
        wait for 1000 ns;  -- Wait for some time to observe the traffic light
        wait;
    end process;
end Behavioral;
