#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "cellassign-tool"
label: "cellassign-tool"
cwlVersion: v1.0.20190228155703
doc: |
    ![build_status](https://quay.io/repository/nceglia/cellassign-tool/status)
    A Docker container for the clonealign. See the [cellassign](https://github.com/Irrationone/cellassign) website for more information.

dct:creator:
  "@id": "https://orcid.org/0000-0001-9387-103X"
  foaf:name: Nicholas Ceglia
  foaf:mbox: "mailto:nickceglia@gmail.com"
requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/collaboratory/nceglia/cellassign-tool:latest"
inputs:
  singlecellexperiment:
    type: File
    doc: "SingleCellExperiment object"
    format: "https://bioconductor.org/packages/release/bioc/html/SingleCellExperiment.html"
    inputBinding:
      position: 1
  gene_marker_matrix:
    type: File
    doc: "RDS gene-by-cell-type binary matrix"
    inputBinding:
      position: 2
outputs:
  cell_type_assignments:
    type: File
    outputBinding:
      glob: celltypes.rdata
    doc: "RDS object that has clone to cell assignments."
baseCommand: ["Rscript", "/codebase/run_cellassign.R"]

1.0.20190228155703
1.0.20181217162649
