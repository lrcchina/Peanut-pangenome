conda create --name orthofinder python=3.8
conda activate orthofinder
conda install OrthoFinder
conda activate orthofinder
orthofinder -f pep -t 60 -a 60 -M msa -T iqtree -ot
