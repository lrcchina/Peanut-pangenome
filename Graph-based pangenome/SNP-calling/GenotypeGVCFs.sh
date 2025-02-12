###################GenotypeGVCFs

for i in {01..20}
do
ref=Tif_genome.fasta
chrname=arahy.Tifrunner.gnm2.Arahy.${i}
vcfname=combine_2320_chr${i}_raw.vcf.gz
chrn=chr${i}
#genotype variations
/mnt/NFS/software/gatk-4.4.0.0/gatk --java-options "-Xmx10G -Djava.io.tmpdir=./" GenotypeGVCFs -R $ref -L $chrname -V $vcfname -O ${chrn}.vcf.gz
done

