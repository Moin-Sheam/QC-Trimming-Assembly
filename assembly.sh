#!/bin/bash

# This script performs metagenomic assembly using MEGAHIT.
# Tool required:
#   - MEGAHIT v1.2.9


# Define input and output paths
input_r1="path/to/your_trimmed/sample_R1.fastq"
input_r2="path/to/your_trimmed/sample_R2.fastq"
output_dir="path/to/your/output_directory"

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Run MEGAHIT
megahit -1 "$input_r1" -2 "$input_r2" \
  -o "$output_dir" \
  --min-contig-len 5000

# Check if MEGAHIT completed successfully
if [ $? -eq 0 ]; then
  echo "✅ MEGAHIT assembly completed successfully."
else
  echo "❌ MEGAHIT assembly encountered an error."
fi
