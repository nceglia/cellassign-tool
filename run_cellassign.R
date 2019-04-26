library(cellassign)
library(tensorflow)
library(scran)
library(SingleCellExperiment)

args = commandArgs(trailingOnly=TRUE)

rdata <- paste0("/data/",args[1])
sce <- readRDS(rdata)

rdata <- paste0("/data/",args[2])
rho <- readRDS(rdata)

rho <- as.matrix(rho)
counts(sce) <- data.matrix(counts(sce))

s <- sizeFactors(sce)

fit_cellassign <- cellassign(exprs_obj = sce, marker_gene_info = rho, s = s, shrinkage=TRUE)
saveRDS(fit_cellassign, file = '/results/celltypes.rdata')
