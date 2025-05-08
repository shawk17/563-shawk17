# Project 3: Identifying the Melting Temperature of Different Models of Ice Using Gromacs
In this github I am going to be providing all my code, workflow, and analysis that I used to identify the melting temperature of TIP4P (for this project).
|      | My Work   | Literature|
|-----:|-----------|-----------|
| TIP4P| 300       | 230       |

## Overview
I started with a perfect crystal of ice which was generated from 🚨 link here
For this project I ran 2 minimization and 1 equilibration step that did not change, the production step had several variations. 
1. Minimization
2. Equilibration: for the equilibration step I did the temperature and the pressure equilibration together (see **Trouble Shooting** section for details)
3. Production
For the analysis, I looked at Q6 and the potential energy.
**All files mentioned can be found on GitHub**

## Input Files
### .mdp
To see all the .mdp options see the mdp folder.
#### min.mdp and min2.mdp
*
#### eql.mdp
*
#### prd.mdp
* 
### Topology

## Anaylsis
### Potential Energy
### Q6

### Deccorrelation Time
### Free Energy Difference???

## Gromacs Version and Specifications
### Borah Specifics
#### Loading Modules
`module load gromacs+plumed/2024.5/openmpi/4.1.3/gcc/12.1.0`

`which gmx_mpi`: `/cm/shared/apps/gromacs+plumed/2024.5/openmpi/4.1.3/gcc/12.1.0/bin/gmx_mpi`

`which plumed`:`/cm/shared/apps/plumed/2.9.3/openmpi/4.1.3/gcc/12.1.0/bin/plumed`

`gmx_mpi --version`: See [This text file](gromacs_specs.txt).

#### Gromacs Commands
`gmx_mpi energy -f prd.edr -o prd`
This puts out an .xvg file, that contains whatever info you ask it for, I typically asked for PE, KE, T, Pressure, Density, and System T.
##### gro-step
There are 2 main commands in gro-step, the `grompp` command, which will create the job, and the `mdrun` command which will run the job. Please note that the options for the `mdrun` command can all be replaced with `-defnm ${JOB}`. Also at the begining of the file I have the command `JOB=$1`.

`mpirun -np 1 -npernode 48 gmx_mpi grompp -f ${JOB}.mdp -c $STRUCTURE -o ${JOB}.tpr -pp ${JOB}.top -po ${JOB}.mdp`

`mpirun -np 1 -npernode 48 gmx_mpi mdrun	-s ${JOB}.tpr	-o ${JOB}.trr	-x ${JOB}.xtc	-c ${JOB}.gro	-e ${JOB}.edr -g ${JOB}.log`

To use this in a submit make sure you have a `conf.gro`, as well as a `job.mdp` file, and then you can use `bash gro-step job`.
##### submit script
In my submit script I am exporting `GMXLIB=$HOME/GMXLIB`, this is will be different on you machine depending on were your gromacs data is. You can also see the [submit](specs\submit.sh)

#### Plumed Commands
`plumed driver --plumed plumed_xtc.dat --mf_xtc prd.xtc`
### Make Specifications

## Trouble Shooting
### Ringing with Temperature Equilibration
Shown in the image below we can see *ringing* in the temperature as I am trying to equilibrate the system. This oscillation does not diminish even over long simulation times (the mosth I tried was 1E6 steps). This caused the system to melt long during the equilibration step which made it impossible to do the analysis I wanted to.
![Ringing Temperature](Images/Ringing.png)
### Finding the Barostat
Using the `Parrinello-Raham` barostat for the initial equilibration caused some issues, as can be seen here: 
![An images of water with a giant cavity](Images/Equilibration_with_temp.png)
Attempting to use the `berendsen` barostat caused gromacs to have a warning, and I could use it without turning on the `max_warn` option. It said instead to use the `C-rescale` barostat, which it said was good for both equilibration and production runs. I do not have a good enough understanding of barostats to evalulate this statement. I decided to go with the `C-rescale` barostat for all of my equilibration and production runs as it seemed to work fine. 
### Superheating
At first I was a little concerned that my temperatures did not match the literature values

## References
* VMD
* Gromacs
* Plumed
* Papers
* GenIce2
