#cd nucmer
#bash svmu_nucmer.sh DL135 Tif
genome=$1
refgenome=$2
for i in {01..20}
do
#comparision between chromosomes using nucmer
echo "nucmer -t 40 ../../${refgenome}/chr${i}.fasta ../$genome/chr${i}.fasta --prefix chr$i"
done > nucmer.sh
ParaFly -c nucmer.sh -CPU 20

#svmu analyze the delta files
for i in {01..20}
do
	svmu chr${i}.delta ../../${refgenome}/chr${i}.fasta ../$genome/chr${i}.fasta 100 h> chr${i}.small.txt
	mv sv.txt chr${i}.sv.txt
	mv indel.txt chr${i}.indel.txt
	mv cnv_all.txt chr${i}cnv_all.txt
	mv small.txt chr${i}.small1.txt
	mv cords.txt chr${i}.cords.txt
done

#get CNVs from analysis results
for i in {01..20}
do
	grep CNV chr${i}.sv.txt | awk '$(NF-2)>50' | awk '$NF!=0&&$(NF-1)!=0&&$NF!="inf"&&$(NF-1)!="inf"' | awk '$NF/$(NF-1)>=2||$(NF-1)/$NF>=2' > chr${i}.sv.CNV.xls
        rm -f chr${i}.sv.CNV.vcf
        cat chr${i}.sv.CNV.xls | while read n
        do
            chr=`echo $n | awk '{print $1}'`
            pos=`echo $n | awk '{print $2}'`
			ref_pos=`echo $n | awk '{if($2<=$3){print $1":"$2"-"$3}else{print $1":"$3"-"$2}}'`
			alt_pos=`echo $n | awk '{if($6<=$7){print $5":"$6"-"$7}else{print $5":"$7"-"$6}}'`
            ref_seq=`samtools faidx ../../${refgenome}/chr${i}.fasta $ref_pos | grep -v '>' | python tihuanhang.py -i stdin`
            alt_seq=`samtools faidx ../${genome}/chr${i}.fasta $alt_pos | grep -v '>' | python tihuanhang.py -i stdin`
            echo -e "${chr}\t${pos}\tCNV\t${ref_seq}\t${alt_seq}\t30\tPASS\t.\tGT\t1/1" >> chr${i}.sv.CNV.vcf
        done
done

#merge results of all chromosomes
cat *sv.CNV.vcf >${genome}.CNV.vcf
sort -k1,1 -k2,2n ${genome}.CNV.vcf -o ${genome}.CNV.vcf
cp ${genome}.CNV.vcf ../../merge-alter/



