EMA Filter Using LUTs in HDL

An implementation of an Exponential Moving Average (EMA) digital filter in HDL (Verilog) that uses Lookup Tables (LUTs) for optimized computation of filter coefficients. This repository contains the filter logic, coefficient LUTs, testbench, and supporting files for simulation and HDL synthesis.

The EMA is a low-pass filter that smooths an input signal by giving exponentially more weight to recent samples. It’s widely used in digital signal processing to reduce noise and provide a responsive filtered output with minimal hardware overhead.

🚀 Features

✔ Verilog HDL implementation of the EMA filter for FPGA/ASIC
✔ Coefficient values precomputed and stored in LUTs for efficient hardware usage
✔ Testbench included for functional verification
✔ Simple modular design — easy to integrate into larger HDL projects
✔ MIT open-source license

📂 Repository Structure
📦 EMA-Filter-Using-LUTs-in-HDL
├── EMA.v                  — Main EMA filter Verilog module  
├── EMA_alpha_LUT.v        — Lookup table for α (alpha) smoothing coefficients  
├── EMA_beta_LUT.v         — Lookup table for β (beta) or related coefficient values  
├── EMA_tb.v               — Testbench for EMA filter simulation  
├── Project.pptx           — (Optional) Presentation or design explanation  
└── LICENSE                — MIT License  
🧠 Background
What is an EMA Filter?

An Exponential Moving Average (EMA) filter is a discrete, first-order IIR low-pass filter that smooths noisy signals while reacting efficiently to changes in the input. It follows the recursive equation:

y[n] = α * x[n] + (1 − α) * y[n − 1]

where:

y[n] — filtered output

x[n] — input sample

α — smoothing factor between 0 and 1

Smaller α means slower but smoother output, while larger α makes the filter more responsive.

Why Use LUTs?

In hardware implementations (especially on FPGA), LUTs can speed up repetitive arithmetic and avoid costly multipliers. By precomputing coefficient values (e.g., quantized α or related filter parameters) and storing them in a LUT, the EMA filter can be efficiently computed with reduced logic, area, and power.

📌 Usage

Simulate the design using your preferred HDL simulator (ModelSim, Questa, Icarus Verilog, etc.) using EMA_tb.v.

Synthesize for your target FPGA or ASIC flow.

Integrate the EMA.v module into your digital signal processing pipeline.

Configure LUTs with your desired precision and coefficient range for your specific application.

🧪 Simulation

Run the included testbench EMA_tb.v to verify correct filter behavior with test signals. Modify or expand test vectors as needed to validate performance with your own data streams.

📜 License

This project is released under the MIT License — feel free to use, modify, and distribute! See the LICENSE file for details.

📫 Questions / Contributions

Feel free to open issues or pull requests for improvements, optimizations, or HDL enhancements!

Happy filtering! 🎛️
