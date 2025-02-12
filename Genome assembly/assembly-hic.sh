ENZYME=DpnII
GENOME=ref
REF=ref.fa	# soft link to contig-level assembly
JUICER_HOME=/bin/juicer/UGER
#generate enzyme cutting sites of contigs
generate_site_positions.py $ENZYME $GENOME $REF
#create index
bwa index $REF
#mapping Hi-C reads onto the assembled contigs
$JUICER_HOME/scripts/juicer.sh -s $ENZYME -y $GENOME\_$ENZYME.txt -z $REF -D $JUICER_HOME -p $REF.chrom.sizes -t 100
#3d-dna 
/bin/3d-dna/run-asm-pipeline.sh --early-exit -m haploid -i 150000 -r 0 $REF aligned/merged_nodups.txt
#using juicebox to assemble chromosomes based on Hi-C interaction information
java -jar /mnt/NFS/software/juicebox/juicebox.jar
#generate the assembled chromosomes
bash /bin/3d-dna/run-asm-pipeline-post-review.sh -r SA922contigs.0.review.assembly -g 100 $ref $nodup

