ref=genome.fasta
transcript=transcript.fa
PASAHOME=/bin/miniconda3/envs/perl/opt/pasa-2.4.1

$PASAHOME/bin/seqclean $transcript
db=$PWD/database.sqlite
echo "
# database settings
DATABASE=$db
#script validate_alignments_in_db.dbi
validate_alignments_in_db.dbi:--MIN_PERCENT_ALIGNED=95
validate_alignments_in_db.dbi:--MIN_AVG_PER_ID=98
" > pasa.alignAssembly.config
#use transcriptome data for gene structure prediction and transcript redundancy removal
$PASAHOME/Launch_PASA_pipeline.pl \
          -c pasa.alignAssembly.config -C -R -g $ref \
          -t $transcript.clean -T -u $transcript \
          --ALIGNERS gmap --CPU 40
