#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J flye
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=xxx@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=3-00:00:00
#SBATCH --mem=80G
#SBATCH -c 16

#run the application:
module load flye/2.9.5
filename="xxx"
flye --nano-raw \
"$filename"_trimmed.fastq \
--genome-size 5m --out-dir ./"$filename"_flye --asm-coverage 50

