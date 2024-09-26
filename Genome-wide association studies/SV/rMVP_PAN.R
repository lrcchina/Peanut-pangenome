library(rMVP)
Args <- commandArgs(TRUE)
setwd(Args[1])
#MVP.Data.VCF2MVP("maf0.05.recode.vcf", out='mvp')
genotype <- attach.big.matrix("/mapping_to_pan/过滤vcf/mvp.geno.desc")
map <- read.table("/mapping_to_pan/过滤vcf/mvp.geno.map" , head = TRUE) 
phenotype <- read.table(Args[2],head=TRUE)


for(i in 2:ncol(phenotype)){
  imMVP <- MVP(
    phe=phenotype[, c(1, i)],
    geno=genotype,
    map=map,
    #K=Kinship,
    #CV.GLM=Covariates,
    #CV.MLM=Covariates,
    #CV.FarmCPU=Covariates,
    nPC.GLM=5,
    nPC.MLM=3,
    nPC.FarmCPU=3,
    priority="speed",
    #ncpus=10,
    vc.method="BRENT",
    maxLoop=10,
    method.bin="static",
    #permutation.threshold=TRUE,
    #permutation.rep=100,
    threshold=0.05,
    method=c("GLM", "MLM", "FarmCPU")
  )
  gc()
}

