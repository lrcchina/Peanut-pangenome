#create the pangeome using vg construct command and the merged1.vcf contains variations
vg construct -t 60 -a -f -S -v merged1.vcf -r Tif_genome.fasta > peanut.vg
#generate xg file of pangeome
vg index -L -t 60 -x peanut.xg peanut.vg
#generate the gbwt file of pangeome
vg gbwt --num-threads 60 -g peanut.gg -x peanut.xg -o peanut.gbwt -P
#generate the dist file of pangeome
vg index -L -t 60 -j peanut.dist peanut.vg
#generate the min file of pangeome
vg minimizer -t 60 -i peanut.min -g peanut.gbwt -d peanut.dist peanut.xg
#generate the snarls file of pangeome
vg snarls -t 60 peanut.xg > peanut.snarls
