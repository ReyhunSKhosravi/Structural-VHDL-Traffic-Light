library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop is
    Port (
        D : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end DFlipFlop;

architecture Structural of DFlipFlop is
    signal nD, nclk, S, R, nQ, Qint : STD_LOGIC;
begin
    -- Inverters
    nD <= not D;
    nclk <= not clk;

    -- SR Latch
    S <= not (nD and clk);
    R <= not (D and clk);
    Qint <= not (S and nQ);
    nQ <= not (R and Qint);

    -- Output
    Q <= Qint;
end Structural;
