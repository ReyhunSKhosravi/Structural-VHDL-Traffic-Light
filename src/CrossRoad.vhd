library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CrossRoad is
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
end CrossRoad;

architecture Structural of CrossRoad is

    component TrafficLight is
        Port (
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            car : in STD_LOGIC;
            red : out STD_LOGIC;
            green : out STD_LOGIC;
            segment_high : out STD_LOGIC_VECTOR(6 downto 0);
            segment_low : out STD_LOGIC_VECTOR(6 downto 0);
            next_signal : out STD_LOGIC
        );
    end component;

    signal next1, next2, next3, next4 : STD_LOGIC;

begin

    TL1: TrafficLight
        Port map (
            clk => clk,
            reset => reset,
            car => car1,
            red => red1,
            green => green1,
            segment_high => segment_high1,
            segment_low => segment_low1,
            next_signal => next1
        );

    TL2: TrafficLight
        Port map (
            clk => clk,
            reset => next1,
            car => car2,
            red => red2,
            green => green2,
            segment_high => segment_high2,
            segment_low => segment_low2,
            next_signal => next2
        );

    TL3: TrafficLight
        Port map (
            clk => clk,
            reset => next2,
            car => car3,
            red => red3,
            green => green3,
            segment_high => segment_high3,
            segment_low => segment_low3,
            next_signal => next3
        );

    TL4: TrafficLight
        Port map (
            clk => clk,
            reset => next3,
            car => car4,
            red => red4,
            green => green4,
            segment_high => segment_high4,
            segment_low => segment_low4,
            next_signal => next4
        );

end Structural;
