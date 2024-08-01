library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BinaryCounter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(7 downto 0));
end BinaryCounter;

architecture Structural of BinaryCounter is
    signal temp_Q : STD_LOGIC_VECTOR(7 downto 0);
    component DFlipFlop is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
begin
    DFF0: DFlipFlop
        Port map (
            D => not temp_Q(0),
            clk => clk,
            Q => temp_Q(0)
        );

    DFF: for i in 1 to 7 generate
        DFFn: DFlipFlop
            Port map (
                D => not temp_Q(i),
                clk => temp_Q(i-1),
                Q => temp_Q(i)
            );
    end generate;

    Q <= temp_Q;
end Structural;
