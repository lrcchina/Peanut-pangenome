import sys
args=sys.argv
file=open(args[1],"r")
file1=open(args[2],"w")
conts=file.read().split("\n")
a=0
for i in conts:
	if(len(conts[a])>0):
		if(conts[a][0]!="#"):
			contss=conts[a].split('\t')
			chrname = contss[0]
			pos = contss[1]
			ref = contss[3]
			alt = contss[4]

			contss1=conts[a-1].split('\t')
			chrname1 = contss1[0]
			pos1 = contss1[1]
			ref1 = contss1[3]
			alt1 = contss1[4]
			if(chrname==chrname1 and pos !=pos1):
				file1.write(conts[a]+"\n")
		else:
			file1.write(conts[a]+"\n")
	a=a+1

file.close()
file1.close()


