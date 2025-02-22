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
  sudo apt install figlet
  ```

## How to Use
### Clone this repository:
```bash
git clone https://github.com/yourusername/assembly-syscall-benchmark.git
```
### Navigate into the directory:
```bash
cd assembly-syscall-benchmark/
```
### Make the script executable:
```bash
chmod +x benchmark.sh
```
### Run the tool by providing your assembly files:
```bash
./benchmark.sh
```

### Follow the prompts to enter the filenames of your two assembly programs:
- The first file should use `int 0x80`.
- The second file should use `syscall`.

#### Example Input:
```
Enter the filename for program1 (int 0x80, e.g., program1.asm): my_int80_program.asm
Enter the filename for program2 (syscall, e.g., program2.asm): my_syscall_program.asm
```

## Example Commands
To test two files, e.g., `int80_test.asm` and `syscall_test.asm`:
1. Place both files in the same directory as the script.
2. Run the script:
   ```bash
   ./benchmark.sh
   ```

## Output
The script will display the average execution times for both programs and indicate which method is faster, along with the percentage difference.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

