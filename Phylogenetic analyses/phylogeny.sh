#convert variations to the phylip format
python3 vcf2phylip.py -i merged.SNP-add1.min4.vcf
#generate the phylogenetic tree using fasttreemp based on neighbor-ioining method
fasttreemp -nt merged.SNP-add1.min4.phy >tree
