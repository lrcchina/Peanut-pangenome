##################TE library
conda activate EDTA
#create TE library
perl /software/EDTA/EDTA.pl --sensitive 1 --anno 1 --genome /Genome/Ai/aisheng/genome_zrg/genome_V3/2.assembly/genome.fasta -t 60
##################
#identify the repeated regions of the genome
RepeatMasker -e ncbi -pa 60 -html -gff -dir repeat genome.fasta -lib genome.fasta.mod.EDTA.TElib.fa
##################PASA
l1=/Genome/*/RNA-seq/flower_1.fq.gz
r1=/Genome/*/RNA-seq/flower_2.fq.gz
l2=/Genome/*/RNA-seq/nut_1_1.fq.gz
r2=/Genome/*/RNA-seq/nut_1_2.fq.gz
l3=/Genome/*/RNA-seq/nut_2_1.fq.gz
r3=/Genome/*/RNA-seq/nut_2_2.fq.gz
l4=/Genome/*/RNA-seq/nut_3_1.fq.gz
r4=/Genome/*/RNA-seq/nut_3_2.fq.gz
l5=/Genome/*/RNA-seq/nut_4_1.fq.gz
r5=/Genome/*/RNA-seq/nut_4_2.fq.gz
l6=/Genome/*/RNA-seq/root_1.fq.gz
r6=/Genome/*/RNA-seq/root_2.fq.gz
TRINITY_HOME=/software/trinityrnaseq
/software/trinityrnaseq/Trinity --seqType fq --max_memory 100G \
              --left $l1,$l2,$l3,$l4,$l5,$l6\
              --right $r1,$r2,$r3,$r4,$r5,$r6 \
              --CPU 50
ref=genome.fasta.masked
trifasta=trinity_out_dir.Trinity.fasta
conf=/software/PASApipeline/pasa_conf/alignAssembly.txt              
#
mysql -u root -p
mysql> show databases;
mysql> drop database mydb_pasa0903;
#
/software/PASApipeline/Launch_PASA_pipeline.pl -c $conf -C -R -g $ref -t $trifasta --CPU 60 --ALIGNERS blat,gmap,minimap2 

##################MAKER
maker -TMP /tmp/ --ignore_nfs_tmp
for i in {01..20}
do 
dir=./chr${i}/chr*.maker.output/chr*_datastore/*/*/chr${i}/chr${i}.gff
awk '{if ($1=="chr'$i'") print}' $dir > chr${i}_edit.gff
done
cat chr01_edit.gff chr02_edit.gff chr03_edit.gff chr04_edit.gff chr05_edit.gff \
chr06_edit.gff chr07_edit.gff chr08_edit.gff chr09_edit.gff chr10_edit.gff \
chr11_edit.gff chr12_edit.gff chr13_edit.gff chr14_edit.gff chr15_edit.gff \
chr16_edit.gff chr17_edit.gff chr18_edit.gff chr19_edit.gff chr20_edit.gff \
> all.gff

##################EVM
transcript_alignments=/PASA/mydb_pasa0903.pasa_assemblies.gff3
gene_predictions=/MAKER/all.gff
ref=genome.fasta.masked
/software/EVidenceModeler/EVidenceModeler --genome $ref \
   --weights weights.txt \
   --gene_predictions $gene_predictions \
   --segmentSize 30000 \
   --overlapSize 10000 \
   --transcript_alignments $transcript_alignments \
   --sample_id EVM \
   --CPU 40

#update evm.gff3
DATABASE=mydb_pasa0903
/software/PASApipeline/misc_utilities/pasa_gff3_validator.pl EVM.EVM.gff3
ref=genome.fasta.masked
/software/PASApipeline/bin/seqclean $trifasta
conf=/software/PASApipeline/pasa_conf/pasa.annotationCompare.txt
trifasta=/Genome/ZY/ragtag_output1/trinity_out_dir.Trinity.fasta.clean
untri=/Genome/ZY/ragtag_output1/trinity_out_dir.Trinity.fasta
#
/software/PASApipeline/Launch_PASA_pipeline.pl -c $conf -A -g $ref -t $trifasta -T -L -u $untri --annots EVM.EVM.gff3 --CPU 60
first_update_gff3=`ls *gene_structures_post_PASA_updates*.gff3 -t | head -n 1`
/software/PASApipeline/Launch_PASA_pipeline.pl -c $conf -A -g $ref -t $trifasta -T -u $untri -L --annots $first_update_gff3 --CPU 60
second_update_gff3=`ls *gene_structures_post_PASA_updates*.gff3 -t | head -n 1`
/software/PASApipeline/Launch_PASA_pipeline.pl -c $conf -A -g $ref -t $trifasta -T -u $untri -L --annots $second_update_gff3
third_update_gff3=`ls *gene_structures_post_PASA_updates*.gff3 -t | head -n 1`
#
gff3_clear.pl --prefix evmPasa $third_update_gff3 > evmPasa.gff3
cd /Genome/ZY/ragtag_output
cp mydb_pasa0903.gene_structures_post_PASA_updates.13098.gff3 evm.pasa.gff3
grep -v "#" evm.pasa.gff3 > evm.pasa_nojing.gff3
grep "EVM" evm.pasa_nojing.gff3 > evm.pasa_nojing1.gff3
sort -k1,1 -k4,4n evm.pasa_nojing1.gff3 -o evm.pasa_nojing2.gff3

##################Rfam ncRNA
/software/Rfam/rfam_scan.pl -blastdb /rfam/Rfam.fasta /software/Rfam/Rfam.cm genome.fasta -o rfam_scan.gff3
##################eggnog-mapper
/software/eggnog-mapper-master/emapper.py -m diamond -i queries.fa --output_dir haihua/out -o test --cpu 40
##################interproscan
/software/interproscan-5.50-84.0-64-bit/interproscan-5.50-84.0/interproscan.sh -i haihua.fasta -f tsv -cpu 10 -appl CDD-3.18,Coils-2.2.1,Gene3D-4.2.0,Hamap-2020_05,MobiDBLite-2.0,PANTHER-15.0,Pfam-33.1,PIRSF-3.10,PRINTS-42.0,SFLD-4,SMART-7.1,SUPERFAMILY-1.75,TIGRFAM-15.0 -goterms -iprlookup -pa -hm -o res.out

