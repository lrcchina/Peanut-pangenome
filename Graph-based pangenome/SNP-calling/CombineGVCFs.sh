ref=Tif_genome.fasta
for i in {01..20}
do
chr=arahy.Tifrunner.gnm2.Arahy.${i}
name=chr${i}
/mnt/NFS/software/gatk-4.4.0.0/gatk --java-options "-Xmx50G -Djava.io.tmpdir=./"  CombineGVCFs -R $ref -L ${chr} \
-V 2320_gvcf.list \
-O combine_${name}_raw.vcf.gz
done
