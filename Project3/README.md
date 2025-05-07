# Project 3: Identifying the Melting Temperature of Different Models of Ice Using Gromacs
In this github I am going to be providing all my code, workflow, and analysis that I used to identify the melting temperature of TIP4P 🚨 and maybe some others
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

## Input Files
### .mdp
### Topology

## Anaylsis
### Potential Energy
### Q6
### Deccorrelation Time
### Free Energy Difference???

## Gromacs Version and Specifications
### Borah Specifics
### Make Specifications
### 

## Trouble Shooting
### Ringing with Temperature Equilibration
### Finding the Barostat
### Superheating
At first I was a little concerned that my temperatures did not match the literature values

## References
* VMD
* Gromacs
* Plumed
* Papers
* GenIce2
