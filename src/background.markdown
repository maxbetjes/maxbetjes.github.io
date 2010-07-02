---
layout: main
title: GFRD background
file: background
header: GFRD background information
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

## Green’s Function Reaction Dynamics

>%grid2col%
>>%column first%
A reaction-diffusion system is a many-body problem that cannot be solved 
analytically. The key idea of GFRD is to decompose the many-body problem into 
one- and two-body problems that can be solved analytically via Green’s
functions, and use these Green’s functions to set up an event-driven
algorithm^[16](#c16),[17](#c17). The Green’s functions allow GFRD to make
large jumps in time and space when the particles are far apart from each
other. 

>> In the original version of the algorithm, the many-body problem was solved
by determining at each step of the simulation a maximum time step such that
each particle could interact with at most one other particle during that time
step^[16](#c16),[17](#c17). This scheme was a synchronous event-driven
algorithm, because at each time step all the particles were propagated
simultaneously. Moreover, the scheme was not exact, because the decomposition
into single particles and pairs of particles involved cut-off distances,
introducing a trade-off between speed and error.

>>
In the new version of the algorithm, we have implemented ideas of Opplestrup
and coworkers^[18](#c18). In this new scheme, protective domains are put
around single particles and pairs of particles, as shown in Fig. 1. For each
of the domains, the reaction-diffusion problem is solved analytically using
Green’s functions. This yields for each domain an _event type_ and an _event
time_; as described below, the set of possible _event types_ depends on
whether the domain is a _Single_, meaning it contains a single particle, or a
_Pair_, meaning it contains a pair of particles. The _event times_ are put in
a chronologically ordered _event list_, and the events are then executed in
chronological order. When an event is executed, the particles of the
corresponding domain are propagated, for the propagated particles new domains,
with new _event types_ and new _event times_, are determined, and the new
events are put back in the _event list_. The new version of GFRD, called
eGFRD, is thus an exact, event-driven, asynchronous algorithm. Its
asynchronous nature makes eGFRD similar in spirit to event-driven MD
simulations of hard spheres and the Gibson-Bruck scheme, which is an exact,
event-driven asynchronous algorithm for simulating the _zero-dimensional_
chemical master equation^[6](#c6). A movie of eGFRD in action is shown in
Movie 1.

>>## _Single_
A _Single_ is a domain that contains only a single particle. The next _event 
type_ is either a unimolecular reaction of the type A ⇾ B + C + … or A ⇾ Ø, or 
an escape from the domain, as sketched in Fig. 2. To determine which of the 
two possible events will occur, a tentative _event time_ is determined for 
each of them; the event with the smallest tentative _event time_ is the one 
that will occur for that domain; it is the one that is put in the _event 
list_. 

>>## _Pair_
A _Pair_ is a domain that contains a pair of particles. The reaction-diffusion 
problem of two particles that can react with each other and diffuse in a 
spherical domain with absorbing boundary conditions can, to our knowledge, not 
be solved analytically. We therefore apply a coordinate transformation leading 
to a diffusion problem for the center-of-mass coordinate **R** and a 
reaction-diffusion problem for the inter-particle vector r, as sketched in 
Fig. 3. The _event types_ that can occur are **R** leaving its domain, **r** 
leaving its domain, a unimolecular reaction or a bimolecular reaction. For 
each of these events a tentative _event time_ is determined, and the event 
with the smallest tentative _event time_ is the one that will happen, and put 
in the _event list_. 

>>%column last%
>>>%media%
![](/images/gfrd.png =400x "Fig.1. GFRD")  
Fig.1: _Overview of GFRD. The principal idea of GFRD is to decompose the 
many-body reaction-diffusion problem into one- and two-body problems that can 
be solved analytically using Green’s Functions. To this end, protective 
domains are put around single particles and pairs of particles, leading to 
so-called _Singles_ and _Pairs_, respectively. For each domain, a next _event 
type_ and a next _event time_ is determined. The _event times_ are put in a 
chronologically ordered _event list_, and the events are then executed in 
chronological order. When an event is executed, the particles of the 
corresponding domain are propagated, new domains with new events are 
determined, and the events are put back in the event list._ 

>>>%media%
<video class="video" poster="/movies/planar-surface_6-particles_100-steps/step.0201.png" width="440" height="260" controls preload="none" title="Movie 1. GFRD in 2D">
  <source src="http://uploadsrv.amolf.nl/uploads/uyr76h4q78miedema137a/planar-surface_6-particles_100-steps.ogv" type='video/ogg; codecs="theora, vorbis"'/>
  <source src="/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.ogv" type='video/ogg; codecs="theora, vorbis"'/>
  <source src="http://uploadsrv.amolf.nl/uploads/uyr76h4q78miedema137a/planar-surface_6-particles_100-steps.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
  <source src="/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
</video><br/>
>>>Movie 1 ([ogv](/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.ogv), 
[mp4](/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.mp4)). 
_A movie of eGFRD in action in 2D. The green cylinders are protective 
domains for single particles, the yellow cylinders are protective domains for 
pairs of particles. With the color blue the protective domain that will be 
updated next is highlighted._

>>>%media%
![](/images/single.png =400x "Fig.2. Single")  
Fig.2: _A _Single_, a protective domain that contains only a single particle. 
The possible _event types_ are either a unimolecular reaction or the escape of 
the single particle from the protective domain._

>>>%media%
![](/images/pair.png =400x "Fig.3. Pair")  
Fig.3: _A _Pair_, a protective domain that contains a pair of particles. A 
coordinate transformation is applied, and one protective domain is defined for 
the center-of-mass coordinate **R** and one for the inter-particle vector *r*. 
The sizes of these domains are determined such that when both **R** and **r** 
would reach their maximum values, _|_**R**_|_^**max** and _|_**r**_|_^**max**, 
respectively, the two particles would still be within the original protective 
domain. The dynamics of **R** is a diffusion problem of a random walker in a 
spherical domain with absorbing boundary conditions. The dynamics of **r** 
takes into account that the two particles not only diffuse, but can also react 
with each other; this is the problem of a random walker between two concentric 
spherical surfaces, with a radiation boundary condition at the inner surface, 
describing the bimolecular reaction, and an adsorbing boundary condition at 
the outer surface, describing the escape from the domain. The next event is 
thus either the escape of **R** from its domain, the escape of **r** from its 
domain, a bimolecular reaction, or a unimolecular reaction._

>>%column first%
## Performance
Fig.4 shows the power of eGFRD. Plotted is the CPU time for simulating a 
system consisting of hard spheres for a fixed amount of real time as a 
function of the number of particles N, for two scenarios: one in which the 
concentration C is kept constant (solid line) and one in which the volume V is 
kept constant (dashed lines). For comparison, two curves (in blue) obtained 
with Brownian Dynamics (BD) are also shown: one corresponding to a BD 
simulation with a conventional, small time step of δt = 10^-6 σ^2 / D, and one 
corresponding to a (relaxed) BD simulation using a relatively large time step 
of δt = 10^-3 σ^2 / D. It is seen that the CPU time of eGFRD scales linearly 
with N when the concentration is constant, as in BD; this is because a cell 
list is used for determining which particles or domains interact with a given 
particle or domain. However, the CPU time of eGFRD scales with N^5/3 when the 
volume is kept constant. This can be understood by noting that the CPU time 
scales with N / <Δt>, where <Δt> is the magnitude of the average time step in 
the eGFRD simulations; the size of the average time step scales as <Δt> ~ 1 / 
l^2 ~ N^2/3, where l is the average distance between the particles.  Indeed, 
when N is increased while V is kept constant, the concentration C increases 
and the average distance between the particles decreases. This decreases the 
jumps in time and space that can be made during the eGFRD simulations. Since 
the CPU time of BD scales with N wile that of eGFRD scales with N^5/3 when V 
is constant, there is a concentration above which BD becomes more efficient 
than eGFRD. This is demonstrated in the inset of Fig.4. It is seen that the 
cross-over occurs at mM concentration. However, the concentrations of 
components in signal transduction pathways are typically in the µM range, 
while those in gene regulation networks are typically in the nM range. Under 
these biologically relevant conditions, eGFRD is up to 6 orders of magnitude
more efficient than BD. 

>%media w800%
![](/images/performance.png "Fig.4. Performance")  
Fig.4. _CPU time for simulating a system of hard spheres for a fixed amount of 
real time as a function of the number of particles N for two scenarios: one in 
which the concentration C is kept constant (solid line), and one in which the 
volume V is kept constant (dashed line). For comparison, we also show the 
results for BD simulations (blue curves), with one curve corresponding to a 
simulation with a conventional small time step of δt = 10^-6 σ^2 / D, and one 
corresponding to a (relaxed) BD simulation using a relatively large time step 
of δt = 10^-3 σ^2 / D. The inset shows the CPU time as a function of the 
concentration C, for N=300 and N=3000 (the volume is thus varied). It is seen 
that above mM concentrations, BD is more efficient than eGFRD. However, in the 
biologically relevant concentration range of nM to µM eGFRD can be up to 6 
orders of magnitude more efficient than conventional BD._

>%references%
### References
[[1](sid:c1)](#r1) [van Zon JS, Morelli M, Tanase-Nicola S, ten Wolde PR (2006) Diffusion of transcription factors can drastically enhance the noise in gene expression. _Biophys J_, 91:4350 — 4367.](http://dx.doi.org/10.1529/biophysj.106.086157)  
[[2](sid:c2)](#r2) [Takahashi K, Tanase-Nicola S, Ten Wolde PR (2010), Spatio-temporal correlations can drastically change the response of a MAPK pathway. _Proc Natl. Acad Sci USA_, 107:2473 — 2478.](http://dx.doi.org/10.1073/pnas.0906885107)  
[[3](sid:c3)](#r3) [Gregor T, Tank DW, Wieschaus EF, Bialek W (2007) Probing the limits to positional information. _Cell_, 130: 153 — 164.](http://dx.doi.org/10.1016/j.cell.2007.05.025)  
[[4](sid:c4)](#r4) [Erdmann T, Howard M, Ten Wolde PR (2009) Role of spatial averaging in the precision of gene expression patterns. _Phys Rev Lett_, 103: 258101.](http://dx.doi.org/10.1103/PhysRevLett.103.258101)  
[[5](sid:c5)](#r5) [Gillespie DT (1977) Exact stochastic simulation of coupled chemical reactions. _J Phys Chem_, 81:2340 — 2361.](http://dx.doi.org/10.1021/j100540a008)  
[[6](sid:c6)](#r6) [Gibson MA, Bruck J (2000) Efficient exact stochastic simulation of chemical systems with many species and many channels. _J Phys Chem A_, 104: 1876 — 1888.](http://dx.doi.org/10.1021/jp993732q)  
[[7](sid:c7)](#r7) [Baras F, Mansour M (1996) Reaction-diffusion master equation: A comparison with microscopic simulations. _Phys Rev E_, 54:6139 — 6148.](http://dx.doi.org/10.1103/PhysRevE.54.6139)  
[[8](sid:c8)](#r8) [Stundzia AB, Lumsden CJ (1996) Stochastic simulation of coupled reaction-diffusion processes. _J Comp Phys_, 127: 196 — 207.](http://dx.doi.org/10.1006/jcph.1996.0168)  
[[9](sid:c9)](#r9) [Ander M et al. (2004) SmartCell, a framework to simulate cellular processes that combines stochastic approximation with diffusion and localization: analysis of simple networks. _Sys Biol_, 1:129 — 138.](http://dx.doi.org/10.1049/sb:20045017)  
[[10](sid:c10)](#r10) [Hattne J, Fange D, Elf J (2005) Stochastic reaction-diffusion simulation with MesoRD. _Bioinformatics_, 21: 2923 — 2924.](http://dx.doi.org/10.1093/bioinformatics/bti431)  
[[11](sid:c11)](#r11) [Engblom S, Ferm L, Hellander A, Lötstedt P (2009) Simulation of stochastic reaction-diffusion processes on unstructured meshes. _SIAM J Sci Comput_, 31:1774 — 1797.](http://dx.doi.org/10.1137/080721388)  
[[12](sid:c12)](#r12) [Andrews S, Bray D (2004) Stochastic simulation of chemical reactions with spatial resolution and single molecule detail. _Phys Biol_, 1:137 — 151.](http://dx.doi.org/10.1088/1478-3967/1/3/001)  
[[13](sid:c13)](#r13) [Coggan JS, Bartol TM, Esquenazi E, Stiles JR, Lamont S, Martone ME, Berg DK, Ellisman MH, Sejnowski TJ (2005) Evidence for ectopic neurotransmission at a neauronal synapse. _Science_, 309:446 - 451.]  
[[14](sid:c14)](#r14) [Morelli MJ, Ten Wolde PR (2008) Reaction Brownian Dynamics and the effect of spatial fluctuations on the gain of a push-pull network. _J Chem Phys_, 129: 054112.](http://dx.doi.org/10.1063/1.2958287)  
[[15](sid:c15)](#r15) [Boulianne L, Al Assaad S, Dumontier M, Gross WJ (2008) GridCell: a stochastic particle-based biological system simulator. _BMC Sys Biol_, 2:66.](http://dx.doi.org/10.1186/1752-0509-2-66)  
[[16](sid:c16)](#r16) [van Zon JS, tenWolde PR (2005) Simulating biochemical networks at the particle level and in time and space: Green’s function reaction dynamics. _Phys Rev Lett_, 94:128103.](http://dx.doi.org/10.1103/PhysRevLett.94.128103)  
[[17](sid:c17)](#r17) [van Zon JS, ten Wolde PR (2005) Green’s-function reaction dynamics: A particle-based approach for simulating biochemical networks in time and space. _J Chem Phys_, 123:234910.](http://dx.doi.org/10.1063/1.2137716)  
[[18](sid:c18)](#r18) [Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops. _Phys Rev Lett_, 97:230602.](http://dx.doi.org/10.1103/PhysRevLett.97.230602)  
[[19](sid:c19)](#r19) [Opplestrup T, Bulatov VV, Donev A, Kalos MH, Gilmer GH, Sadigh B (2009) First passage kinetic Monte Carlo. _Phys Rev E_, 80: 066701.](http://dx.doi.org/10.1103/PhysRevE.80.066701)  

