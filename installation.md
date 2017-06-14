---
title: installation
layout: default
---

The modern C++ implementation of the eGFRD has been published as open source package on GitHub. Please follow the [installation instructions]({{site.github_install_instructions}}) on the repository to setup the simulator. Problems can be reported on the eGFRD [issue tracker]({{site.github_issue_tracker}}).

# Examples
To help get you get started, we’ve assembled some sample simulations. These describe biomolecular systems, which has also been used as sanity check, to verify whether the modern eGFRD implementation works correctly.

## Equilibrium
Consider a set of particles A, B and C with the following reaction: A + B ⇾ C with rate k<sub>a</sub> [m<sup>3</sup>/s] and C ⇾ A + B with diffusion-rate k<sub>d</sub> [s<sup>-1</sup>]. When the particles are constraint to a closed system, a box with length L [m] and periodic boundary conditions, the reaction must equilibrate towards a steady state. For this system we can calculate the number of C particles analytically.
```
<#C> = (NA + NB) + KD*V*sqrt[(NA + NB + KD*V)^2 - 4*NA*NB]/2
```

where NA, NB and NC are the number of A, B, and C respectively in the closed volume V = L<sup>3</sup>, and KD = k<sub>d</sub>/k<sub>a</sub> the dissociation constant. Therefore, setting up this simulation with the eGFRD algorithm must yield similar result for various k<sub>d</sub> and k<sub>a</sub>, when the ratio KD remains equal. To run an eGFRD equilibrium simulation, enter the following command in the Unix shell after installing the package:
```
./RunGfrd Equilibrium -ka 1e-19 -kd 2e-2 -p 100 -e 200 > data.out
```
which will simulate the reaction-diffusion system for 60 seconds. For Windows the workings are exactly the same; select RunGfrd as startup project and set the command-line arguments (in solution explorer, right-click the RunGfrd project, and click Properties -> Configuration Properties -> Debugging -> Command Line Arguments) to `Equilibrium -ka 1e-19 -kd 2e-2 -p 100 -e 200 > data.out`. 

The result of the simulation will be stored in the file `data.out` and shows the time against the total number of present A, B and C molecules. Finally `<#C>` is stored in the file, which corresponds with the analytical value. The parameters; reaction-rate `-ka`, diffusion-rate `-kd`, preparation time `-p` and simulation-time `-e` are set using the command line arguments. All other settable options can be viewed by running:
```
./RunGfrd Equilibrium --help
```

## Power Spectrum
The A, B and C reaction-diffusion system can also be used to obtain the power spectrum. Use the following command to setup the simulator with the same parameters as given by the paper of Kaizu et. al. \[[2](#references)\]:
```
./RunGfrd PowerSpectrum -e 600 > data.out
```

<p align="center"><img src="includes/images/powerspectrum.jpg" alt="Power spectrum results"/></p>
<div style="margin:auto;width:75%;text-align:center;font-style:italic">
Fig.1: Results of the power spectrum simulation, which agree well with the theoretical predictions.
</div>

## MAPK
Mitogen-activated protein kinase (MAPK) is a well known example of a enzyme kinase that that modifies proteins, by adding phosphate groups. This experimentally known system can be simulated using eGFRD \[[3](#references)\]. With the modern eGFRD package the MAPK simulation can be easily setup using:
```
./RunGfrd MapK > data.out
```

## Custom
Users can also use the package to create their own simulations with ini-file like scripts. A simple example with file name *rebind.gfrd*, is given below. To run the modern eGFRD simulator, copy the script to the same folder as where the RunGfrd executable is located and enter the following command:
```
.\RunGfrd Costum -f rebind.gfrd > data.out
```

```
; eGFRD rebinding simulation

[Simulator]
           Seed = 0xA2529C06
    PrepareTime = 0.5; sec.
        EndTime = 15.0; sec.
   ShowProgress = False
MaintenanceStep = 10000
MaintenanceFile = sim_dump.out

[World] ;this is some comment
  Matrix = 8
    Size = 1e-6; m
	
[CopyNumbers]
    Mode = On
Interval = 1E-3
    File = copy_num.out

[SpeciesType]
Name = A
   r = 1e-9; m
   D = 1e-12; m^2*s^-1

[SpeciesType]
Name = B
   r = 1e-9; m
   D = 1e-12; m^2*s^-1

[SpeciesType]
Name = C
   r = 1.5e-9; m
   D = 1e-12; m^2*s^-1

[ReactionRule]
Rule = A + B --> C
   k = 1e-16; m^3*s^-1

[ReactionRule]
Rule = C --> A + B
   k = 1e3; s^-1

[Particles]
A = 50
B = 50
C = 0
```

# References
1. Kaizu K, de Ronde W, Paijmans J, Takahashi K, Tostevin F, ten Wolde PR (2014) The Berg-Purcell Limit Revisited Biophys J, 106:976-985. ([doi](https://dx.doi.org/10.1016/j.bpj.2013.12.030))
2. Takahashia K, Tănase-Nicolad S, ten Wolde PR (2009) Spatio-temporal correlations can drastically change the response of a MAPK pathway ([doi](https://dx.doi.org/10.1073/pnas.0906885107))
