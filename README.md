readme
================

## Estimating the Population of Municipalities with MBTA Commuter Rail Stations

This is a basic script that shows how we can use tools to open up the
“analysis” part of geospatial work. In this case, the geospatial
analysis is quite simple–merely an intersection and some basic
dissolving of boundaries. The capabilities expand much farther. An
exploration of the `sf` package’s
[page](https://r-spatial.github.io/sf/) will give a much more thorough
overview than I could provide.

## Structure

There is a basic R script that can be sourced or can be run in an
interactive, line-by-line fashion. Either way, the script will export
the population for munis in MA that have a commuter rail station. A map
should appear in the “Viewer” pane if you are using RStudio as your IDE.

The quarto document provides a way to intersperse code and text, tightly
integrating the process we follow with relevant text. This way of
working is best handled in the [platform’s
documentation](https://quarto.org/).

We also published the quarto doc using the github sites functionality.
This provides a place for the html document created by the .qmd file to
live.
