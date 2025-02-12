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
ref=/DATA-315TB/Genome/Peanut-A-B-genome/chr/A_B.fa
#mapping resequencing data onto the reference genome
bwa mem -t 80 -r "@RG\tID:$sample\tLB:$sample\tSM:$sample\tPL:ILLUMINA" $ref $file1 $file2 -o ${sample}.sam
#convert sam to bam
samtools view -@ 80 -bS ${sample}.sam -o ${sample}.bam
#sort bam files
samtools sort -@ 80 ${sample}.bam -o out.${sample}.bam
#index bam files
samtools index -@ 80 out.${sample}.bam
rm -f ${sample}.bam
rm -f ${sample}.sam
echo -e "$sample QC OK"
done<$out_dir/DNAseq.path
