#!/bin/bash

#####
#
# REQUIRED AT ROOT LEVEL:
# -----
# # SRA.list
#
#####


task_name=SRA_toolkit
task_number=S




while read line ; do
	
	qsub -v sample=$line -o "$(pwd -P)"/log."${task_name}"."${line}".output -e "$(pwd -P)"/log."${task_name}"."${line}".error sge_"${task_number}"_"${task_name}".batch

done < "SRA.list"
