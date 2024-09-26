#!/home/anaconda3/envs/syri/bin/python

import sys
args=sys.argv
file1=open(args[1],"r")
file2=open(args[2],"r")#header
contsh=file2.read()
conts=file1.read().split("\n")
file3=open(args[3],"w")
file3.write(contsh+"\n")
file3.write("#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT\t"+args[4]+"\n")
a=0
for i in conts:
    contss=conts[a].split("\t")
    if(len(contss)>2):
        b=0
        for i in range(0,len(contss)):
            if b==5:
                file3.write("30\t")
            elif(b==len(contss)-1):
                file3.write(".\tGT\t1/1\n")
            else:
                file3.write(contss[b]+"\t")
            b=b+1
    a=a+1

file1.close()
file2.close()
file3.close()
