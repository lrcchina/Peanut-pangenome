ref=genome.fasta
#get TE library of the genome
EDTA.pl --genome $ref --overwrite 0 --sensitive 1 --anno 1  --threads 40
#identify the repeated regions of the genome
RepeatMasker -lib $ref.mod.EDTA.TElib.fa $ref -parallel 40 -dir rmout -no_is -xsmall
