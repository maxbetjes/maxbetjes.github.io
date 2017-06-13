---
title: installation
layout: default
---

The modern C++ implementation of the eGFRD has been published as open source package on GitHub. Please follow the [installation instructions]({{site.github_install_instructions}}) on the repository to setup the simulator. Problems can be reported on the eGFRD [issue tracker]({{site.github_issue_tracker}}).

# Examples
To help get you get started, we’ve assembled some sample simulations. These describe biomolecular systems, which has also been used as sanity check, to verify whether the modern eGFRD implementation works correctly.

## Equilibrium
Consider a set of particles A, B and C with the following reaction: A + B ⇾ C with rate k<sub>a</sub> [m<sup>3</sup>/s] and C ⇾ A + B with diffusion-rate k<sub>d</sub> [s<sup>-1</sup>]. When the particles are constraint to a closed system, a box with length L [m] and periodic boundary conditions, the reaction must equilibrate towards a steady state. For this system we can calculate the number of C particles analytically [ref!!!].
```
<NC> = (NA + NB) + KD*V*sqrt[(NA + NB + KD*V)^2 - 4*NA*NB]/2
```

where NA, NB and NC are the number of A, B, and C respectively in the closed volume V = L<sup>3</sup>, and KD = k<sub>d</sub>/k<sub>a</sub> the dissociation constant. Therefore, setting up this simulation with the eGFRD algorithm must yield similar result for various k<sub>d</sub> and k<sub>a</sub>, when the ratio KD remains equal. To run an eGFRD equilibrium simulation, enter the following command after installing the package:
```
./RunGfrd Equilibrium -ka 1e-19 -kd 2e-2 -p 100 -e 200 > data.out
```

which will simulate the reaction-diffusion system for 60 seconds. The results will be stored in the file data.out and shows the simulation time against the total number of A, B and C molecules. The settings; reaction-rate ```-ka```, diffusion-rate ```-kd```, preparation time ```-p``` and simulation-time ```-e``` are set using the command line arguments. All other argument settable options can be viewed by running:
```
./RunGfrd Equilibrium --help
```

## Power spectrum
todo

## MAPK
todo

## Custom
