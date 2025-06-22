#!/bin/bash

# This script performs paired-end read trimming using Trimmomatic.
# Tool required:
#   - Trimmomatic v0.39

# Define input and output directories
input_dir="path/to/your/raw_reads"
output_dir="path/to/your/output_trimmed_reads"
sample_list="path/to/sample_list.txt"  #list of the samples

# Make sure output directory exists
mkdir -p "$output_dir"

# Run Trimmomatic for each sample in the list
for sample in $(cat "$sample_list"); do
  echo "🔧 Trimming sample: $sample"
  
  java -jar path/to/trimmomatic-0.39.jar PE -threads 4 \
    "$input_dir/${sample}_1.fastq" "$input_dir/${sample}_2.fastq" \
    "$output_dir/${sample}_1_paired.fastq" "$output_dir/${sample}_1_unpaired.fastq" \
    "$output_dir/${sample}_2_paired.fastq" "$output_dir/${sample}_2_unpaired.fastq" \
    ILLUMINACLIP:path/to/TruSeq3-PE-2.fa:1:30:10 \
    HEADCROP:5 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50


# Check if the loop completed successfully and display a message
if [ $? -eq 0 ]; then
  echo "trimming completed successfully."
else
  echo "trimming encountered an error."
fi
