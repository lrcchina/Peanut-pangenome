#kaks
for i in core soft_core dispensable private
do
ParaAT.pl -h Orthogroups-${i}_genename_tablist.txt -n Orthogroups-${i}_genename_id.cds -a Orthogroups-${i}_genename_id.pep -p proc -o ${i}_output -g -k -f axt
done

