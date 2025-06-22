#!/bin/bash

# This script performs quality control using FastQC and summarizes results using MultiQC.
# Tools required:
#   - FastQC v0.11.9
#   - MultiQC v1.21
#   - use module or conda tp load the tools

# Input and output directories
sample_dir="/path/to/your/reads"
fastqc_out="./fastqc_output"
multiqc_out="./multiqc_output"

# Create output directories if needed
mkdir -p "$fastqc_out"
mkdir -p "$multiqc_out"

# Run FastQC
echo "�� Running FastQC..."
fastqc "$sample_dir"/*fastq* -o "$fastqc_out"

# Run MultiQC
echo "📊 Running MultiQC..."
multiqc -d "$fastqc_out" -o "$multiqc_out"

# Check if the pipeline completed successfully and display a message
if [ $? -eq 0 ]; then
  echo "Job qc.sh completed successfully."
else
  echo "Job qc.sh encountered an error."
fi
