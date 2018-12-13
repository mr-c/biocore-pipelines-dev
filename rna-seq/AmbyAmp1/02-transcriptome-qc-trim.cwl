class: Workflow
cwlVersion: v1.0
doc: 'RNA-seq pipeline - reads: PE'
requirements:
 - class: ScatterFeatureRequirement
 - class: SubworkflowFeatureRequirement
 - class: StepInputExpressionRequirement
inputs:
   input_fastq_read1_files:
     doc: Input read1 fastq files
     type: File[]
   input_fastq_read2_files:
     doc: Input read2 fastq files
     type: File[]
   nthreads_qc:
     doc: Number of threads - qc.
     type: int
   default_adapters_file:
     doc: Adapters file
     type: File
   trimmomatic_java_opts:
     doc: JVM arguments should be a quoted, space separated list (e.g. "-Xms128m -Xmx512m")
     type: string?
   nthreads_trimm:
     doc: Number of threads - trim.
     type: int
   trimmomatic_jar_path:
     doc: Trimmomatic Java jar file
     type: string
outputs:
   output_fastqc_report_files_read1:
     doc: FastQC reports in zip format for paired read 1
     type: File[]
     outputSource: qc/output_fastqc_report_files_read1
   output_fastqc_data_files_read1:
     doc: FastQC data files for paired read 1
     type: File[]
     outputSource: qc/output_fastqc_data_files_read1
   output_count_raw_reads_read1:
     outputSource: qc/output_count_raw_reads_read1
     type: File[]
   output_custom_adapters_read1:
     outputSource: qc/output_custom_adapters_read1
     type: File[]
   output_diff_counts_read1:
     outputSource: qc/output_diff_counts_read1
     type: File[]
   output_trimmed_read1_fastq_read_count:
     doc: Trimmed read counts of paired read 1 fastq files
     type: File[]
     outputSource: trim/output_trimmed_read1_fastq_read_count
   output_data_fastq_read1_trimmed_files:
     doc: Trimmed fastq files for paired read 1
     type: File[]
     outputSource: trim/output_data_fastq_read1_trimmed_files
   output_fastqc_report_files_read2:
     doc: FastQC reports in zip format for paired read 2
     type: File[]
     outputSource: qc/output_fastqc_report_files_read2
   output_fastqc_data_files_read2:
     doc: FastQC data files for paired read 2
     type: File[]
     outputSource: qc/output_fastqc_data_files_read2
   output_count_raw_reads_read2:
     outputSource: qc/output_count_raw_reads_read2
     type: File[]
   output_custom_adapters_read2:
     outputSource: qc/output_custom_adapters_read2
     type: File[]
   output_diff_counts_read2:
     outputSource: qc/output_diff_counts_read2
     type: File[]
   output_trimmed_read2_fastq_read_count:
     doc: Trimmed read counts of paired read 2 fastq files
     type: File[]
     outputSource: trim/output_trimmed_read2_fastq_read_count
   output_data_fastq_read2_trimmed_files:
     doc: Trimmed fastq files for paired read 2
     type: File[]
     outputSource: trim/output_data_fastq_read2_trimmed_files
steps:
   qc:
     in:
       input_fastq_read1_files: input_fastq_read1_files
       input_fastq_read2_files: input_fastq_read2_files
       default_adapters_file: default_adapters_file
       nthreads: nthreads_qc
     run: 01-qc-pe.cwl
     out:
     - output_fastqc_report_files_read1
     - output_fastqc_data_files_read1
     - output_custom_adapters_read1
     - output_count_raw_reads_read1
     - output_diff_counts_read1
     - output_fastqc_report_files_read2
     - output_fastqc_data_files_read2
     - output_custom_adapters_read2
     - output_count_raw_reads_read2
     - output_diff_counts_read2
   trim:
     in:
       input_read1_adapters_files: qc/output_custom_adapters_read1
       input_fastq_read1_files: input_fastq_read1_files
       input_read2_adapters_files: qc/output_custom_adapters_read2
       input_fastq_read2_files: input_fastq_read2_files
       nthreads: nthreads_trimm
       trimmomatic_java_opts: trimmomatic_java_opts
       trimmomatic_jar_path: trimmomatic_jar_path
     run: 02-trim-pe.cwl
     out:
     - output_data_fastq_read1_trimmed_files
     - output_trimmed_read1_fastq_read_count
     - output_data_fastq_read2_trimmed_files
     - output_trimmed_read2_fastq_read_count