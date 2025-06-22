# QC, Trimming, and Assembly Pipeline for NCLDV Data

This repository contains shell scripts to perform quality control, trimming, and assembly of metagenomic sequencing data 

## Overview

The pipeline includes the following steps:

1. **Quality Control (QC)**  
   Using [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) to assess raw read quality, and [MultiQC](https://multiqc.info/) to aggregate QC reports.

2. **Trimming**  
   Using [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) to trim and clean paired-end sequencing reads.

3. **Assembly**  
   Using [MEGAHIT](https://github.com/voutcn/megahit) for metagenomic assembly with a minimum contig length filter.

## Scripts

- `qc.sh` — Runs FastQC and MultiQC on raw sequencing data.
- `trimming.sh` — Runs Trimmomatic to trim paired-end reads based on quality and adapter removal.
- `assembly.sh` — Runs MEGAHIT to assemble trimmed reads into contigs.

## Usage

Edit each script to specify your input/output directories and file names.  
Run the scripts on your HPC or local machine with (For HPC use appropriate SLURM parameters: 

```bash
bash qc.sh
bash trimming.sh
bash assembly.sh
