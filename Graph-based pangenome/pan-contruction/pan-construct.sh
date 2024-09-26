vg construct -t 60 -a -f -S -v merged1.vcf -r Tif_genome.fasta > peanut.vg

vg index -L -t 60 -x peanut.xg peanut.vg
vg gbwt --num-threads 60 -g peanut.gg -x peanut.xg -o peanut.gbwt -P
vg index -L -t 60 -j peanut.dist peanut.vg
vg minimizer -t 60 -i peanut.min -g peanut.gbwt -d peanut.dist peanut.xg
vg snarls -t 60 peanut.xg > peanut.snarls
