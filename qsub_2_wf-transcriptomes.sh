#!/bin/bash

task_name=wf-transcriptomes
task_number=2

wd=$(pwd)


if [ ! -d "results_wf-transcriptomes" ] ; then
	mkdir results_wf-transcriptomes
fi

#cd results_wf-transcriptomes
#nextflow run epi2me-labs/wf-transcriptomes --help > ${wd}/log.results_wf-transcriptomes_setup.output 2> ${wd}/log.results_wf-transcriptomes_setup.error
#cd ${wd}


while read line; do

        comparison=$(echo $line | sed 's/\./\t/g' | awk '{print $1}')
        qsub -v input=$line -o "$(pwd -P)"/log."${task_name}"."${comparison}".output -e "$(pwd -P)"/log."${task_name}"."${comparison}".error sge_"${task_number}"_"${task_name}".batch

done < "diff.list"
