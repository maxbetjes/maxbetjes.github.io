---
title: index
layout: default
---

OrganoidTracker is a great modular framework for 3D cell tracking that provides cell tracks and well-callibrated error probabilities associated with every step in these tracks. These error proabilities can be used to guide manual review or to filter the data enabling fully automated analysis \[[1](#references)\]. 

OrganoidTracker comes with a python based GUI optimized for the curation of 3D cell tracking results \[[2](#references)\]. We currently have machine-learning models available trained on intestinal organoid data and c. Elegans embryos. The intestinal organoid trained models can track a wide range range of 3D tissues including blastocysts. 

We host a [Hugging Face space]({{site.hugging_face_website}}) where users can quickly test our models' performance on their data. 
{: style="text-align: justify"}

<p align="center">
 <video width="260" height="250" controls autoplay muted loop>
  <source src="includes/movies/SV2_Organoid_3D_bottom_view.mp4" type="video/mp4">
   Your browser does not support the video tag.
  </video> 
  <video width="270" height="250" controls autoplay muted loop>
   <source src="includes/movies/SV1_Organoid_single_plane.mp4" type="video/mp4">
   Your browser does not support the video tag.
 </video> 
 <video width="260" height="250" controls autoplay muted loop>
   <source src="includes/movies/SV9_c_Elegans.mp4" type="video/mp4">
   Your browser does not support the video tag.
 </video> 
</p>

<p align="center">
    <b>Automated tracking in action.</b>
</p>


## Contact Us
Questions about OrganoidTracker? Interested in collaborations? [Contact us]({{site.jeroen_website}})! We are very interested in cell tracking problems and we have developed a wide range of analysis tools, that may suite your needs.  

## Add-ons
see our add-onns here

## Applications
List all our papers (?)

## Developers
OrganoidTracker was developped by Max Betjes and Rutger Kok (currently at Rodriguez-Colman Lab, UMCU) at AMOLF in the labs of [Jeroen van Zon]({{site.jeroen_website}}) and [Sander Tans]({{site.sander_website}}). Maintenance is done by Max Betjes and Rutger Kok.
{: style="text-align: justify"}

## References
1. Betjes MA, Tans SJ, Van Zon JS (2025) Cell tracking with accurate error prediction. ([doi]({{site.paper}}))
2. Kok RNU, Hebert L, Huelsz-Prince G, Goos YJ, Zheng X, et al. (2020) OrganoidTracker: Efficient cell tracking using machine learning and manual error correction. PLOS ONE 15(10): e0240802. ([doi](https://doi.org/10.1371/journal.pone.0240802))


