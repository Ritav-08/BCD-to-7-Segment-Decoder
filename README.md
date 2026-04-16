# 📘 BCD to 7-Segment Decoder – Verilog

## 🔹 Overview

This project implements a **BCD to 7-Segment Decoder** in Verilog along with a **self-checking testbench**.
The decoder converts a **4-bit BCD input (0–9)** into a **7-bit output** to drive a 7-segment display.

The segment order used is:
**a, b, c, d, e, f, g** (starting from top, clockwise, and center last)

---

## 🔹 Features

* Converts 4-bit BCD input to 7-segment display output
* Supports digits **0–9**
* Invalid inputs (10–15) turn all segments OFF
* Includes **self-checking testbench** using expected results
* Fully combinational logic (`always @(*)`)

---

## 🔹 Module Description

### 📌 Inputs

* `a_i [3:0]` → 4-bit BCD input

### 📌 Outputs

* `y_o [6:0]` → 7-segment output (abcdefg)

---

## 🔹 Working Principle

Each BCD input is mapped to a corresponding 7-segment pattern:

| Digit | BCD Input | 7-Segment Output (abcdefg) |
| ----- | --------- | -------------------------- |
| 0     | 0000      | 1111110                    |
| 1     | 0001      | 0110000                    |
| 2     | 0010      | 1101101                    |
| 3     | 0011      | 1111001                    |
| 4     | 0100      | 0110011                    |
| 5     | 0101      | 1011011                    |
| 6     | 0110      | 1011111                    |
| 7     | 0111      | 1110000                    |
| 8     | 1000      | 1111111                    |
| 9     | 1001      | 1111011                    |

### 🔸 Invalid Inputs

* For inputs **1010–1111**:

  ```
  y_o = 0000000  (All segments OFF)
  ```

---

## 🔹 Testbench Details

The testbench (`tb_BCDt7Sdecoder`) is **self-checking**:

* Automatically compares:

  ```
  DUT output (y_o) vs Expected output (exp_result)
  ```
* Displays error if mismatch occurs:

  ```
  Error | Time: ... | Expected: ..., Coded: ...
  ```

### 🔸 Test Coverage

* Tests all inputs from **0 to 15**
* Validates:

  * Correct digit display (0–9)
  * Proper OFF state for invalid inputs (10–15)

---

## 🔹 Simulation

### ▶️ Tools

* ModelSim / QuestaSim
* Xilinx Vivado
* Icarus Verilog + GTKWave

### ▶️ Run (Icarus Verilog Example)

```bash id="v8d2kp"
iverilog -o BCDt7Sdecoder.vvp BCDt7Sdecoder.v tb_BCDt7Sdecoder.v
vvp BCDt7Sdecoder.vvp
gtkwave BCDt7Sdecoder.vcd
```

---

## 🔹 Output

* Error messages using `$display` (only if mismatch occurs)
* Waveform dump file:

  ```
  BCDt7Sdecoder.vcd
  ```

---

## 🔹 Sample Error Output

```id="r5n1tz"
Error | Time: 10 | BCD: 1010 (10) | Expected: 0000000, Coded: 1111111
```

---

## 🔹 Applications

* 7-segment display drivers
* Digital clocks and counters
* Embedded systems display units
* FPGA-based user interfaces

---

## 🔹 File Structure

```id="m3x9qw"
├── BCDt7Sdecoder.v        # Decoder Design
├── tb_BCDt7Sdecoder.v     # Self-checking Testbench
├── BCDt7Sdecoder.vcd      # Waveform output (generated)
└── README.txt             # Documentation
```
