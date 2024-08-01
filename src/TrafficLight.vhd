library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TrafficLight is
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
end TrafficLight;

architecture Structural of TrafficLight is
    component Timer
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               digit_high : out STD_LOGIC_VECTOR(3 downto 0);
               digit_low : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    component SevenSegmentDisplay
        Port ( number : in STD_LOGIC_VECTOR(3 downto 0);
               segments : out STD_LOGIC_VECTOR(6 downto 0));
    end component;

    signal digit_high, digit_low : STD_LOGIC_VECTOR(3 downto 0);
    signal sensor : STD_LOGIC;
    signal state : STD_LOGIC := '0'; -- '0' for green, '1' for red

    component DFlipFlop is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal DFF_Q : STD_LOGIC;

begin
    TimerInstance: Timer
        Port map (
            clk => clk,
            reset => reset,
            digit_high => digit_high,
            digit_low => digit_low
        );

    SevenSegmentDisplayHigh: SevenSegmentDisplay
        Port map (
            number => digit_high,
            segments => segment_high
        );

    SevenSegmentDisplayLow: SevenSegmentDisplay
        Port map (
            number => digit_low,
            segments => segment_low
        );

    -- State management using D flip-flop
    DFF: DFlipFlop
        Port map (
            D => not state,
            clk => clk,
            Q => DFF_Q
        );

    state <= DFF_Q;

    green <= not state;
    red <= state;
    next_signal <= state;
end Structural;
