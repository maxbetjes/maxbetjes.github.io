---
title: index
layout: default
---

The crux of enhanced Green’s Function Reaction Dynamics (eGFRD) is to decompose the many-body reaction-diffusion problem into one- and two-body differential equations. These equations can be solved analytically using Green’s Function, and used to set up an event-driven algorithm \[[1,2,3,4](#references)\].
<p align="center">
    <a href="includes\movies\movie.mp4">
        <img src="includes\images\movie.jpg" alt="eGFRD in action"/>
    </a><br>
    <b>eGFRD in action</b>
</p>

# Applications
The eGFRD algorithm is generic and can be applied to a wide variety of reaction-diffusion problems, including those in population dynamics, evolution, and soft-condensed matter physics. The scheme presented here has been specifically designed to simulate biochemical networks. The original version allows the efficient simulation of signal transduction pathways and gene regulation networks in the cytoplasm. Recently we have implementation a modern C++ version of eGFRD, resulting in a novel and very fast simulator.

## Developers
The eGFRD algorithm was initially constructed by the group of Takahashi at the [Riken institute]({{site.riken_website}}) in Japan and Ten Wolde at [AMOLF]({{site.company_website}}) in The Netherlands.

# References
1. Van Zon JS, Ten Wolde PR (2005) Simulating biochemical networks at the particle level in time and space: Green’s Function Reaction Dynamics. Phys Rev Lett, 94: 128103. ([doi](https://dx.doi.org/10.1103/PhysRevLett.94.128103))
2. Van Zon JS, Ten Wolde PR (2005) Green’s Function Reaction Dynamics: A particle-based approach for simulating biochemical networks in time and space. J Chem Phys, 123: 234910. ([doi](https://dx.doi.org/10.1063/1.2137716), [arXiv](https://arxiv.org/abs/q-bio/0404002))
3. Takahashi K, Tanase-Nicola S, Ten Wolde PR (2010) Spatio-temporal correlations can drastically change the response of a MAPK pathway. Proc. Natl Acad Sci USA, 107: 2473 — 2478. ([doi](https://dx.doi.org/10.1073/pnas.0906885107), [arXiv](https://arxiv.org/abs/0907.0514))
4. Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops. Phys Rev Lett, 97:230602. ([doi](https://dx.doi.org/10.1103/PhysRevLett.97.230602), [arXiv](https://arxiv.org/abs/0905.3576))
