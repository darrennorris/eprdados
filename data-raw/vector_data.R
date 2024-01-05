## code to prepare vector datasets goes here
library(tidyverse)
library(sf)
library(landscapemetrics)
library(usethis)

# GPKG with river center line and sample points used in Métricas
mypath <- "yourpathhere"
mypath <- "C:\\Users\\user\\Documents\\Articles\\gis_layers\\gisdata\\inst\\vector\\rivers.gpkg"
# subzone midpoints
rsm <- sf::st_read(mypath, layer = "midpoints")
# linha central de rios
rsl <- sf::st_read(mypath, layer = "centerline")

rio_pontos <- rsm |>
  select(aid, subz_id, long, lat, zone, rio, secl_r, impact)
# buffers
rio_pontos_31976 <- rio_pontos |>
  st_transform(31976)

rio_pontos_buff <- bind_rows(st_buffer(rio_pontos_31976[1, ],
                                    dist = 250) |>
                               mutate(raio = 250),
                             st_buffer(rio_pontos_31976[1, ],
                                    dist = 500) |>
                               mutate(raio = 500),
                             st_buffer(rio_pontos_31976[1, ],
                                    dist = 1000) |>
                               mutate(raio = 1000),
                             st_buffer(rio_pontos_31976[1, ],
                                    dist = 2000) |>
                               mutate(raio = 2000),
                             st_buffer(rio_pontos_31976[1, ],
                                    dist = 4000) |>
                               mutate(raio = 4000),
                             st_buffer(rio_pontos_31976[1, ],
                                    dist = 8000) |>
                               mutate(raio = 8000),
                             st_buffer(rio_pontos_31976[1, ],
                                     dist = 16000) |>
                               mutate(raio = 1600)
) |>
  st_transform(4326)

# simplify river line to make file smaller
rio_linhacentral <- rsl |>
  select(aid, subz_id, zone, rio, secl_r, impact) |>
  st_simplify(dTolerance = 100)


# write files
st_write(rio_pontos, dsn = "inst/vector/river_sample.gpkg",
         layer = "midpoints", delete_layer = TRUE, append = TRUE)

st_write(rio_linhacentral, dsn = "inst/vector/river_sample.gpkg",
         layer = "centerline", delete_layer = TRUE, append = TRUE)
#check
st_layers("inst/vector/river_sample.gpkg")

# export
usethis::use_data(rio_pontos, overwrite = TRUE)
usethis::use_data(rio_pontos_31976, overwrite = TRUE, internal = TRUE)
usethis::use_data(rio_pontos_buff, overwrite = TRUE)
usethis::use_data(rio_linhacentral, overwrite = TRUE)


# -------------------------------------------------------------------------
# interview points.
interview_species_metrics <- read.csv("data-raw/species_interviews_forest.csv")
entrevistas <- interview_species_metrics |>
  group_by(aid, Latitude, Longitude) |>
  summarise(acount = n()) |>
  left_join(interview_species_metrics |>
              group_by(aid, Latitude, Longitude, Habitat_WWF) |>
              summarise(acount = n()) |>
              ungroup()) |>
  select(!acount) |>
  st_as_sf(coords = c("Longitude", "Latitude"), crs = 4326)

usethis::use_data(entrevistas, overwrite = TRUE)
