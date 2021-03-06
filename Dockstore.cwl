#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "cellassign-tool"
label: "cellassign-tool"

doc: |
    ![build_status](https://quay.io/repository/nceglia/cellassign-tool/status)
    A Docker container for the cellassign. See the [cellassign](https://github.com/Irrationone/cellassign) website for more information.

dct:creator:
  "@id": "https://orcid.org/0000-0001-9387-103X"
  foaf:name: Nicholas Ceglia
  foaf:mbox: "mailto:nickceglia@gmail.com"
requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/nceglia/cellassign-tool:latest"


cwlVersion: v1.0

inputs:
  singlecellexperiment:
    type: File
    doc: "SingleCellExperiment object"
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
      glob: "celltypes.rdata"
    doc: "RDS object that has clone to cell assignments."

baseCommand: ["Rscript", "/codebase/run_cellassign.R"]

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/
