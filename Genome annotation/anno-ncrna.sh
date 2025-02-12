SEQS=genome.fasta
prefix=$(basename $SEQS)
OUT=$prefix.trna.tab
#annotate tRNAs
tRNAscan-SE $SEQS > $OUT
#annotate rRNAs
barrnap $SEQS --kingdom euk --threads 10 > rrna.barrnap.gff3
#annotate ncRNAs
rfam_scan.pl -blastdb /database/Rfam/Rfam /database/Rfam/Rfam.cm $SEQS -o rfam.gff
