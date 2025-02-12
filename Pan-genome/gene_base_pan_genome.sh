conda create --name orthofinder python=3.8
conda activate orthofinder
conda install OrthoFinder
conda activate orthofinder
#get gene families using orthofinder
#pep is the directory name which contains 14 protein files
orthofinder -f pep -t 60 -a 60 -M msa -T iqtree -os
