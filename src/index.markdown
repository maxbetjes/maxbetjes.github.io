---
layout: index
title: GFRD home
header: Green's Function Reaction Dynamics
---

## An event-driven algorithm for simulating reaction-diffusion systems at the particle level

>%grid2col%
>>%column first%

>>### Idea
The crux of Green's Function Reaction Dynamics is to decompose the many-body
reaction-diffusion problem into one- and two-body problems that can be solved
analytically using Green's Function, and use these functions to set up an
event-driven algorithm^[[1](#c1)](sid:r1),[[2](#c2)](sid:r2),[[3](#c3)](sid:r3),[[4](#c4)](sid:r4).

>>### Speed
The Green's functions make it possible to make large jumps in time and space
when the particles are far apart from each other. Under biologically relevant
conditions, GFRD can be up to 6 orders of magnitude faster than brute-force
Brownian Dynamics.

>>### Applications
The GFRD algorithm is generic and can be applied to a wide variety of
reaction-diffusion problems, including those in population dynamics,
evolution, and soft-condensed matter physics. The scheme presented here has
been specifically designed to simulate biochemical networks. The original
version allows the efficient simulation of signal transduction pathways and
gene regulation networks in the cytoplasm. Recently we have also implemented
reactions at surfaces including membranes, and reactions at, and passive and
active transport along, polymers such as microtubules and DNA.

>>### Developers
GFRD is developed in the groups of Takahashi at the [Riken 
institute](http://www.riken.jp) in Japan and Ten Wolde at the FOM insitute for 
[Atomic and Molecular Physics (AMOLF)](http://www.amolf.nl) in The 
Netherlands.

>>>%references%
#### References
[[1](sid:c1)](#r1) Van Zon JS, Ten Wolde PR (2005) Simulating biochemical networks at the particle level in time and space: Green’s Function Reaction Dynamics. _Phys Rev Lett_, 94: 128103. ([doi](http://dx.doi.org/10.1103/PhysRevLett.94.128103))  
[[2](sid:c2)](#r2) Van Zon JS,  Ten Wolde PR (2005) Green’s Function Reaction Dynamics: A particle-based approach for simulating biochemical networks in time and space. _J Chem Phys_, 123: 234910. ([doi](http://dx.doi.org/10.1063/1.2137716), [arXiv](http://arxiv.org/abs/q-bio/0404002))  
[[3](sid:c3)](#r3) Takahashi K, Tanase-Nicola S, Ten Wolde PR (2010) Spatio-temporal correlations can drastically change the response of a MAPK pathway. _Proc.  Natl Acad Sci USA_, 107: 2473 — 2478. ([doi](http://dx.doi.org/10.1073/pnas.0906885107), [arXiv](http://arxiv.org/abs/0907.0514))  
[[4](sid:c4)](#r4) Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops.  _Phys Rev Lett_, 97:230602. ([doi](http://dx.doi.org/10.1103/PhysRevLett.97.230602), [arXiv](http://arxiv.org/abs/0905.3576))  

>>%column last%

>>>%media%
<a href="/downloads"><img style="width: 320px; margin: 100px 50px 0px;" src="/images/download.png" title="Download"/></a>

>>>%media%
<video class="video" width="440px" height="480px" controls preload="none" title="Movie. GFRD in 3D">
  <source src="/movies/12-particles_200-steps/12-particles_200-steps.ogv" type='video/ogg; codecs="theora, vorbis"'/>
  <source src="/movies/12-particles_200-steps/12-particles_200-steps.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
</video>  
Movie ([ogv](/movies/12-particles_200-steps/12-particles_200-steps.ogv), 
[mp4](/movies/12-particles_200-steps/12-particles_200-steps.mp4)). _A movie of
eGFRD in action in 3D. The large spheres and cylinders are protective domains with one or two
particles inside. The plane at the bottom represents a membrane to which particles can bind.
The spherical protective domains model the diffusion and reaction between particles in 3D. The flat
cylindrical protective domains are used to calculate the diffusion and reaction of particles in the membrane,
whereas the bigger cylindrical protective domains are used to model the association of a 3D particle with
the membrane. Note that the color red is used to denote the protective domain that will be updated next._

<div style="position:relative; height: 160px;">
  <a href="http://www.amolf.nl"><img style="position: absolute; bottom: -20px;" width="220px" src="/images/AmolfLogo_rgb.jpg" title="Amolf Logo"></a>
  <a href="http://www.riken.jp"><img style="position: absolute; bottom: -22px; left: 430px;" width="100px" src="/images/rikenlogo.jpg" title="Riken Logo"></a>
  <a href="http://www.gfrd.org"><img style="position: absolute; bottom: -178px; right: -40px;" width="300px" src="/images/gfrdlogo.jpg" title="GFRD Logo"></a>
</div>



