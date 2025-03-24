#assemble hifireads, the ccs.fa.gz is the hifi data, 
#the T20210525_RR00155_RUN263_R1.fastq.gz is the Hi-C R1
#the T20210525_RR00155_RUN263_R2.fastq.gz is the Hi-C R2
hifiasm -o hifiasm -t100 --h1 T20210525_RR00155_RUN263_R1.fastq.gz --h2 T20210525_RR00155_RUN263_R2.fastq.gz --l-msjoin 100000 ccs.fa.gz
