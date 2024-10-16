#!/bin/bash

# ls ./RAW/*.fastq.gz | sed 's/\.\/RAW\///g;s/_.*_001//g;s/\.fastq\.gz//g' | sort | uniq > sample.list
ls ./RAW/*.fastq* | sed 's/\.\/RAW\///g;s/_.*_001//g;s/\.fastq//g;s/\.gz//g' | sort | uniq > sample.list


if [ ! -d "temp_dir" ] ; then
	mkdir temp_dir
fi

wd=$(pwd)
cd temp_dir

counter=1
for file in ${wd}/RAW/*.fastq* ; do
#	dirname=$(basename $file | sed 's/\.\/RAW\///g;s/_.*_001//g;s/\.fastq//g;s/\.gz//g')
	dirname=barcode${counter}
	mkdir ${dirname}
	cd ${dirname}
	ln -s $file $(basename $file)
	cd ..
done


cd ${wd}

#if [ ! -d "temp_nextflow" ] ; then
#	mkdir temp_nextflow
#fi
#
#cd temp_nextflow
#nextflow run epi2me-labs/wf-transcriptomes --help > ${wd}/log.setup.output 2> ${wd}/log.setup.error
