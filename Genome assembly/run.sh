#####################bam2fasta
bam2fasta -o D01 D01.hifi_reads.bam
#####################hifireads
hifiasm -o SA922contigs -t 40 D01.fasta.gz
# get primary contigs in FASTA
awk '/^S/{print ">"$2;print $3}' SA922contigs.asm.hic.p_ctg.gfa > SA922contigs.asm.p_ctg.fa
mv SA922contigs.p_ctg.fa SA922contigs.fa
#N50
java -jar gnx.jar SA922contigs.fa >N50

#####################Hi-C reads
conda activate juicer
afile=SA922contigs.fa
python /software/juicer-1.6/misc/generate_site_positions.py DpnII SA922contigs $afile
awk 'BEGIN{OFS="\t"}{print $1, $NF}'  SA922contigs_DpnII.txt > SA922contigs.chrom.sizes
mkdir work
cd work
mkdir fastq
cd fastq
ln -s /mnt/NFS/Genome/SA922/HIC/Peanut_N257-H02_good_1.fq.gz SA922_R1.fastq.gz
ln -s /mnt/NFS/Genome/SA922/HIC/Peanut_N257-H02_good_2.fq.gz SA922_R2.fastq.gz
bwa index -a bwtsw SA922contigs.fa
ref=SA922contigs.fa
ref=/mnt/NFS/Genome/SA922/hifi/组装的contigs/SA922contigs.fa
bash /mnt/NFS/software/juicer-1.6/scripts/juicer.sh \
	-g SA922 \
	-z $ref \
	-p /mnt/NFS/analysis-results/genome_assembly/SA922/SA922contigs.chrom.sizes \
	-y /mnt/NFS/analysis-results/genome_assembly/SA922/SA922contigs_DpnII.txt \
	-s DpnII \
	-d /mnt/NFS/analysis-results/genome_assembly/SA922/work \
	-D /mnt/NFS/software/juicer-1.6 \
	-t 40 > log.txt

#####################3d-dna 
cd /mnt/NFS/analysis-results/genome_assembly/SA922
ref=/mnt/NFS/Genome/SA922/hifi/组装的contigs/SA922contigs.fa
nodup=/mnt/NFS/analysis-results/genome_assembly/SA922/work/aligned/merged_nodups.txt
bash /mnt/NFS/software/3d-dna/run-asm-pipeline.sh $ref $nodup
#
java -jar /mnt/NFS/software/juicebox/juicebox.jar
#
bash /mnt/NFS/software/3d-dna/run-asm-pipeline-post-review.sh -r SA922contigs.0.review.review.assembly -g 100 $ref $nodup
bash /mnt/NFS/software/3d-dna/run-asm-pipeline-post-review.sh -r SA922contigs.2.review.assembly -g 100 $ref $nodup
bash /mnt/NFS/software/3d-dna/run-asm-pipeline-post-review.sh -r SA922contigs.3.review.assembly -g 100 $ref $nodup
#chromosome mapping
tifref=/Tifrunner-V2/J5K5/arahy.Tifrunner.gnm2.J5K5.genome_main.fna
nucmer --mum --mincluster 500 -t 20 $tifref SA922contigs.FINAL.fasta -p SA922_Tif
delta-filter -1 -i 90 -l 5000 SA922_Tif.delta > SA922_Tif.best.delta
mummerplot -p SA922_Tif -f SA922_Tif.best.delta -t postscript
ps2pdf SA922_Tif.ps SA922_Tif.pdf

#####################LR_Gapcloser ONT gap fill
ontreads=N02.filt.fa
scaffold=genome_20.fasta
LR_Gapcloser-master/src/LR_Gapcloser.sh -i $scaffold \
 -l $ontreads -s n -t 60 -m 1000000 -v 10000

