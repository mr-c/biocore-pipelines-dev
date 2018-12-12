class: Workflow
cwlVersion: v1.0
doc: 'RNA-seq pipeline - reads: PE'
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: input_fastq_read1_files
    type: 'File[]'
    doc: Input read1 fastq files
    'sbg:x': 53
    'sbg:y': 978
  - id: input_fastq_read2_files
    type: 'File[]'
    doc: Input read2 fastq files
    'sbg:x': 67
    'sbg:y': 808
  - id: nthreads_trimm
    type: int
    doc: Number of threads - trim.
    'sbg:x': 80
    'sbg:y': 609
  - id: trimmomatic_jar_path
    type: string
    doc: Trimmomatic Java jar file
    'sbg:x': 0
    'sbg:y': 363
  - id: trimmomatic_java_opts
    type: string?
    doc: >-
      JVM arguments should be a quoted, space separated list (e.g. "-Xms128m
      -Xmx512m")
    'sbg:x': 0
    'sbg:y': 256
outputs:
  - id: output_data_fastq_read1_trimmed_files
    outputSource:
      - trim/output_data_fastq_read1_trimmed_files
    type: 'File[]'
    doc: Trimmed fastq files for paired read 1
    'sbg:x': 1264.33935546875
    'sbg:y': 621
  - id: output_data_fastq_read2_trimmed_files
    outputSource:
      - trim/output_data_fastq_read2_trimmed_files
    type: 'File[]'
    doc: Trimmed fastq files for paired read 2
    'sbg:x': 1264.33935546875
    'sbg:y': 514
  - id: output_trimmed_read1_fastq_read_count
    outputSource:
      - trim/output_trimmed_read1_fastq_read_count
    type: 'File[]'
    doc: Trimmed read counts of paired read 1 fastq files
    'sbg:x': 1264.33935546875
    'sbg:y': 407
  - id: output_trimmed_read2_fastq_read_count
    outputSource:
      - trim/output_trimmed_read2_fastq_read_count
    type: 'File[]'
    doc: Trimmed read counts of paired read 2 fastq files
    'sbg:x': 1264.33935546875
    'sbg:y': 300
steps:
  - id: trim
    in:
      - id: input_fastq_read1_files
        source:
          - input_fastq_read1_files
      - id: input_fastq_read2_files
        source:
          - input_fastq_read2_files
      - id: nthreads
        source: nthreads_trimm
      - id: trimmomatic_jar_path
        source: trimmomatic_jar_path
      - id: trimmomatic_java_opts
        source: trimmomatic_java_opts
    out:
      - id: output_data_fastq_read1_trimmed_files
      - id: output_data_fastq_read2_trimmed_files
      - id: output_trimmed_read1_fastq_read_count
      - id: output_trimmed_read2_fastq_read_count
    run: 02-trim-pe.cwl
    'sbg:x': 758.40283203125
    'sbg:y': 415.0527648925781
requirements:
  - class: SubworkflowFeatureRequirement
