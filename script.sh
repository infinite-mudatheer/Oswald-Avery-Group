#!/bin/bash
#lets define repo info 
REPO_URL="https://github.com/infinite-mudatheer/Oswald-Avery-Group.git"
REPO_NAME="Oswald-Avery-Group"

#secondly , lets clone the repository
if [ -d "$REPO_NAME" ]; then
    echo "Repository already cloned. Pulling latest changes..."
    cd "$REPO_NAME" && git pull
else
    echo "Cloning repository..."
    git clone "$REPO_URL"
    cd "$REPO_NAME"
fi

# Compile C++ and C# scripts
g++ main.cpp -o main_cpp.out
mcs -out:main_cs.exe main.cs

# Run the scripts and capture the output
output_py=$(python3 main.py)
output_cpp=$(./main_cpp.out)
output_cs=$(mono main_cs.exe)
output_pl=$(perl main.pl)
output_m=$(matlab -batch "main")
output_r=$(Rscript main.R)

# Extract email and area of interest from the outputs
extract_info() {
    local output=$1
    local email=$(echo "$output" | grep -oP 'Email: \K.*')
    local area_of_interest=$(echo "$output" | grep -oP 'Area Of Interest: \K.*')
    echo "$email,$area_of_interest"
}

info_py=$(extract_info "$output_py")
info_cpp=$(extract_info "$output_cpp")
info_cs=$(extract_info "$output_cs")
info_pl=$(extract_info "$output_pl")
info_m=$(extract_info "$output_m")
info_r=$(extract_info "$output_r")

#finally , we generate CSV file
echo "Email,Area Of Interest" > output.csv
echo "$info_py" >> output.csv
echo "$info_cpp" >> output.csv
echo "$info_cs" >> output.csv
echo "$info_pl" >> output.csv
echo "$info_m" >> output.csv
echo "$info_r" >> output.csv

echo "CSV file generated: output.csv"

#code with shakefire@protonmail.com
