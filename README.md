# 🚦 VHDL Traffic Light Controller for Four-Way Intersection 🚦

Welcome to the **VHDL Traffic Light Controller** project! This repository contains the VHDL implementation of a traffic light controller designed for a four-way intersection. This project showcases a structural design methodology without using any process statements, making it ideal for learning FPGA development and digital logic design.

## 📁 Project Structure

Here's a quick overview of the files and directories in this repository:

- `src/`
  - `DFlipFlop.vhdl`: The D flip-flop module, implemented structurally.
  - `FrequencyDivider.vhdl`: The frequency divider module to generate a 1 Hz clock signal.
  - `BinaryCounter.vhdl`: The binary counter module to count the seconds.
  - `Timer.vhdl`: The timer module that counts seconds and outputs the digit values.
  - `SevenSegmentDisplay.vhdl`: The seven-segment display module.
  - `TrafficLight.vhdl`: The traffic light controller module.
  - `CrossRoad.vhdl`: The main module that integrates four traffic light controllers.
- `testbench/`: Contains testbenches for each module to validate their functionality.

## 📝 Project Requirements

This project aims to design a traffic light controller for a four-way intersection with the following specifications:
- Each traffic light should operate for 60 seconds: 50 seconds green and 10 seconds red.
- The remaining time for the green light should be displayed on a seven-segment display.
- Sensors detect the presence of cars to potentially reduce the waiting time if the intersection is clear.
- The design should be structural, avoiding the use of process statements.

## 🛠️ How It Works

### Frequency Divider
The frequency divider reduces the input clock frequency (e.g., 50 MHz) to a lower frequency (1 Hz), which is then used to drive the timer.

### Timer
The timer counts the seconds and divides the count into two digits, `digit_high` and `digit_low`, which represent the tens and units place, respectively.

### Traffic Light Controller
The traffic light controller manages the state of the traffic lights (red and green) and displays the remaining time on a seven-segment display.

### CrossRoad
The CrossRoad module integrates four traffic light controllers, creating a synchronized system for a four-way intersection.

## 🚀 Getting Started

To simulate this project, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/ReyhunSKhosravi/VHDL-Traffic-Light-Controller.git
    ```
2. Open your favorite VHDL simulator (e.g., ModelSim, GHDL).

## 💻 Simulation on macOS

I have been using **GHDL** for VHDL compilation and **GTKWave** for waveform visualization on macOS. Here are the steps to set it up:

1. **Install GHDL**:
    ```bash
    brew install ghdl
    ```

2. **Install GTKWave**:
    ```bash
    brew install gtkwave
    ```

3. **Compile the VHDL files**:
    ```bash
    ghdl -a --std=08 src/DFlipFlop.vhdl
    ghdl -a --std=08 src/FrequencyDivider.vhdl
    ghdl -a --std=08 src/BinaryCounter.vhdl
    ghdl -a --std=08 src/Timer.vhdl
    ghdl -a --std=08 src/SevenSegmentDisplay.vhdl
    ghdl -a --std=08 src/TrafficLight.vhdl
    ghdl -a --std=08 src/CrossRoad.vhdl
    ```

4. **Compile the testbenches**:
    ```bash
    ghdl -a --std=08 testbench/DFlipFlop_tb.vhdl
    ghdl -a --std=08 testbench/FrequencyDivider_tb.vhdl
    ghdl -a --std=08 testbench/BinaryCounter_tb.vhdl
    ghdl -a --std=08 testbench/Timer_tb.vhdl
    ghdl -a --std=08 testbench/TrafficLight_tb.vhdl
    ghdl -a --std=08 testbench/CrossRoad_tb.vhdl
    ```

5. **Run the simulation**:
    ```bash
    ghdl -e --std=08 CrossRoad_tb
    ghdl -r --std=08 CrossRoad_tb --vcd=CrossRoad_tb.vcd
    ```

6. **View the waveform using GTKWave**:
    ```bash
    gtkwave CrossRoad_tb.vcd
    ```

## 📈 Simulation Results

Using a VHDL simulator, you can observe the waveform outputs for each module. Here are some sample results:

- **DFlipFlop**: Demonstrates the storage and transition of the flip-flop state.
- **FrequencyDivider**: Shows the reduction of the input clock frequency.
- **BinaryCounter**: Illustrates the counting of seconds in binary format.
- **Timer**: Displays the division of the count into high and low digits.
- **TrafficLight**: Manages the state of the traffic lights and outputs the remaining time.
- **CrossRoad**: Synchronizes the four traffic light controllers.

## 🌟 Features

- **Structural Design**: Ensures a clear and modular approach to digital design.
- **No Process Statements**: Adheres strictly to structural VHDL coding practices.
- **Comprehensive Testbenches**: Validates the functionality of each module.

## 🤝 Contributing

Contributions to enhance this project are welcome! If you have suggestions or improvements, please create an issue or submit a pull request.

## 📧 Contact

If you have any questions or need further assistance, feel free to reach out:

- **Email**: [ReyhunSKhosravi@gmail.com](mailto:ReyhunSKhosravi@gmail.com)
- **GitHub**: [ReyhunSKhosravi](https://github.com/ReyhunSKhosravi)

Thank you for checking out the VHDL Traffic Light Controller project! I hope it helps you in your FPGA development and digital logic design journey. Happy coding! 🚀

## 📜 GHDL Version

This project has been tested with the following version of GHDL: GHDL 3.0.0
