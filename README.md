# Assembly Syscall Benchmark

This tool compares the execution times of two assembly programs: one using `int 0x80` system call and the other using `syscall`. It automates the process of assembling, linking, and benchmarking both programs, then outputs the average execution time and the performance difference.

## Features
- Assembles and links user-provided assembly files.
- Runs both programs multiple times and calculates average execution times.
- Displays the percentage difference in performance between `int 0x80` and `syscall`.

## Prerequisites
Ensure your Linux system is up to date:
```bash
sudo apt update
```
### Required Packages:
- **NASM (Netwide Assembler)**
  ```bash
  sudo apt install nasm
  ```
- **Figlet (for terminal banner, optional)**
  ```bash
  sudo apt install figlet lolcat
  ```
- **bc (Calculator for floating-point operations)**
  ```bash
  sudo apt install bc
  ```
- **time (Command to measure execution time)**
  ```bash
  sudo apt install time
  ```

## How to Use
### Clone this repository:
```bash
https://github.com/AbdulWasiu029/asm-time-benchmark-.git
```
### Navigate into the directory:
```bash
cd asm-time-benchmark-
```
### Make the script executable:
```bash
chmod +x cal_time.sh
```
### Run the tool by providing your assembly files:
```bash
./cal_time.sh
```

### Follow the prompts to enter the filenames of your two assembly programs:
- The first file should use `int 0x80`.
- The second file should use `syscall`.

#### Example Input:
Place both files in the same directory as the script.
```
Enter the filename for code1 : code.asm
Enter the filename for code2 : code2.asm
```

## Example Commands
To test two files, e.g., `int80_tes.asm` and `syscall_test.asm`:
1. Place both files in the same directory as the script.
2. Run the script:
   ```bash
   ./cal_time.sh
   ```

## Output
The script will display the average execution times for both programs and indicate which method is faster, along with the percentage difference.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

