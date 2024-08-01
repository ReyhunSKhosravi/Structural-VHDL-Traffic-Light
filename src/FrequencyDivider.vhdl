library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FrequencyDivider is
    Port ( clk_in : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end FrequencyDivider;

architecture Structural of FrequencyDivider is
    signal counter : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
    signal div_clk : STD_LOGIC := '0';
    component DFlipFlop is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
begin
    FD: for i in 0 to 22 generate
        DFF: DFlipFlop
            Port map (
                D => counter(i+1),
                clk => counter(i),
                Q => counter(i+1)
            );
    end generate;

    div_clk <= counter(23);
    DFF_LAST: DFlipFlop
        Port map (
            D => div_clk,
            clk => counter(22),
            Q => clk_out
        );
end Structural;
