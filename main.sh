#!/bin/bash

cat data/shuf.a.bed data/shuf.b.bed | awk '{print $0>"data/"$1".bed"}'
rm data/chr*_*.bed
snakemake --snakefile snr.smk sorted/sorted_samp_merged.bed -j1
