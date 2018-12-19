class: Workflow
cwlVersion: v1.0
id: map_quant_component
label: map-quant-component
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference_files
    type: Directory
    'sbg:x': -276
    'sbg:y': -312.20098876953125
outputs:
  - id: transcript_sorted_bam_bai
    outputSource:
      - rsem_calculate_expression/transcript_sorted_bam_bai
    type: File?
    'sbg:x': 73
    'sbg:y': -514.1849365234375
  - id: transcript_sorted_bam
    outputSource:
      - rsem_calculate_expression/transcript_sorted_bam
    type: File?
    'sbg:x': 153
    'sbg:y': -448
  - id: transcript_bam
    outputSource:
      - rsem_calculate_expression/transcript_bam
    type: File?
    'sbg:x': 205
    'sbg:y': -351
  - id: rsem_time
    outputSource:
      - rsem_calculate_expression/rsem_time
    type: File?
    'sbg:x': 215
    'sbg:y': -244
  - id: rsem_stat
    outputSource:
      - rsem_calculate_expression/rsem_stat
    type: 'File[]?'
    'sbg:x': 212
    'sbg:y': -133
  - id: isoforms
    outputSource:
      - rsem_calculate_expression/isoforms
    type: File
    'sbg:x': 177
    'sbg:y': -27
  - id: genes
    outputSource:
      - rsem_calculate_expression/genes
    type: File
    'sbg:x': 114
    'sbg:y': 48
  - id: alleles
    outputSource:
      - rsem_calculate_expression/alleles
    type: File?
    'sbg:x': 50
    'sbg:y': 110
steps:
  - id: rsem_prepare_reference
    in: []
    out:
      - id: genome_files
    run: >-
      ../../../../../../../Users/nmaki/Documents/GitHub/GGR-cwl/v1.0/quant/rsem-prepare-reference.cwl
    'sbg:x': -518
    'sbg:y': -154
  - id: rsem_calculate_expression
    in:
      - id: reference_files
        source: reference_files
    out:
      - id: alleles
      - id: genes
      - id: isoforms
      - id: rsem_stat
      - id: rsem_time
      - id: transcript_bam
      - id: transcript_sorted_bam
      - id: transcript_sorted_bam_bai
    run: >-
      ../../../../../../../Users/nmaki/Documents/GitHub/GGR-cwl/v1.0/quant/rsem-calculate-expression.cwl
    'sbg:x': -60
    'sbg:y': -192.01608276367188
requirements: []
