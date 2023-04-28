Estimating the Population of Municipalities with MBTA Commuter Rail
Stations
================

This is a basic script that shows how we can use tools to open up the
“analysis” part of geospatial work. In this case, the geospatial
analysis is quite simple–merely an intersection and some basic
dissolving of boundaries. The analysis itself takes shortcuts that we
might not have taken if answering the question was the important part of
this.

The geospatial capabilities within the R world expand much farther than
what’s included here. An exploration of the `sf` package’s
[page](https://r-spatial.github.io/sf/) will give a much more thorough
overview than I could provide.

## Structure

Within the analysis folder there is a basic R script that can be sourced
or can be run in an interactive, line-by-line fashion. Either way, the
script will export the population for munis in MA that have a commuter
rail station. A map should appear in the “Viewer” pane if you are using
RStudio as your IDE.

The quarto document provides a way to intersperse code and text, tightly
integrating the process we follow with relevant text. This way of
working is best handled in the [platform’s
documentation](https://quarto.org/).

We also [published the quarto
doc](https://ctpsstaff.github.io/MBTA_CR_muni_population/) using the
github sites functionality. This provides a place for the html document
created by the .qmd file to live. This lives in a separate branch
(gh-pages) in the docs folder. The file is manually dragged into the
folder and renamed to index.html.

We write basic output to the “output” folder. We export a csv and a
geopackage.

## Packages Used

We use the following packages. I would not expect the versions to matter
for the operations we are using in this contrived example.

``` r
install.packages(c("tidyverse", "sf", "tidycensus", "scales", "mapview", "gt"))
```

I recommend installing the latest version of RStudio (the premier IDE
for R) and R. RStudio provides a [learning
center](https://education.rstudio.com/learn/beginner/) to get started.
