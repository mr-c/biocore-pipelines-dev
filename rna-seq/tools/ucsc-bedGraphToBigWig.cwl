#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
- class: InlineJavascriptRequirement
- $import: ucsc-userapps-docker.yml

inputs:
  blockSize:
    type: int?
    inputBinding:
      separate: false
      position: 1
      prefix: -blockSize=
    doc: |
      -blockSize=N - Number of items to bundle in r-tree.  Default 256
  itemsPerSlot:
    type: int?
    inputBinding:
      separate: false
      position: 1
      prefix: -itemsPerSlot=
    doc: |
      -itemsPerSlot=N - Number of data points bundled at lowest level. Default 1024
  unc:
    type: boolean?
    inputBinding:
      position: 1
      prefix: -unc
    doc: If set, do not use compression.
  bigWig:
    type: string
    inputBinding:
      position: 4

  input:
    type: File
    inputBinding:
      position: 2

  genomeFile:
    type: File
    inputBinding:
      position: 3

outputs:
  bigWigOut:
    type: File
    outputBinding:
      glob: $(inputs.bigWig)

baseCommand: [bedGraphToBigWig]
$namespaces:
  s: http://schema.org/

$schemas:
- https://schema.org/version/latest/schema.rdf

s:mainEntity:
  $import: ucsc-metadata.yaml

s:downloadUrl: https://github.com/common-workflow-language/workflows/blob/master/tools/ucsc-bedGraphToBigWig.cwl
s:codeRepository: https://github.com/common-workflow-language/workflows
s:license: http://www.apache.org/licenses/LICENSE-2.0

s:isPartOf:
  class: s:CreativeWork
  s:name: Common Workflow Language
  s:url: http://commonwl.org/

s:author:
  class: s:Person
  s:name: Andrey Kartashov
  s:email: mailto:Andrey.Kartashov@cchmc.org
  s:sameAs:
  - id: http://orcid.org/0000-0001-9102-5681
  s:worksFor:
  - class: s:Organization
    s:name: Cincinnati Children's Hospital Medical Center
    s:location: 3333 Burnet Ave, Cincinnati, OH 45229-3026
    s:department:
    - class: s:Organization
      s:name: Barski Lab
doc: |
  ucsc-bedGraphToBigWig.cwl is developed for CWL consortium

  Original tool usage:
         bedGraphToBigWig in.bedGraph chrom.sizes out.bw

      where in.bedGraph is a four column file in the format:
            <chrom> <start> <end> <value>
      and chrom.sizes is a two-column file/URL: <chromosome name> <size in bases>
      and out.bw is the output indexed big wig file.
      If the assembly <db> is hosted by UCSC, chrom.sizes can be a URL like
        http://hgdownload.cse.ucsc.edu/goldenPath/<db>/bigZips/<db>.chrom.sizes
      or you may use the script fetchChromSizes to download the chrom.sizes file.
      If not hosted by UCSC, a chrom.sizes file can be generated by running
      twoBitInfo on the assembly .2bit file.
      The input bedGraph file must be sorted, use the unix sort command:
        sort -k1,1 -k2,2n unsorted.bedGraph > sorted.bedGraph

