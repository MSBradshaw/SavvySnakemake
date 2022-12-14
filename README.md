# Savvy CNV Calling Snakemake Pipeline

This repo is my implementation of [SavvyCNV](https://github.com/rdemolgen/SavvySuite) as a [Snakemake](https://snakemake.readthedocs.io/en/stable/) pipeline. My hope is this repo will help make cnv calling quick and easy for anyone.

## Install

If you haven't already, install (conda)[https://conda.io/projects/conda/en/latest/user-guide/install/index.html].

To install all necessary tools simply run

`bash install.sh`

This will install GATK and SavvySuite, GATK need to be added to you path example

`export CLASSPATH=/path/to/SavvySnakemake/gatk-4.2.6.1/gatk-package-4.2.6.1-local.jar:/path/to/SavvySnakemake/SavvySuite`

## Usage

Start the conda enviroment

`conda activate savvy_snakemake`

Example command

`snakemake -s savvy.snake --cores 64 --config ref_samples="ref_samples.example.txt" samples="samples.example.txt"`

`ref_samples` : the file for this parameter should be a list of the **absolute** file paths for the bam files you want to use as the reference panel for SavvyCNV. Each `.bam` file should have an accompanying `.bai` in the same location.

Example:

```
/the/absolute/path/ref_sample_1.bam
/the/absolute/path/ref_sample_2.bam
/the/absolute/path/ref_sample_3.bam
```

`samples` : the file for this parameter should be a list of the **absolute** file paths for the bam files you want to call CNVs on. Each `.bam` file should have an accompanying `.bai` in the same location.

Example:
```
/the/absolute/path/sample_A.bam
/the/absolute/path/sample_B.bam
/the/absolute/path/sample_C.bam
```

### Notes:

All file paths need to be absolute, not relative, as the pipeline will be symlinking the files.

Each sample's `.bam` must have a unique name and an accompanying `.bai`. 

The the final output calls will be saved in `SavvycnvResults/cnv_list.bed`.

Intermediate coverage binner files will be saved in `CoverageBinnerOut/` and `CoverageBinnerOutReference/`. The files in `CoverageBinnerOutReference` can be saved and used again later to avoid redundant computation if you use the same reference panel again.
