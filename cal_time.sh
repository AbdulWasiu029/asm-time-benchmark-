#!/bin/bash

clear
figlet -f slant -c "Anonymous" | lolcat
figlet -f term -c "The only limit to our realization of tomorrow will be our doubts of today." | lolcat
echo "--------------------------------------------------------------------------------" 
printf "\n"
echo "Name: Abdul Wasiu"
echo "ID: 23BSCYS029"
printf "\n"

read -p "Enter the filename for code1 : " code1
read -p "Enter the filename for code2 : " code2

# Check if both files exist
for file in "$code1" "$code2"; do
    if [ ! -f "$file" ]; then
        echo "Error: $file not found!"
        exit 1
    fi
done

# Assemble and link both programs
for file in "$code1" "$code2"; do
    nasm -f elf64 "$file" -o "${file%.asm}.o"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to assemble $file"
        exit 1
    fi
    ld -o "${file%.asm}" "${file%.asm}.o"
done

# Clear previous results
> result_code1.txt
> result_code2.txt

echo "Executing programs 50 times..."
for i in {1..50}; do
    echo -ne "Progress: [$i/50] Running...\r"
    (time -p ./"${code1%.asm}" > /dev/null) 2>> result_code1.txt
    (time -p ./"${code2%.asm}" > /dev/null) 2>> result_code2.txt
done
echo -e "\nExecution completed!"

# Function to extract the total real time
extract_time() {
    grep 'real' "$1" | awk '{s+=$2} END {print s}'
}

# Get total real time for both programs
real_time_code1=$(extract_time result_code1.txt)
real_time_code2=$(extract_time result_code2.txt)

# Ensure valid execution times were extracted
if [[ -z "$real_time_code1" || -z "$real_time_code2" ]]; then
    echo "Error: Failed to extract execution times. Please check the assembly files."
    exit 1
fi

# Calculate average real execution time
avg_real_time_code1=$(echo "scale=6; $real_time_code1 / 50" | bc)
avg_real_time_code2=$(echo "scale=6; $real_time_code2 / 50" | bc)

echo "-------------------------------"
echo "Execution Summary:"
echo "Real time for ${code1%.asm} (int 0x80): $avg_real_time_code1 seconds"
echo "Real time for ${code2%.asm} (syscall): $avg_real_time_code2 seconds"
echo "-------------------------------"

# Compare speeds using real execution time
if (( $(echo "$avg_real_time_code2 > $avg_real_time_code1" | bc -l) )); then
    faster_code="${code1%.asm} (int 0x80)"
    slower_code="${code2%.asm} (syscall)"
    diff=$(echo "scale=3; 100 * (($avg_real_time_code2 - $avg_real_time_code1) / $avg_real_time_code2)" | bc)
else
    faster_code="${code2%.asm} (syscall)"
    slower_code="${code1%.asm} (int 0x80)"
    diff=$(echo "scale=3; 100 * (($avg_real_time_code1 - $avg_real_time_code2) / $avg_real_time_code1)" | bc)
fi

echo "$faster_code is $(echo "scale=2; $diff" | bc)% faster than $slower_code"
