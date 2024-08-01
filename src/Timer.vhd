library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timer is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           digit_high : out STD_LOGIC_VECTOR(3 downto 0);
           digit_low : out STD_LOGIC_VECTOR(3 downto 0));
end Timer;

architecture Structural of Timer is
    signal clk_div : STD_LOGIC;
    signal count : STD_LOGIC_VECTOR(7 downto 0);

    component FrequencyDivider
        Port ( clk_in : in STD_LOGIC;
               clk_out : out STD_LOGIC);
    end component;

    component BinaryCounter
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

begin
    FD: FrequencyDivider
        Port map ( clk_in => clk, clk_out => clk_div);

    BC: BinaryCounter
        Port map ( clk => clk_div, reset => reset, Q => count);

    digit_high <= count(7 downto 4);
    digit_low <= count(3 downto 0);
end Structural;
