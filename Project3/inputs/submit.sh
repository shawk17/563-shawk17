#!/bin/bash
#SBATCH -p short #gpu-p100, shortgpu, shortgpu-p100, short, bsudfq, 
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH -t 0-00:30:00
#SBATCH -o TIP4P_Test.log
#SBATCH -J TIP4P
# #SBATCH --exclusive

module load gromacs+plumed/2024.5/openmpi/4.1.3/gcc/12.1.0
export OMP_NUM_THREADS=4
export GMXLIB=$HOME/GMXLIB

bash gro-step min
bash gro-step min2
bash gro-step eql
bash gro-step prd
