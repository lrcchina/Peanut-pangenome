
while read line;do
    eval "$line"
done <$1

echo $DNA_SEQ_dir
echo $out_dir

soft="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo $soft

if [ ! -d $out_dir  ];then
  mkdir -p $out_dir
else
  if [ -e $out_dir/DNAseq.path ]
  then
    rm -f $out_dir/DNAseq.path
  fi
fi
#get the accession names and data paths
for i in $DNA_SEQ_dir/*
 do 
  if test -d $i
   then
    echo $i
    a=${i##*/}
     for j in $( find $i -name "*.gz"|sort)
     do
      echo $j
      a="$a\t$j"
     done
     echo -e $a>>$out_dir/DNAseq.path
  fi
done

echo 'start BSA analysis procession'

while read id
do
sample=$(echo $id |cut -d" " -f 1 )
file1=$(echo $id |cut -d" " -f 2 )
file2=$(echo $id |cut -d" " -f 3 )
echo $sample
echo $file1
echo $file2
echo -e "start to analysis $sample"
min=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.min
dist=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.dist
gbwt=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.gbwt
xg=/mnt/NFS/analysis-results/Pan-Genome/result/tif_ref/peanut.xg
#generate bam files using vg giraffe
vg giraffe -o bam -p -t 80 -b fast -m $min -d $dist --gbwt-name $gbwt -x $xg -N $sample -f $file1 -f $file2 >${sample}.bam
#sort the bam files
samtools sort -@ 80 ${sample}.bam -o out.${sample}.bam
#add the sample tag to the header of the bam file
samtools addreplacerg -@ 80 -r "@RG\tID:$sample\tSM:$sample\tLB:$sample" out.$sample.bam -o out.${sample}_tag.bam
samtools index -@ 80 out.${sample}_tag.bam
rm -f out.${sample}.bam
rm -f ${sample}.bam
echo -e "$sample QC OK"
echo out.${sample}_tag.bam >> bam.list
done<$out_dir/DNAseq.path


