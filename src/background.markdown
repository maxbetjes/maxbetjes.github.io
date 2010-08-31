---
layout: main
title: GFRD background
file: background
header: Background information
---

## The importance of modeling networks in time and space at the particle level

In many networks of interacting components, the spatial distribution of the 
components and the stochastic character of their interactions are of critical 
importance for the macroscopic behavior of the system. Examples are to be 
found in biological evolution and population dynamics, but arguably the most 
studied and best characterized examples are biochemical networks. Biochemical 
networks consist of biomolecules, such as proteins and DNA, which chemically 
and physically interact with one another. These biochemical networks are the 
analog computers of life. They allow living cells to detect, amplify and 
integrate signals, as well as transmit signals from one place to another. 
Indeed, biochemical networks can perform a large number of computational tasks 
analogous to electronic circuits. However, their design principles are 
markedly different. In a biochemical network, the components often move in an 
erratic fashion, namely by diffusion, and they interact with each other in a
stochastic manner – chemical and physical interactions are probabilistic in
nature. To understand the design principles that allow biochemical networks to
process information reliably, we have to take into account the spatial
distribution of the components and the stochastic character of their
interactions^[[1](#c1)](sid:r1). Moreover, we have recently shown that
spatio-temporal correlations at molecular length scales can drastically change
the macroscopic behavior of systems that are _uniform_ at cellular length
scales^[[2](#c2)](sid:r2). Finally, many biological systems exhibit
macroscopic concentration gradients. Well-known examples are morphogen
gradients, which provide positional information to differentiating cells
during embryonic development. To understand how these gradients are read out
precisely^[[3](#c3)](sid:r3), the system has to be described at the particle
level in time and space^[[4](#c4)](sid:r4).

## Overview of simulation techniques

In principle, computer simulations are ideally suited for studying 
reaction-diffusion systems. The conventional approach is to write down the 
macroscopic reaction-diffusion equations and solve the corresponding 
differential equations either analytically or numerically. This approach 
resolves the system in time and space, but ignores the discrete nature of the 
reactants and the stochastic character of their interactions. Schemes based on
the zero-dimensional chemical master equation, such as the Gillespie
algorithm^[[5](#c5)](sid:r5) or the Gibson-Bruck scheme^[[6](#c6)](sid:r6),
incorporate the latter, but assume that at each instant the particles are
uniformly distributed in space. 

In the past years, a number of techniques have been developed that take into 
account both the spatial distribution of the components and the stochastic
nature of their interactions. One class of techniques is based upon the
reaction-diffusion master equation^[[7](#c7)](sid:r7),[[8](#c8)](sid:r8);
examples are SmartCell^[[9](#c9)](sid:r9), MesoRD^[[10](#c10)](sid:r10) and
URMD^[[11](#c11)](sid:r11). The main idea of these techniques is to divide the
reaction volume into a number of subvolumes; particles can react within the
subvolumes, but also diffuse from one subvolume to the next.  Importantly, it
is assumed that within each subvolume the particles are well mixed. These
techniques thus rely on the existence of a length and time scale on which the
system is spatially uniform.  When the concentrations are fairly high, as in
spatio-temporal calcium oscillations, such a scale possibly exists, but at
lower concentrations this assumption is likely to fail. 

Another class of techniques simulates the network in time and space at the
particle level. One natural approach is to use Brownian Dynamics; examples are
Smoldyn^[[12](#c12)](sid:r12), MCell^[[13](#c13)](sid:r13), Reaction Brownian
Dynamics^[[14](#c14)](sid:r14) and GridCell^[[15](#c15)](sid:r15). In essence,
the particles undergo a random walk, and when two reaction partners happen to
meet each other, they can react with a probability consistent with the rate
constant. However, under biologically relevant conditions, Brownian Dynamics
is not very efficient, since much CPU time is wasted on propagating the
particles towards each other.  Moreover, it is not exact, since a finite time
step is used. 

Another approach to simulate a network at the particle level in time and space
is to use an event-driven algorithm. Green’s Function Reaction Dynamics
(GFRD)^[[16](#c16)](sid:r16),[[17](#c17)](sid:r17),[2](#c2) and First Passage
Kinetic Monte Carlo (FPKMC)^[[18](#c18)](sid:r18),[[19](#c19)](sid:r19) are
examples of such an approach. The idea is to exploit the solution of the
Smoluchowski equation — the Green’s function — to set up an event-driven
algorithm that concatenates the propagation of the particles in space with the
reactions between them. These algorithms thus alleviate the need to propagate
the particles toward each other to let them react, as in conventional Brownian
Dynamics: even when the reactants are far apart from one another, the
algorithm can immediately jump to the next reaction event. This event-driven
nature makes these schemes highly powerful, especially when the concentrations
of the components are low, as in most signal transduction pathways and gene
regulation networks. 

>%references%
### References
[[1](sid:c1)](#r1) van Zon JS, Morelli M, Tanase-Nicola S, ten Wolde PR (2006) Diffusion of transcription factors can drastically enhance the noise in gene expression. _Biophys J_, 91:4350 — 4367. ([doi](http://dx.doi.org/10.1529/biophysj.106.086157), [arXiv](http://arxiv.org/abs/q-bio/0604005))  
[[2](sid:c2)](#r2) Takahashi K, Tanase-Nicola S, Ten Wolde PR (2010), Spatio-temporal correlations can drastically change the response of a MAPK pathway. _Proc Natl. Acad Sci USA_, 107:2473 — 2478. ([doi](http://dx.doi.org/10.1073/pnas.0906885107), [arXiv](http://arxiv.org/abs/0907.0514))  
[[3](sid:c3)](#r3) Gregor T, Tank DW, Wieschaus EF, Bialek W (2007) Probing the limits to positional information. _Cell_, 130: 153 — 164. ([doi](http://dx.doi.org/10.1016/j.cell.2007.05.025))  
[[4](sid:c4)](#r4) Erdmann T, Howard M, Ten Wolde PR (2009) Role of spatial averaging in the precision of gene expression patterns. _Phys Rev Lett_, 103: 258101. ([doi](http://dx.doi.org/10.1103/PhysRevLett.103.258101), [arXiv](http://arxiv.org/abs/0907.4289))  
[[5](sid:c5)](#r5) Gillespie DT (1977) Exact stochastic simulation of coupled chemical reactions. _J Phys Chem_, 81:2340 — 2361. ([doi](http://dx.doi.org/10.1021/j100540a008))  
[[6](sid:c6)](#r6) Gibson MA, Bruck J (2000) Efficient exact stochastic simulation of chemical systems with many species and many channels. _J Phys Chem A_, 104: 1876 — 1888. ([doi](http://dx.doi.org/10.1021/jp993732q))  
[[7](sid:c7)](#r7) Baras F, Mansour M (1996) Reaction-diffusion master equation: A comparison with microscopic simulations. _Phys Rev E_, 54:6139 — 6148. ([doi](http://dx.doi.org/10.1103/PhysRevE.54.6139))  
[[8](sid:c8)](#r8) Stundzia AB, Lumsden CJ (1996) Stochastic simulation of coupled reaction-diffusion processes. _J Comp Phys_, 127: 196 — 207. ([doi](http://dx.doi.org/10.1006/jcph.1996.0168))  
[[9](sid:c9)](#r9) Ander M et al. (2004) SmartCell, a framework to simulate cellular processes that combines stochastic approximation with diffusion and localization: analysis of simple networks. _Sys Biol_, 1:129 — 138. ([doi](http://dx.doi.org/10.1049/sb:20045017))  
[[10](sid:c10)](#r10) Hattne J, Fange D, Elf J (2005) Stochastic reaction-diffusion simulation with MesoRD. _Bioinformatics_, 21: 2923 — 2924. ([doi](http://dx.doi.org/10.1093/bioinformatics/bti431))  
[[11](sid:c11)](#r11) Engblom S, Ferm L, Hellander A, Lötstedt P (2009) Simulation of stochastic reaction-diffusion processes on unstructured meshes. _SIAM J Sci Comput_, 31:1774 — 1797. ([doi](http://dx.doi.org/10.1137/080721388), [arXiv](http://arxiv.org/abs/0804.3288))  
[[12](sid:c12)](#r12) Andrews S, Bray D (2004) Stochastic simulation of chemical reactions with spatial resolution and single molecule detail. _Phys Biol_, 1:137 — 151. ([doi](http://dx.doi.org/10.1088/1478-3967/1/3/001))  
[[13](sid:c13)](#r13) Coggan JS, Bartol TM, Esquenazi E, Stiles JR, Lamont S, Martone ME, Berg DK, Ellisman MH, Sejnowski TJ (2005) Evidence for ectopic neurotransmission at a neauronal synapse. _Science_, 309:446 -- 451. ([doi](http://dx.doi.org/10.1126/science.1108239))  
[[14](sid:c14)](#r14) Morelli MJ, Ten Wolde PR (2008) Reaction Brownian Dynamics and the effect of spatial fluctuations on the gain of a push-pull network. _J Chem Phys_, 129: 054112. ([doi](http://dx.doi.org/10.1063/1.2958287), [arXiv](http://arxiv.org/abs/0804.4125))  
[[15](sid:c15)](#r15) Boulianne L, Al Assaad S, Dumontier M, Gross WJ (2008) GridCell: a stochastic particle-based biological system simulator. _BMC Sys Biol_, 2:66. ([doi](http://dx.doi.org/10.1186/1752-0509-2-66))  
[[16](sid:c16)](#r16) van Zon JS, tenWolde PR (2005) Simulating biochemical networks at the particle level and in time and space: Green’s function reaction dynamics. _Phys Rev Lett_, 94:128103. ([doi](http://dx.doi.org/10.1103/PhysRevLett.94.128103))  
[[17](sid:c17)](#r17) van Zon JS, ten Wolde PR (2005) Green’s-function reaction dynamics: A particle-based approach for simulating biochemical networks in time and space. _J Chem Phys_, 123:234910. ([doi](http://dx.doi.org/10.1063/1.2137716), [arXiv](http://arxiv.org/abs/q-bio/0404002))  
[[18](sid:c18)](#r18) Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops. _Phys Rev Lett_, 97:230602. ([doi](http://dx.doi.org/10.1103/PhysRevLett.97.230602), [arXiv](http://arxiv.org/abs/0905.3576))  
[[19](sid:c19)](#r19) Opplestrup T, Bulatov VV, Donev A, Kalos MH, Gilmer GH, Sadigh B (2009) First passage kinetic Monte Carlo. _Phys Rev E_, 80: 066701. ([doi](http://dx.doi.org/10.1103/PhysRevE.80.066701), [arXiv](http://arxiv.org/abs/0905.3575))  

