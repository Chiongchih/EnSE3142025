#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J kraken
#SBATCH -o %x.%J.out
#SBATCH -e %x.%J.err
#SBATCH --mail-user=xxx@kaust.edu.sa
#SBATCH --mail-type=ALL
#SBATCH --time=03:00:00
#SBATCH --mem=80G

#run the application:
module load kraken2/2.1.3/gnu-12.2.0
gzip assembly.fasta
kraken2 --db $KRAKEN2_DB_PATH --threads 4 --gzip-compressed \
	--report kraken2_colony_report.txt \
	assembly.fasta.gz
gunzip assembly.fasta.gz


