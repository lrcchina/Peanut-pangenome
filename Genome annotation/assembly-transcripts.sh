REF=genome.fasta
hisat2-build $REF $REF
#map the RNA-seq data onto the reference genome
hisat2 -p 5 --dta -x $REF -1 R1.fastq.gz -2 R2.fastq.gz --dta-cufflinks --summary-file hisat2_out.summary --new-summary | samtools sort > hisat2_out.bam
#assemble the transcirpts based on bam files using stringtie
stringtie -p 40 -o Stringtie.gtf hisat2_out.bam
