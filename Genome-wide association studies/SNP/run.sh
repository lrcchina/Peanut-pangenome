#filter SNPs using vcftools
vcftools --vcf ../all.vcf --maf 0.05 --max-missing 0.8 --out maf0.05 --recode
#carry out gwas study using the rMVP package, The file "br_data_gwas1.txt" contains the phenotypic information 
Rscript rMVP_PAN.R ./ br_data_gwas1.txt

