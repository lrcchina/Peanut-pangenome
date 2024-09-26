min=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.min
dist=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.dist
gbwt=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.gbwt
xg=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.xg
snarls=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.snarls
while read id
do
sample=$(echo $id |cut -d" " -f 1 )
file1=$(echo $id |cut -d" " -f 2 )
file2=$(echo $id |cut -d" " -f 3 )
echo $sample
echo $file1
echo $file2
echo -e "start to analysis $sample"
vg giraffe -o gaf -p -t 90 -b fast -m $min -d $dist --gbwt-name \
$gbwt -x $xg -N $sample -f $file1 -f $file2 | bgzip -@ 90 > ${sample}.gaf.gz

vg pack -x $xg -a ${sample}.gaf.gz -Q 5 -o ${sample}.pack -t 90
vg call $xg -r $snarls -k ${sample}.pack -a -A -t 90 -s $sample > ${sample}.vcf
rm -f ${sample}.gaf.gz
rm -f ${sample}.pack
echo -e "$sample QC OK"
done<DNAseq.path

