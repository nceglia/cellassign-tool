FROM nceglia/base-r-scrna:latest

MAINTAINER Nicholas Ceglia <nickceglia@gmail.com>

COPY run_cellassign.R /codebase/run_cellassign.R

ENTRYPOINT ["Rscript", "/codebase/run_cellassign.R"]
CMD ["example_sce.rdata","example_rho.rdata"]
