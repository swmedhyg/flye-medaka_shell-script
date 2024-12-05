#!/bin/bash

#Fly assembly and Medaka polishing
#you need to adapt the variables according to your paths and file names
#do not include “/” as a last sign of your path for OUT_DIR_F or WORKING_DIR_M (“path/to/Fly-output” instead of “path/to/Fly-output/”)
#Avoid empty space signs in your names and file locations
#If you have more than one read input file, they must be copied into one file. You can do this with the “cat” command (e.g. “cat *.fastq.gz > merged.fastq.gz”).


#define variables 
THREADS=		#Number of available threads e.g. something like THREADS =12 or THREADS=$(nproc)
READS=			#input of reads e.g. something like READS=path/to/*.fastq or READS=merged.fastq.gz
OUT_DIR_F=		#the name of your Flye output directory e.g. OUT_DIR_F=path/to/isolatA_Fly-output
WORKING_DIR_M=		#the name of your Medaka working directory e.g. WORKING_DIR_M=isolatA_Medaka-output
NAME=			#name of the final fasta file e.g. NAME=path/to/isolatA_flye_medaka.fasta
MODEL=			#Medaka Model e.g. MODEL=r103_min_high_g360
CONDA_FLY=		#name of your Flye conda environment e.g. CONDA_FLY=flye-env
CONDA_MEDAKA=		#name of your Medaka environment e.g.  CONDA_MEDAKA=Medaka-env

#Check if Flye output directory, Medaka output directory and Medaka output file do not exist yet to provent overwrite of existing directories and check for "/" sign
if [ -d ${OUT_DIR_F} ]; then echo 'Error: Flye output directory already exists -please define new output directory'& exit; fi
if [ -d ${WORKING_DIR_M} ]; then echo 'Error: Medaka working directory already exists -please define new working directory'& exit; fi 
if [ -f ${NAME} ]; then echo 'Error: Medaka output file already exists -please define new output file name'& exit;  fi
if [ $(echo ${OUT_DIR_F} | rev | cut -b 1) = / ]; then echo 'Error: the last sign of your Flye output directory is a "/" -please delete the last "/" sign'& exit; fi
if [ $(echo ${WORKING_DIR_M} | rev | cut -b 1) = / ]; then echo 'Error: the last sign of your Medaka output directory is a "/" -please delete the last "/" sign'& exit; else echo 'starting Flye+Medaka script'; fi

#this command allows the usage of conda environments in this shell script
eval "$(conda shell.bash hook)"

#Change to your Flye conda environment
conda activate ${CONDA_FLY}

#carry out the Flye assembly
flye --nano-hq ${READS} -o ${OUT_DIR_F} --threads ${THREADS} 

#Change to your Medaka conda environment
conda activate ${CONDA_MEDAKA}

#carry out Medaka polishing
medaka_consensus -i ${READS} -d ${OUT_DIR_F}/assembly.fasta -o ${WORKING_DIR_M} -t ${THREADS} -m ${MODEL}

#copy final Medaka File and remove additional Medaka working files since they need much memory space
cp ${WORKING_DIR_M}/consensus.fasta  ${NAME} 
rm -r ${WORKING_DIR_M}
