# This is a basic version of the script that runs as a standalone "r script".
# You can either "source" the script or run it interactively, line by line.

# Task: 
# Download 2020 Census 2017-2021 ACS data for MA municipalities 
# containing an MBTA commuter rail station. MA munis are 
# "county subdivisions" in the census.

# Step 0
# Load our libraries
library(tidyverse)
library(tidycensus)
library(sf)
library(scales)
library(mapview)
mapviewOptions(fgb = FALSE)

# Step 1: Download Data from the US Census
# Use the tidycensus package to do this. 
# We use `geometry = TRUE` to download the shapes.
# We use `sf::st_stransform` to make sure its in the state's system.

pop_17_21 <- tidycensus::get_acs(
  geography = "county subdivision",
  state = "MA",
  variables = "B01001_001",
  year = 2021,
  geometry = TRUE
) |> sf::st_transform(26986)

# Step 2: Download the commuter rail station locations
# We download the data from the MBTA Open Data Portal.
cr_stations <-
  sf::read_sf(
    "https://gis.massdot.state.ma.us/arcgis/rest/services/Multimodal/GTFS_Systemwide/MapServer/2/query?outFields=*&where=1%3D1&f=geojson"
  ) |>
  select(stop_id, stop_name, zone_id) |> 
  sf::st_transform(26986)

# Step 3
# Use sf to find which town each station is in.
# The number of records decreases b/c we lose the RI stations and platforms.
cr_stations_ma <- sf::st_intersection(cr_stations, pop_17_21)

# Step 4
# Filter the census dataset for those munis with a station.
pop_17_21_CR <- pop_17_21 |> 
  filter(GEOID %in% cr_stations_ma$GEOID)

# Step 5
# Sum the population.
pop_17_21_CR_tot <- pop_17_21_CR |>
  summarize(
    pop_total = sum(estimate),
    pop_moe = tidycensus::moe_sum(moe = moe, estimate = estimate)
  ) |> 
  mutate(pop_tot_moe_fmt = paste0(
    scales::comma(pop_total, accuracy = 1), " +/- ", 
    scales::comma(pop_moe, accuracy = 0.1)))

# Step 6: 
# Report out the result
pop_17_21_CR_tot$pop_tot_moe_fmt

# and a map.
mapview(pop_17_21_CR, zcol = "estimate") +
  mapview(cr_stations_ma, col.regions = "purple")
