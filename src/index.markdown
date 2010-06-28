---
layout: index
title: GFRD home
header: "GFRD: super fast reaction-diffusion simulations at the particle level" 
---

>%media right w400%
<video class="video" poster="/movies/12-particles_100-steps/step.0000.png" width="400" height="400" controls preload>
  <source src="/movies/12-particles_100-steps/movie.ogv" type='video/ogg; codecs="theora, vorbis"'></source>
  <source src="/movies/12-particles_100-steps/movie.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
</video>  
Movie ([ogv](/movies/12-particles_100-steps/movie.ogv), [mp4](/movies/12-particles_100-steps/movie.mp4)). _A movie of eGFRD in action. The green spheres are protective domains for single particles, the yellow sphere seen towards the end of the movie is a protective domains for a pair of particles. With the color blue the protective domain which will be updated next is highlighted._

Green's Function Reaction Dynamics (GFRD) is an algorithm that makes it possible to simulate reaction-diffusion systems at the particle level [[1](#1), [2](#2), [3](#3)]. The principal idea of GFRD is to decompose the **many-body reaction-diffusion problem** into one- and two-body reaction-diffusion problems that can be **solved analytically using Green’s Functions** [[1](#1), [2](#2)]. These Green’s Functions are then employed to set up an event-driven algorithm, which makes it possible to make large jumps in time and space when the particles are far apart from each other. In biological systems this is often the case, and, indeed, GFRD can be up to **6 orders of magnitude faster** than conventional Brownian Dynamics under biologically relevant conditions [[1](#1)].

Recently, ideas developed by Opplestrup and coworkers [[4](#4)] have been implemented, which has turned GFRD into an **exact**, **asynchronous event-driven** algorithm [[3](#3)].

The GFRD algorithm is generic and can be applied to a wide variety of reaction-diffusion problems, including those in population dynamics, evolution, and soft-condensed matter physics. The scheme presented here has been specifically designed to simulate biochemical networks. The current version allows the efficient **simulation** of **signal transduction pathways** and **gene regulation networks** in the cytoplasm, but work is in progress to implement reactions at surfaces such as membranes, and reactions at, and passive and active transport along, polymers such as microtubules and DNA.

GFRD is developed in the groups of Takahashi at the [Riken institute](http://www.riken.jp) in Japan and Ten Wolde at the FOM insitute for [Atomic and Molecular Physics (AMOLF)](http://www.amolf.nl) in The Netherlands.

### References
[1](id:1) Van Zon JS, Ten Wolde PR (2005) Simulating biochemical networks at the particle level in time and space: Green’s Function Reaction Dynamics. _Phys Rev Lett_, 94: 128103.  
[2](id:2) Van Zon JS,  Ten Wolde PR (2005) Green’s Function Reaction Dynamics: A particle-based approach for simulating biochemical networks in time and space. _J Chem Phys_, 123: 234910.  
[3](id:3) Takahashi K, Tanase-Nicola S, Ten Wolde PR (2010) Spatio-temporal correlations can drastically change the response of a MAPK pathway. _Proc. Natl Acad Sci USA_, 107: 2473 — 2478.  
[4](id:4) Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops. _Phys Rev Lett_, 97:230602.
