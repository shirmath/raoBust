---
title: 'raoBust: An R package for Robust Rao (score) tests for Generalized Linear Models'
tags:
  - R
  - robust hypothesis testing
  - robust standard errors

authors:
  - name: Shirley Mathur
    orcid: 0009-0007-8673-0344
    equal-contrib: true # (This is how to denote equal contribution)
    affiliation: 1 # (Multiple affiliations must be quoted)
  - name: Amy D. Willis
    orcid: 0000-0002-2802-4317
    corresponding: true # (This is how to denote the corresponding author)
    affiliation: 1
affiliations:
 - name: Department of Statistics, University of Washington, Seattle, USA
   index: 1
  - name: Department of Biostatistics, University of Washington, Seattle, USA
   index: 2

date:
bibliography: paper.bib

---

# Summary

Generalized linear models are widely used in modern scientific research. Currently, there are several functions in `R` that allow users to fit these models, 
such as `stats::glm()`, `geepack::geese`, `geepack::geepack`, to name a few. A critical component of statistical analysis involving these models and performing
inference on the models estimated by these functions. Presently, while these function do implement inferential procedures for the parameter estimates, they do not implement
robust inference procedures, such as robust Rao (score) tests. The advantage of using these procedures over their non-robust counterparts are that they tend to have a 
lower rate of having false positive results than other tests in small samples. Thus, it is important to implement these procedures in an easy-to-use intuitive package
for scientific researchers, which is precisely the niche that raoBust fills.


# Statement of need


# Examples



# Citations

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

If you want to cite a software repository URL (e.g. something on GitHub without a preferred
citation) then you can do it with the example BibTeX entry below for @fidgit.

For a quick reference, the following citation commands can be used:
- `@author:2001`  ->  "Author et al. (2001)"
- `[@author:2001]` -> "(Author et al., 2001)"
- `[@author1:2001; @author2:2001]` -> "(Author1 et al., 2001; Author2 et al., 2002)"

# Figures

Figures can be included like this:
![Caption for example figure.\label{fig:example}](figure.png)
and referenced from text using \autoref{fig:example}.

Figure sizes can be customized by adding an optional second parameter:
![Caption for example figure.](figure.png){ width=20% }

# Acknowledgements

# References
