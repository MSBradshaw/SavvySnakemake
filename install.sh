# create the conda env
 conda env create -n savvy_snakemake -f environment.yml

# download GATK
wget https://github.com/broadinstitute/gatk/releases/download/4.2.6.1/gatk-4.2.6.1.zip
unzip gatk-4.2.6.1.zip

# clone Savvy
git clone git@github.com:rdemolgen/SavvySuite.git

# Compile Savvy
cd SavvySuite
javac *.java
cd ../


