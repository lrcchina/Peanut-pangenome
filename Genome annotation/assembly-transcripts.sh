#assemble the RNA-seq data
Trinity --min_kmer_cov 5 --normalize_max_read_cov 50 --KMER_SIZE 25 --output trinity_out_dir --no_version_check --seqType fq --max_memory 200G --left R1.fastq.gz  --right R2.fastq.gz  --CPU 40

REF=genome.fasta
hisat2-build $REF $REF
#map the RNA-seq data onto the reference genome
hisat2 -p 5 --dta -x $REF -1 R1.fastq.gz -2 R2.fastq.gz --dta-cufflinks --summary-file hisat2_out.summary --new-summary | samtools sort > hisat2_out.bam
#assemble the transcirpts based on bam files using stringtie
stringtie -p 40 -o Stringtie.gtf hisat2_out.bam
