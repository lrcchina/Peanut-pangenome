ref=genome.fasta
#identify the TE protein domains on the genome
TEsorter $ref -genome -p 32 -db rexdb -cov 30 -eval 1e-5 -prob 0.9 > tesorter.stats

