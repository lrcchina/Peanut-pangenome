vcftools --vcf ../all.vcf --maf 0.05 --max-missing 0.8 --out maf0.05 --recode
Rscript rMVP_PAN.R ./ br_data_gwas1.txt


