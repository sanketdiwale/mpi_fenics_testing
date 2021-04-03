#!/bin/bash
#SBATCH --array=1-0%1000
#SBATCH --time=10:00:00
#SBATCH -p sched_mit_rutledge
#SBATCH -e log.err
#SBATCH -o log.run
#SBATCH --workdir=./
#SBATCH --cpus-per-task=1

TIME='/usr/bin/env time -f " \\tFull Command:                      %C \\n\\tMemory (kb):                       %M \\n\\t# SWAP  (freq):                    %W \\n\\t# Waits (freq):                    %w \\n\\tCPU (percent):                     %P \\n\\tTime (seconds):                    %e \\n\\tTime (hh:mm:ss.ms):                %E \\n\\tSystem CPU Time (seconds):         %S \\n\\tUser   CPU Time (seconds):         %U " '

CMD='mpirun -n 100 python demo_auto-adaptive_poisson'
# Write details to stdout
echo "  Job: $SLURM_ARRAY_JOB_ID"
echo
echo "  Started on:           " `/bin/hostname -s`
echo "  Started at:           " `/bin/date`
echo $CMD

eval $TIME$CMD # Running the command.

echo "  Finished at:           " `date`
echo
# End of file
