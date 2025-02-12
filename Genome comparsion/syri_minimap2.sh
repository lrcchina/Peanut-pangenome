#bash -i syri_minimap2.sh Tif DL135
conda activate syri_new
genome=$1
refgenome=$2
for i in {01..20}
do
#comparision between chromosomes using minimap2
echo "minimap2 -t 40 -ax asm5 --eqx ../../${refgenome}/chr${i}.fasta ../${genome}/chr${i}.fasta | samtools view -b > ${genome}_${refgenome}_chr${i}.bam"
done > minimap2.sh
ParaFly -c minimap2.sh -CPU 20

#
for i in {01..20}
do
	#sort bam files
	samtools sort -@ 20 ${genome}_${refgenome}_chr${i}.bam -o ${genome}_${refgenome}_chr${i}_sorted.bam
	#create index
	samtools index -@ 20 ${genome}_${refgenome}_chr${i}_sorted.bam
	rm -f ${genome}_${refgenome}_chr${i}.bam
	#get variations from bam files using syri
	syri -c ${genome}_${refgenome}_chr${i}_sorted.bam -r ../../${refgenome}/chr${i}.fasta -q ../${genome}/chr${i}.fasta -k -F B --prefix ${genome}_${refgenome}_chr${i}
done

#get invertions
for i in {01..20}
do
	cat ${genome}_${refgenome}_chr${i}invOut.txt | grep '#' > ${genome}_${refgenome}_chr${i}_INV.xls
	rm -f ${genome}_${refgenome}_chr${i}_syri_INV.vcf
	cat ${genome}_${refgenome}_chr${i}_INV.xls | while read n
	do
		#get chromosome name of invertions
		chr=`echo $n | awk '{print $2}'`
        pos=`echo $n | awk '{print $3}'`
		#get chromosome names, start positions and end positions of invertions
        ref_pos=`echo $n | awk '{print $2":"$3"-"$4}'`
        alt_pos=`echo $n | awk '{print $6":"$7"-"$8}'`
		#get sequences of invertions
		ref_seq=`samtools faidx ../../${refgenome}/chr${i}.fasta $ref_pos | grep -v '>' | python3 tihuanhang.py -i stdin`
		alt_seq=`samtools faidx ../${genome}/chr${i}.fasta $alt_pos | grep -v '>' | python3 tihuanhang.py -i stdin`
		echo -e "${chr}\t${pos}\tINV\t${ref_seq}\t${alt_seq}\t30\tPASS\t.\tGT\t1/1" >> ${genome}_${refgenome}_chr${i}_syri_INV.vcf
	done
done

#get deletions and insertions
for i in {01..20}
do
	cat ${genome}_${refgenome}_chr${i}syri.vcf|egrep 'INS|DEL'|awk 'length($4)-length($5)>50' > ${genome}_${refgenome}_chr${i}_syri_DEL.vcf
	cat ${genome}_${refgenome}_chr${i}syri.vcf|egrep 'INS|DEL'|awk 'length($5)-length($4)>50' > ${genome}_${refgenome}_chr${i}_syri_INS.vcf
done

#get SNPs, as well as deletions and insertions with a length less than 50bp.
for i in {01..20}
do
	cat ${genome}_${refgenome}_chr${i}syri.vcf|grep 'DEL'|awk 'length($4)-length($5)<=50' > ${genome}_${refgenome}_chr${i}_syri_SNP_DEL.vcf
	cat ${genome}_${refgenome}_chr${i}syri.vcf|grep 'INS'|awk 'length($5)-length($4)<=50' > ${genome}_${refgenome}_chr${i}_syri_SNP_INS.vcf
	cat ${genome}_${refgenome}_chr${i}syri.vcf|grep 'SNP'|awk 'length($5)-length($4)==0' > ${genome}_${refgenome}_chr${i}_syri_SNP.vcf
done
#merge SNPs of all chromosomes
cat *syri_SNP*.vcf >${genome}.SNP.vcf
grep -v "##" ${genome}.SNP.vcf >${genome}.SNP1.vcf
rm -f ${genome}.SNP.vcf
mv ${genome}.SNP1.vcf ${genome}.SNP.vcf
sort -k1,1 -k2,2n ${genome}.SNP.vcf -o ${genome}.SNP.vcf
cp -f ${genome}.SNP.vcf ../../merge-alter/


#get tranlocations
for i in {01..20}
do
	python3 output_translocation_from_vcf.py ${genome}_${refgenome}_chr${i}syri.vcf > ${genome}_${refgenome}_chr${i}_TRANS.xls
	rm -f ${genome}_${refgenome}_chr${i}_syri_TRANS.vcf
	cat ${genome}_${refgenome}_chr${i}_TRANS.xls | while read n
	do
		#get chromosome name of invertions
		chr=`echo $n | awk '{print $2}'`
		pos=`echo $n | awk '{print $3}'`
		#get chromosome names, start positions and end positions of invertions
		ref_pos=`echo $n | awk '{print $2":"$3"-"$4}'`
		alt_pos=`echo $n | awk '{print $6":"$7"-"$8}'`
		#get sequences of invertions
		ref_seq=`samtools faidx ../../${refgenome}/chr${i}.fasta $ref_pos | grep -v '>' | python3 tihuanhang.py -i stdin`
		alt_seq=`samtools faidx ../${genome}/chr${i}.fasta $alt_pos | grep -v '>' | python3 tihuanhang.py -i stdin`
		echo -e "${chr}\t${pos}\tTRANS\t${ref_seq}\t${alt_seq}\t30\tPASS\t.\tGT\t1/1" >> ${genome}_${refgenome}_chr${i}_syri_TRANS.vcf
	done
done

#merge results of all chromosomes
cat *syri_INV.vcf >${genome}.INV.vcf
cat *syri_DEL.vcf >${genome}.DEL.vcf
cat *syri_INS.vcf >${genome}.INS.vcf
cat *syri_TRANS.vcf >${genome}.TRANS.vcf
rm -f stats.txt
#get the number of SVs
wc -l ${genome}.DEL.vcf >>stats.txt
wc -l ${genome}.INS.vcf >>stats.txt
wc -l ${genome}.INV.vcf >>stats.txt
wc -l ${genome}.TRANS.vcf >>stats.txt

cp -f ${genome}.INV.vcf ../../merge-alter/
cp -f ${genome}.DEL.vcf ../../merge-alter/
cp -f ${genome}.INS.vcf ../../merge-alter/
cp -f ${genome}.TRANS.vcf ../../merge-alter/

