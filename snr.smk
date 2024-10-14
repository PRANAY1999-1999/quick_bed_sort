import sys
import pandas as pd

run_df = pd.read_csv("data/run_metadat.tsv", sep = "\t", header = "infer" )
sample_df = pd.read_csv("data/sample.tsv", sep = "\t", header= "infer")

print(sample_df)

run_df.index= run_df["run"]
sample_df.index = sample_df["sel"]
print(run_df)
print(sample_df)

def get_all_runs_for_a_sel(wildcards):
        all_runs = sample_df.loc[wildcards.sel, "runs"].split(",")
        run_path_list=[]
        for r in all_runs:
                p= run_df.loc[r, "file_path"]
                run_path_list.append(p)
        return run_path_list

rule sorted_merged_all_files:
        input:
                all_runs = lambda wildcards: get_all_runs_for_a_sel(wildcards)
        output:
                sorted_merged = "sorted/sorted_{sel}_merged.bed"
        shell:
            "sh scripts/sort.sh \"{input.all_runs}\" {output.sorted_merged}"
