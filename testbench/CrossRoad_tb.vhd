library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CrossRoad_tb is
end CrossRoad_tb;

architecture Behavioral of CrossRoad_tb is
    component CrossRoad
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            car1 : in STD_LOGIC;
            car2 : in STD_LOGIC;
            car3 : in STD_LOGIC;
            car4 : in STD_LOGIC;
            red1 : out STD_LOGIC;
            green1 : out STD_LOGIC;
            red2 : out STD_LOGIC;
            green2 : out STD_LOGIC;
            red3 : out STD_LOGIC;
            green3 : out STD_LOGIC;
            red4 : out STD_LOGIC;
            green4 : out STD_LOGIC;
            segment_high1 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_low1 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_high2 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_low2 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_high3 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_low3 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_high4 : out STD_LOGIC_VECTOR(6 downto 0);
            segment_low4 : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    signal clk, reset : STD_LOGIC;
    signal car1, car2, car3, car4 : STD_LOGIC;
    signal red1, green1, red2, green2, red3, green3, red4, green4 : STD_LOGIC;
    signal segment_high1, segment_low1, segment_high2, segment_low2, segment_high3, segment_low3, segment_high4, segment_low4 : STD_LOGIC_VECTOR(6 downto 0);

begin
    -- UUT: Unit Under Test
    UUT: CrossRoad
        Port map (
            clk => clk,
            reset => reset,
            car1 => car1,
            car2 => car2,
            car3 => car3,
            car4 => car4,
            red1 => red1,
            green1 => green1,
            red2 => red2,
            green2 => green2,
            red3 => red3,
            green3 => green3,
            red4 => red4,
            green4 => green4,
            segment_high1 => segment_high1,
            segment_low1 => segment_low1,
            segment_high2 => segment_high2,
            segment_low2 => segment_low2,
            segment_high3 => segment_high3,
            segment_low3 => segment_low3,
            segment_high4 => segment_high4,
            segment_low4 => segment_low4
        );

    -- Clock generation
    clk <= not clk after 10 ns;

    -- Stimulus process
    stim_proc: process
    begin
        reset <= '1';
        car1 <= '0';
        car2 <= '0';
        car3 <= '0';
        car4 <= '0';
        wait for 20 ns;
        reset <= '0';
        wait for 1000 ns;
        car1 <= '1';
        wait for 200 ns;
        car1 <= '0';
        car2 <= '1';
        wait for 200 ns;
        car2 <= '0';
        car3 <= '1';
        wait for 200 ns;
        car3 <= '0';
        car4 <= '1';
        wait for 200 ns;
        car4 <= '0';
        wait for 1000 ns; -- Wait for some time to observe the whole system
        wait;
    end process;
end Behavioral;
