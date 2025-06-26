---
title: index
layout: default
---

GFRD decomposes the many-body reaction-diffusion problem into one- and two-body problems that can be solved analytically using Green’s Functions \[[1,2,3,4](#references)\]. These Green’s Functions are then employed to set up an event-driven algorithm, which makes it possible to take large jumps in time and space when the particles are far apart from each other. GFRD can be up to 6 orders of magnitude faster than conventional algorithms based on Brownian Dynamics \[[1](#references)\].
<p align="center">
    <a href="includes\movies\SV2_Organoid_3D_bottom_view.mp4">
        <img src="includes\images\powerspectrum.jpg" alt="eGFRD in action" width="500"/>
    </a><br>
    <b>Movie 1. eGFRD in action.</b>
</p>

## Applications
The eGFRD algorithm is generic and can be applied to a wide variety of reaction-diffusion problems, including those in population dynamics, evolution, and soft-condensed matter physics. The scheme presented here has been specifically designed to simulate biochemical networks. 

## eGFRD in all dimensions
The original code to simulate reactions and diffusion in 3D (cytoplasm) has been rewritten in Modern C++, resulting in a very fast simulator. A [prototype]({{site.github_old_repository}}) has been developed that can also simulate systems in 2D (membranes) and 1D (filaments) \[[5](#references)\].

## Developers
The eGFRD algorithm was originally developed by the group of Takahashi at the [Riken institute]({{site.riken_website}}) in Japan and the group of Ten Wolde at [AMOLF]({{site.company_website}}) in The Netherlands.

## References
1. Van Zon JS, Ten Wolde PR (2005) Simulating biochemical networks at the particle level in time and space: Green’s Function Reaction Dynamics. Phys Rev Lett, 94: 128103. ([doi](https://dx.doi.org/10.1103/PhysRevLett.94.128103))
2. Van Zon JS, Ten Wolde PR (2005) Green’s Function Reaction Dynamics: A particle-based approach for simulating biochemical networks in time and space. J Chem Phys, 123: 234910. ([doi](https://dx.doi.org/10.1063/1.2137716), [arXiv](https://arxiv.org/abs/q-bio/0404002))
3. Takahashi K, Tanase-Nicola S, Ten Wolde PR (2010) Spatio-temporal correlations can drastically change the response of a MAPK pathway. Proc. Natl Acad Sci USA, 107: 2473 — 2478. ([doi](https://dx.doi.org/10.1073/pnas.0906885107), [arXiv](https://arxiv.org/abs/0907.0514))
4. Opplestrup T, Bulatov VV, Gilmer GH, Kalos MH, Sadigh B (2006) First-passage Monte Carlo algorithm: diffusion without all the hops. Phys Rev Lett, 97:230602. ([doi](https://dx.doi.org/10.1103/PhysRevLett.97.230602), [arXiv](https://arxiv.org/abs/0905.3576))
5. Sokolowski TR, Paijmans J, Bossen L, Miedema T, Wehrens M, Becker NB, Kaizu K, Takahashi K, Dogterom M, Ten Wolde PR(2019) eGFRD in all dimensions. J Chem Phys, 150: 054108.  ([doi](https://doi.org/10.1063/1.5064867))


