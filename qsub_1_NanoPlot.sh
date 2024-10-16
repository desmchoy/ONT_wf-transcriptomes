#!/bin/bash

task_name=NanoPlot
task_number=1

if [ ! -d "NanoPlot" ] ; then
	mkdir NanoPlot
fi



while read line ; do
	
	qsub -v sample=$line -o "$(pwd -P)"/log."${task_name}"."${line}".output -e "$(pwd -P)"/log."${task_name}"."${line}".error sge_"${task_number}"_"${task_name}".batch

done < "sample.list"
