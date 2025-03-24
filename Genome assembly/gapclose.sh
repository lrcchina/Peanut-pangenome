ref=$1	# scaffolded assembly
#use ONT reads to fill gaps,the pass.fq.gz is the ONT reads
LR_Gapcloser.sh -i $ref -l pass.fq.gz -s ont -t 10 -r 2 -o out -g 500 -v 500 -a 0.25
