pep=pep.faa

for db in nr swiss trembl A_thaliana
do
    diamond blastp --query $pep --db $db --out ${db}_out_diamond --evalue 1e-5 --outfmt 6 --max-target-seqs 5 --threads 40"
done 

emapper.py -i $pep --output eggNOG-mapper -m diamond --scratch_dir /tmp --temp_dir /tmp --cpu 40


interproscan.sh -i $pep -appl TIGRFAM,Phobius,SUPERFAMILY,PANTHER,Gene3D,SMART,CDD,Pfam,MobiDBLite,PIRSF,TMHMM,PRINTS,Coils -dp 
