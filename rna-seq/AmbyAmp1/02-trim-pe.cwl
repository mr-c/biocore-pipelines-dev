class: Workflow
cwlVersion: v1.0
doc: 'RNA-seq pipeline - reads: PE'
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: default_adapters_file
    type: File
    doc: Adapters file
    'sbg:x': 0
    'sbg:y': 1219
  - id: input_fastq_read1_files
    type: 'File[]'
    doc: Input read1 fastq files
    'sbg:x': 0
    'sbg:y': 1112
  - id: input_fastq_read2_files
    type: 'File[]'
    doc: Input read2 fastq files
    'sbg:x': 0
    'sbg:y': 1005
  - id: nthreads_qc
    type: int
    doc: Number of threads - qc.
    'sbg:x': 0
    'sbg:y': 791
  - id: nthreads_trimm
    type: int
    doc: Number of threads - trim.
    'sbg:x': 235.1875
    'sbg:y': 791
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
  - id: output_count_raw_reads_read1
    outputSource:
      - qc/output_count_raw_reads_read1
    type: 'File[]'
    'sbg:x': 732.9046630859375
    'sbg:y': 1112
  - id: output_count_raw_reads_read2
    outputSource:
      - qc/output_count_raw_reads_read2
    type: 'File[]'
    'sbg:x': 732.9046630859375
    'sbg:y': 1005
  - id: output_custom_adapters_read1
    outputSource:
      - qc/output_custom_adapters_read1
    type: 'File[]'
    'sbg:x': 732.9046630859375
    'sbg:y': 898
  - id: output_custom_adapters_read2
    outputSource:
      - qc/output_custom_adapters_read2
    type: 'File[]'
    'sbg:x': 732.9046630859375
    'sbg:y': 791
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
  - id: output_diff_counts_read1
    outputSource:
      - qc/output_diff_counts_read1
    type: 'File[]'
    'sbg:x': 732.9046630859375
    'sbg:y': 684
  - id: output_diff_counts_read2
    outputSource:
      - qc/output_diff_counts_read2
    type: 'File[]'
    'sbg:x': 732.9046630859375
    'sbg:y': 577
  - id: output_fastqc_data_files_read1
    outputSource:
      - qc/output_fastqc_data_files_read1
    type: 'File[]'
    doc: FastQC data files for paired read 1
    'sbg:x': 732.9046630859375
    'sbg:y': 470
  - id: output_fastqc_data_files_read2
    outputSource:
      - qc/output_fastqc_data_files_read2
    type: 'File[]'
    doc: FastQC data files for paired read 2
    'sbg:x': 732.9046630859375
    'sbg:y': 363
  - id: output_fastqc_report_files_read1
    outputSource:
      - qc/output_fastqc_report_files_read1
    type: 'File[]'
    doc: FastQC reports in zip format for paired read 1
    'sbg:x': 732.9046630859375
    'sbg:y': 256
  - id: output_fastqc_report_files_read2
    outputSource:
      - qc/output_fastqc_report_files_read2
    type: 'File[]'
    doc: FastQC reports in zip format for paired read 2
    'sbg:x': 732.9046630859375
    'sbg:y': 149
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
  - id: qc
    in:
      - id: default_adapters_file
        source: default_adapters_file
      - id: input_fastq_read1_files
        source:
          - input_fastq_read1_files
      - id: input_fastq_read2_files
        source:
          - input_fastq_read2_files
      - id: nthreads
        source: nthreads_qc
    out:
      - id: output_count_raw_reads_read1
      - id: output_count_raw_reads_read2
      - id: output_custom_adapters_read1
      - id: output_custom_adapters_read2
      - id: output_diff_counts_read1
      - id: output_diff_counts_read2
      - id: output_fastqc_data_files_read1
      - id: output_fastqc_data_files_read2
      - id: output_fastqc_report_files_read1
      - id: output_fastqc_report_files_read2
    run: 01-qc-pe.cwl
    'sbg:x': 191.46388244628906
    'sbg:y': 603.7755126953125
  - id: trim
    in:
      - id: input_fastq_read1_files
        source:
          - input_fastq_read1_files
      - id: input_fastq_read2_files
        source:
          - input_fastq_read2_files
      - id: input_read1_adapters_files
        source:
          - qc/output_custom_adapters_read1
      - id: input_read2_adapters_files
        source:
          - qc/output_custom_adapters_read2
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
    'sbg:x': 732.9046630859375
    'sbg:y': 0
requirements:
  - class: SubworkflowFeatureRequirement
