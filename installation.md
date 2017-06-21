---
title: installation
layout: default
---

The modern C++ implementation of the eGFRD has been published as an open source package on GitHub. Please follow the [installation instructions]({{site.github_install_instructions}}) on the repository to setup the simulator. Problems can be reported via the eGFRD [issue tracker]({{site.github_issue_tracker}}).

The modern C++ implementation of the eGFRD has been published as open source package on GitHub. Please follow the [installation instructions]({{site.github_install_instructions}}) on the repository to setup the simulator. Problems can be reported on the eGFRD [issue tracker]({{site.github_issue_tracker}}).

# Examples
To help you getting started, we have assembled some simple models. These can be used to verify the implementation of the code and to build more complex models.

## Equilibrium
Consider a set of particles A, B and C with the following reaction: A + B ⇾ C with binding rate constant k<sub>a</sub> [m<sup>3</sup>/s] and C ⇾ A + B and unbinding rate k<sub>d</sub> [s<sup>-1</sup>]. In a box with length L [m] and periodic boundary conditions, the reaction will relax towards equilibrium. For this system, we can calculate the number of C particles analytically.
```
<#C> = (NA + NB) + KD*V*sqrt[(NA + NB + KD*V)^2 - 4*NA*NB]/2
```

where NA, NB and NC are the number of A, B, and C respectively in the volume V = L<sup>3</sup>, and KD = k<sub>d</sub>/k<sub>a</sub> is the dissociation constant. The number of C particles thus depends on the dissociation constant, that is the ratio of the association and dissociation rate, and not on the absolute values of the rate constants. This can be used to test the code. To run an eGFRD simulation of this reaction, enter the following command in the Unix shell after installing the package:
```
./RunGfrd Equilibrium -ka 1e-19 -kd 2e-2 -p 100 -e 200 > data.out
```

The first command line argument sets the simulation type. The value “Equilibrium” represents the particle simulation of the described association-dissociation reaction. The values of the association rate k<sub>a</sub> and dissociation rate k<sub>d</sub> are also set as command line argument. The parameter `-p` sets the equilibration time during which the system is allowed to relax to equilibrium, while `–e` sets the run time during which the statistics is accumulated, both in seconds. All parameter settings can be viewed by running:
```
./RunGfrd Equilibrium --help
```
The result will be stored in the file data.out and shows the simulation time against the total number of A, B and C molecules. Finally, the analytical prediction <#C> is also stored in the file.

## Power Spectrum
Besides the dissociation constant, it may also prove useful to compute the power spectrum of the simple association-dissociation reaction. The following command prompts GFRD to compute the power spectrum for this reaction, with the same parameters as in the paper of Kaizu et. al. \[[1](#references)\]:
```
./RunGfrd PowerSpectrum -e 600 > data.out
```

<p align="center"><img src="includes/images/powerspectrum.jpg" alt="Power spectrum results"/></p>
<div style="margin:auto;width:75%;text-align:center;font-style:italic">
Fig.1: Results of the power spectrum simulation, which agree well with the theoretical predictions.
</div>

## MAPK
The Mitogen-Activated Protein Kinase (MAPK) cascade is one of most studied and best characterized signalling pathways in biology. The cascade consists of three layers, where in each layer a protein is phosphorylated at two states. The application of eGFRD to one layer showed that fluctuations at the molecular scale can dramatically change the macroscopic behavior at the cellular scale \[[2](#references)\]. With the new eGFRD package the MAPK simulation can be easily set up using:
```
./RunGfrd MapK > data.out
```

## Custom
Users can also use the package to set up their own model with ini-file like scripts. A simple example with file name *rebind.gfrd*, is given below. To run the modern eGFRD simulator, copy the script to the same folder as where the RunGfrd executable is located and enter the following command:
```
.\RunGfrd Custom -f rebind.gfrd > data.out
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
