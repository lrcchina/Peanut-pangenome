import sys
args=sys.argv

file1=open(args[1],"r")
conts=file1.read().split("\n")
file2=open(args[2],"w")
a=0
for i in conts:
    if len(conts[a])>0 and conts[a][0]!="#":
        contss=conts[a].split("\t")
        b=0
        for i in range(0,len(contss)):
            if b==8:
                file2.write("GT\t")
            elif b>8 and b!=len(contss)-1:
                if(contss[b].split(":")[0]=="./."):
                    file2.write("0/0\t")
                else:
                    file2.write(contss[b].split(":")[0]+"\t")
            elif b==len(contss)-1:
                if(contss[b].split(":")[0]=="./."):
                    file2.write("0/0\n")
                else:
                    file2.write(contss[b].split(":")[0]+"\n")
            else:
                file2.write(contss[b]+"\t")
            b=b+1
    else:
        file2.write(conts[a]+"\n")
    a=a+1

file1.close()
file2.close()
