#bash vcftools_SURVIVOR_tif_ref.sh
################################################合并SNP
for i in aisheng BaileyII DL135 DL328 gzys H002 Haihua Kaust SA006 SA256 SA519 SA922 Shitouqi
do
	for sv in SNP
    do
	editvcfDEL_INS.py ${i}.${sv}.vcf 15_header_tif_ref ${i}.${sv}.vcf1 ${i}
	grep -v "<" ${i}.SNP.vcf1 >${i}.SNP.vcf12
	rm -f ${i}.SNP.vcf1
	mv ${i}.SNP.vcf12 ${i}.SNP.vcf1
	done
done

for i in aisheng BaileyII DL135 DL328 gzys H002 Haihua Kaust SA006 SA256 SA519 SA922 Shitouqi
do
	for sv in SNP
    do
	bgzip -k -f ${i}.${sv}.vcf1
	tabix -f ${i}.${sv}.vcf1.gz
	done
done

vcf-merge -d -R 0/0 aisheng.SNP.vcf1.gz BaileyII.SNP.vcf1.gz DL135.SNP.vcf1.gz DL328.SNP.vcf1.gz gzys.SNP.vcf1.gz H002.SNP.vcf1.gz Haihua.SNP.vcf1.gz Kaust.SNP.vcf1.gz SA006.SNP.vcf1.gz SA256.SNP.vcf1.gz SA519.SNP.vcf1.gz SA922.SNP.vcf1.gz Shitouqi.SNP.vcf1.gz  >merged.SNP.vcf

python uniqSNP.py merged.SNP.vcf merged.SNP1.vcf
mv merged.SNP.vcf merged.SNP-备份.vcf
mv merged.SNP1.vcf merged.SNP.vcf

################################################合并INS DEL

for i in aisheng BaileyII DL135 DL328 gzys H002 Haihua Kaust SA006 SA256 SA519 SA922 Shitouqi
do
	for sv in INS DEL
   do
	editvcfDEL_INS.py ${i}.${sv}.vcf 15_header_tif_ref ${i}.${sv}.vcf1 ${i}
	done
done


for sv in INS DEL
do
	ls *${sv}.vcf1 > sample_files.${sv}
	SURVIVOR merge sample_files.${sv} 50 1 0 0 0 0 merged.${sv}.vcf
	python revise-vcf-gt.py merged.${sv}.vcf merged1.${sv}.vcf
	rm -f merged.${sv}.vcf
	mv merged1.${sv}.vcf merged.${sv}.vcf
done

################################################合并INV TRANS CNV

for i in aisheng BaileyII DL135 DL328 gzys H002 Haihua Kaust SA006 SA256 SA519 SA922 Shitouqi
do
	for sv in INV TRANS CNV
  do
	editvcfINV_TRANS_CNV.py ${i}.${sv}.vcf 15_header_tif_ref ${i}.${sv}.vcf1 ${i} ${sv}
	done
done

for sv in INV TRANS CNV
do
	ls *${sv}.vcf1 > sample_files.${sv}
	SURVIVOR merge sample_files.${sv} 50 1 0 0 0 0 merged.${sv}.vcf
	python revise-vcf-gt.py merged.${sv}.vcf merged1.${sv}.vcf
	rm -f merged.${sv}.vcf
	mv merged1.${sv}.vcf merged.${sv}.vcf
done
