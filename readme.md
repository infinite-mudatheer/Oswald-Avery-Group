### Step 1: Open Terminal
- Open your terminal application. This could be Terminal on macOS or Linux, or Command Prompt/PowerShell on Windows (with a bash emulator like Git Bash).

### Step 2: Create the Script File
1. **Navigate to your desired directory** where you want to create the script file:
   ```bash
   cd path/to/your/directory
   ```

2. **Create a new file** named `run_scripts.sh` with a text editor like `nano`:
   ```bash
   nano run_scripts.sh
   ```

3. **Copy and paste** the script content into the editor:

```bash
#!/bin/bash

REPO_URL="https://github.com/infinite-mudatheer/Oswald-Avery-Group.git"
REPO_DIR="Oswald-Avery-Group"

# Clone the repository
if [ -d "$REPO_DIR" ]; then
    echo "Repository already cloned. Pulling latest changes..."
    cd "$REPO_DIR" && git pull
else
    echo "Cloning repository..."
    git clone "$REPO_URL"
    cd "$REPO_DIR"
fi

# Compile C++ script
g++ main.cpp -o main_cpp.out

# Run the scripts and capture the output
output_py=$(python3 main.py)
output_cpp=$(./main_cpp.out)
output_pl=$(perl main.pl)
output_r=$(Rscript main.r)
output_m=$(octave --quiet --eval "main")

# Extract email and area of interest from the outputs
extract_info() {
    local output=$1
    local email=$(echo "$output" | grep -oP 'Email: \K.*')
    local area_of_interest=$(echo "$output" | grep -oP 'Area Of Interest: \K.*')
    echo "$email,$area_of_interest"
}

info_py=$(extract_info "$output_py")
info_cpp=$(extract_info "$output_cpp")
info_pl=$(extract_info "$output_pl")
info_r=$(extract_info "$output_r")
info_m=$(extract_info "$output_m")

# Generate CSV file
OUTPUT_CSV="output.csv"
echo "Email,Area Of Interest" > "$OUTPUT_CSV"
echo "$info_py" >> "$OUTPUT_CSV"
echo "$info_cpp" >> "$OUTPUT_CSV"
echo "$info_pl" >> "$OUTPUT_CSV"
echo "$info_r" >> "$OUTPUT_CSV"
echo "$info_m" >> "$OUTPUT_CSV"

echo "CSV file generated: $OUTPUT_CSV"
```

4. **Save and exit** the editor (for `nano`, use `CTRL+X`, then `Y`, then `ENTER`).

### Step 3: Make the Script Executable
1. **Make the script executable** by running:
   ```bash
   chmod +x run_scripts.sh
   ```

### Step 4: Install Necessary Compilers/Interpreters
Ensure you have the necessary compilers/interpreters installed. You can install them using your package manager. For example, on Debian-based systems (like Ubuntu), you can use:
```bash
sudo apt-get install g++ python3 perl r-base octave
```

### Step 5: Run the Script
1. **Execute the script** by running:
   ```bash
   ./run_scripts.sh
   ```

### Step 6: Verify the Output
1. **Check the generated CSV file**:
   - After the script completes, it will generate a `output.csv` file in the current directory.
   - Open the `output.csv` file to verify the contents.

   code with ;
 ```bash
   shakefire@protonmail.com
   ```
