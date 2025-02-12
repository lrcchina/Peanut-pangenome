
PRED_GFF3=ABINITIO_PREDICTION.gff3	# output of MAKER
TRANS_GFF3=TRANSCRIPT.gff3	# output of PASA
PRO_GFF3=PROTEIN.gff3	# output of MAKER
REP_GFF3=REPEAT.gff3	# output of TEsorter
SEQS=genome.fasta
EVM_OUT=evm_working


partition_EVM_inputs.pl --genome $SEQS --gene_predictions $PRED_GFF3 --transcript_alignments $TRANS_GFF3 \
    --protein_alignments $PRO_GFF3 --repeats $REP_GFF3 \
    --segmentSize 1000000 --overlapSize 100000 --partition_listing partitions_list.out

write_EVM_commands.pl --genome $SEQS --weights weights.txt --gene_predictions $PRED_GFF3 --transcript_alignments $TRANS_GFF3 \
    --protein_alignments $PRO_GFF3 --repeats $REP_GFF3 \
    --output_file_name evm.out  --partitions partitions_list.out >  commands.list
execute_EVM_commands.pl commands.list > run.log 2>&1

recombine_EVM_partial_outputs.pl --partitions partitions_list.out --output_file_name evm.out
convert_EVM_outputs_to_GFF3.pl  --partitions partitions_list.out --output evm.out  --genome $SEQS
find . -regex ".*evm.out.gff3" -exec cat {} \; | python ~/src/Maker.py fix_evm_frame > EVM.all.gff3

