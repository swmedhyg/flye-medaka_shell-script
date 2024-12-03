<header>

<!--
  <<< Author notes: Course header >>>
  Include a 1280×640 image, course title in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Add your open source license, GitHub uses MIT license.
-->

# Flye assembly and Medaka polishing for Nanopore sequencing

_A instruction on how to use a shell script to run Flye and Medaka on Nanopore reads._

</header>

The aim of this GitHub Page is to provide a simple and easy understandable manual to use Flye and Medaka for high-quality Nanopore reads (like “dna_r10.4.1_e8.2_400bps_sup@5.0.0 - Dorado v0.7.2” basecalled reads). We assume prior default filtering in MinKNOW according to Q10, otherwise we suggest prior filtering with a tool like [chopper](https://github.com/wdecoster/chopper). 

### Beginner Learning Instructions

If you are not familiar with Linux command line we suggest looking into these learning instructions for [Linux command line](https://swcarpentry.github.io/shell-novice/index.html) and [conda environments](https://astrobiomike.github.io/unix/conda-intro)

### How to install

For this script, we used conda environments. Therefore we recommend to install Flye and Medaka in conda enviroments according to theier GitHub pages. 

Flye:
https://github.com/mikolmogorov/Flye?tab=readme-ov-file

Medaka:
https://github.com/nanoporetech/medaka

### How to use this bash shell script

After downloading the Flye-Medaka.sh file you can copy it in your working location and adapt as nessasary. It is important to adapt the “define variables” part in the script according to your names and file locations. This shell script automatically deletes medaka working folders to minimize memory space. 

Tips and reminders:

- Avoid empty space signs in your file- and folder-names since they can cause issues (“Isolate-A” instead of “Isolate A”).
- Do not include “/” as a last sign of your path for OUT_DIR_F or WORKING_DIR_M variable since this would cause issues with this script (“path/to/Fly-output” instead of “path/to/Fly-output/”). 
- If you have more than one read input file, they must be copied into one file. You can do this with the “cat” command (e.g. “cat *.fastq.gz > merged.fastq.gz”).
- The “pwd” command might be helpful to identify and copy the absolute paths into the variables sector of the shell file.

After defining the variables you can start the shell script by typing “bash Flye-Medaka.sh” in the Terminal.

# Publication
The manual and this shell script were originally created as part of the following publication:

# Issues and further questions

If you want to report issues or need further help feel free to add them in the [Issues](https://github.com/swmedhyg/flye-medaka_shell-script/issues) section.

