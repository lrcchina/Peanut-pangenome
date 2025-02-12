#carry out the maker gene annotation pipeline which contains ab initio gene prediction of AUGUSTUS.
maker --ignore_nfs_tmp

cat */*/*/*/*/*.gff | gzip  > all.gff.gz
zcat all.gff.gz |awk '$2=="maker"'  > ABINITIO_PREDICTION.gff3
zcat all.gff.gz | awk '$2=="protein2genome" && $3=="match_part"' > PROTEIN.gff3
