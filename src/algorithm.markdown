---
layout: main
title: GFRD algorithm
file: algorithm
header: Algorithm
---

>%grid2col%
>>## Green’s Function Reaction Dynamics

>>%column first%

>>
A reaction-diffusion system is a many-body problem that cannot be solved 
analytically. The key idea of GFRD is to decompose the many-body problem into 
one- and two-body problems that can be solved analytically via Green’s
functions, and use these Green’s functions to set up an event-driven
algorithm^[1](#c1),[2](#c2). The Green’s functions allow GFRD to make
large jumps in time and space when the particles are far apart from each
other. 

>>
In the original version of the algorithm, the many-body problem was solved
by determining at each step of the simulation a maximum time step such that
each particle could interact with at most one other particle during that time
step^[1](#c1),[2](#c2). This scheme was a synchronous event-driven
algorithm, because at each time step all the particles were propagated
simultaneously. Moreover, the scheme was not exact, because the decomposition
into single particles and pairs of particles involved cut-off distances,
introducing a trade-off between speed and error.

>>
In the new version of the algorithm, we have implemented ideas of Opplestrup
and coworkers^[3](#c3). In this new scheme, protective domains are put
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
chemical master equation^[4](#c4). A movie of eGFRD in action is shown in
Movie 1.

>>### _Single_
A _Single_ is a domain that contains only a single particle. The next _event 
type_ is either a unimolecular reaction of the type A ⇾ B + C + … or A ⇾ Ø, or 
an escape from the domain, as sketched in Fig. 2. To determine which of the 
two possible events will occur, a tentative _event time_ is determined for 
each of them; the event with the smallest tentative _event time_ is the one 
that will occur for that domain; it is the one that is put in the _event 
list_. 

>>### _Pair_
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

>>## Performance
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


>>%column last%
>>>%media%
<img width="440px" src="/images/gfrd.png" title="Fig.1. GFRD">  
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
<video class="video"
poster="/movies/planar-surface_6-particles_100-steps/step.0201.png"
width="440px" height="260px" controls preload="none" title="Movie 1. GFRD in 2D">
  <source src="http://uploadsrv.amolf.nl/uploads/uyr76h4q78miedema137a/planar-surface_6-particles_100-steps.ogv" type='video/ogg; codecs="theora, vorbis"'/>
  <source src="/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.ogv" type='video/ogg; codecs="theora, vorbis"'/>
  <source src="http://uploadsrv.amolf.nl/uploads/uyr76h4q78miedema137a/planar-surface_6-particles_100-steps.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
  <source src="/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
</video>  
Movie 1 ([ogv](/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.ogv), 
[mp4](/movies/planar-surface_6-particles_100-steps/planar-surface_6-particles_100-steps.mp4)). 
_A movie of eGFRD in action in 2D. The green cylinders are protective 
domains for single particles, the yellow cylinders are protective domains for 
pairs of particles. With the color blue the protective domain that will be 
updated next is highlighted._

>>>%media%
<img width="440px" src="/images/single.png" title="Fig.2. Single">  
Fig.2: _A _Single_, a protective domain that contains only a single particle. 
The possible _event types_ are either a unimolecular reaction or the escape of 
the single particle from the protective domain._

>>>%media%
<img width="440px" src="/images/pair.png" title="Fig.3. Pair">  
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


<div style="width: 700px; margin-top: 50px">
<img src="/images/performance.png" title="Fig.4. Performance">  
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
</div>

>%references%
### References
[[1](sid:c1)](#r1) [van Zon JS, tenWolde PR (2005) Simulating biochemical networks at the particle level and in time and space: Green’s function reaction dynamics. _Phys Rev Lett_, 94:128103.](http://dx.doi.org/10.1103/PhysRevLett.94.128103)  
[[2](sid:c2)](#r2) [van Zon JS, ten Wolde PR (2005) Green’s-function reaction dynamics: A particle-based approach for simulating biochemical networks in time and space. _J Chem Phys_, 123:234910.](http://dx.doi.org/10.1063/1.2137716)  
[[3](sid:c3)](#r3) [Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops. _Phys Rev Lett_, 97:230602.](http://dx.doi.org/10.1103/PhysRevLett.97.230602)  
[[4](sid:c4)](#r4) [Gibson MA, Bruck J (2000) Efficient exact stochastic simulation of chemical systems with many species and many channels. _J Phys Chem A_, 104: 1876 — 1888.](http://dx.doi.org/10.1021/jp993732q)  
