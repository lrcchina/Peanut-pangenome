#kaks
for i in core soft_core dispensable private
do
#the Orthogroups-${i}_genename_tablist.txt contains two column gene IDs.
#the cds file and the pep file are all sequences of the group.
ParaAT.pl -h Orthogroups-${i}_genename_tablist.txt -n Orthogroups-${i}_genename_id.cds -a Orthogroups-${i}_genename_id.pep -p proc -o ${i}_output -g -k -f axt
done

