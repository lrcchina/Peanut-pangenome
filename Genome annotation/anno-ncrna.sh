SEQS=genome.fasta
prefix=$(basename $SEQS)
OUT=$prefix.trna.tab
tRNAscan-SE $SEQS > $OUT

barrnap $SEQS --kingdom euk --threads 10 > rrna.barrnap.gff3

rfam_scan.pl -blastdb /database/Rfam/Rfam /database/Rfam/Rfam.cm $SEQS -o rfam.gff
