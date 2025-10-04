---
title: index
layout: default
---

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

OrganoidTracker is a 3D cell tracking tool developed by the Tans and van Zon labs at AMOLF in Amsterdam. It was created for organoids, where cells are difficult to track because they form complex 3D tissue architectures, are tightly packed and can move rapidly. However, it also works well for other 3D and 2D cell systems.

## Features
OrganoidTracker comes with a python-based GUI, that enables optimised manual curation of the 3D cell tracking results \[[2](#references)\]. We currently have machine-learning models available trained on intestinal organoid and on <em> C. elegans</em> embryos data. The intestinal organoid-trained models can track a wide range range of 3D tissues, including blastocysts. 

Our most recent version allows more efficient cell tracking, and provides error probabilities of the tracking results. These error probabilities can be used to target manual curation or to filter data for fully automated analysis \[[1](#references)\]. 

We host a [Hugging Face space]({{site.hugging_face_website}}) where users can upload their microscopy data to quickly test our models' performance on their data. We are also open to tracking your microscopy movies within our groups, and to help with different types of downstream analysis of the resulting spatio-temporal data. We have already established many productive collaborations, so do contact us if you are interested.
{: style="text-align: justify"}

## Contact Us
Questions about OrganoidTracker? Interested in collaborations? [Contact us]({{site.jeroen_website}})! We are very interested in cell tracking problems and we have developed a wide range of analysis tools, that may suite your needs.  

## Developers
OrganoidTracker was developped by Max Betjes and Rutger Kok (currently at Rodriguez-Colman Lab, UMCU) at AMOLF in the labs of [Jeroen van Zon]({{site.jeroen_website}}) and [Sander Tans]({{site.sander_website}}). Maintenance is done by Max Betjes and Rutger Kok.
{: style="text-align: justify"}

## References
1. Betjes MA, Kok RNU, Tans SJ & Van Zon JS (2025) Cell tracking with accurate error prediction. Nature Methods. ([doi]({{site.paper}}))
2. Kok RNU, Hebert L, Huelsz-Prince G, Goos YJ, Zheng X, et al. (2020) OrganoidTracker: Efficient cell tracking using machine learning and manual error correction. PLOS ONE 15(10): e0240802. ([doi](https://doi.org/10.1371/journal.pone.0240802))


