#!/bin/bash

# firstly , Clone the repository
git clone <repository_url>
cd <repository_name>

# now, Run the scripts and capture the output
output_py=$(python3 main.py)
output_cpp=$(./main.cpp)
output_cs=$(./main.cs)
output_pl=$(./main.pl)
output_m=$(matlab -batch "run('main.m')")
output_r=$(Rscript main.R)

# lets extract email and area of interest from the outputs
email_py=$(echo "$output_py" | grep -oP 'Email: \K.*')
area_of_interest_py=$(echo "$output_py" | grep -oP 'Area Of Interest: \K.*')

email_cpp=$(echo "$output_cpp" | grep -oP 'Email: \K.*')
area_of_interest_cpp=$(echo "$output_cpp" | grep -oP 'Area Of Interest: \K.*')

email_cs=$(echo "$output_cs" | grep -oP 'Email: \K.*')
area_of_interest_cs=$(echo "$output_cs" | grep -oP 'Area Of Interest: \K.*')

email_pl=$(echo "$output_pl" | grep -oP 'Email: \K.*')
area_of_interest_pl=$(echo "$output_pl" | grep -oP 'Area Of Interest: \K.*')

email_m=$(echo "$output_m" | grep -oP 'Email: \K.*')
area_of_interest_m=$(echo "$output_m" | grep -oP 'Area Of Interest: \K.*')

email_r=$(echo "$output_r" | grep -oP 'Email: \K.*')
area_of_interest_r=$(echo "$output_r" | grep -oP 'Area Of Interest: \K.*')

# finally, we generate CSV file
echo "Email,Area Of Interest" > output.csv
echo "$email_py,$area_of_interest_py" >> output.csv
echo "$email_cpp,$area_of_interest_cpp" >> output.csv
echo "$email_cs,$area_of_interest_cs" >> output.csv
echo "$email_pl,$area_of_interest_pl" >> output.csv
echo "$email_m,$area_of_interest_m" >> output.csv
echo "$email_r,$area_of_interest_r" >> output.csv

echo "CSV file generated: output.csv"

