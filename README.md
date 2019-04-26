# cellassign-tool
Container for running cellassign.

Github: [Irrationone/cellassign](https://github.com/Irrationone/cellassign)  <br/> 
Reference: https://www.biorxiv.org/content/10.1101/521914v1

### To run *cellassign* on saved RDS data. ###
 - Create ./data and ./results directories.
 - Place RDS files into data directory. [Tutorial](https://github.com/Irrationone/cellassign/blob/master/vignettes/introduction-to-cellassign.Rmd)
    1. SingleCellExperiment object
    2. Marker Gene Matrix - gene-by-cell-type binary matrix
 - Run docker command mounting ./results to /results and ./data to /data
 - Results are stored in "./results/celltypes.rdata"

#### Example Docker Commands ####
```
sudo docker build -t run-cellassign .
sudo docker run --rm --mount type=bind,source=$(pwd)/data,target=/data --mount type=bind,source=$(pwd)/results,target=/results  run-cellassign example_sce.rdata example_rho.rdata
```
