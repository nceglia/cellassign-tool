FROM nceglia/base-r-scrna:latest

MAINTAINER Nicholas Ceglia <nickceglia@gmail.com>

CMD R -e "tensorflow::install_tensorflow();"

COPY run_cellassign.R /codebase/run_cellassign.R



CMD ["/bin/bash"]
