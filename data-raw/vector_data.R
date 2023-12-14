## code to prepare vector datasets goes here
library(tidyverse)
library(sf)
library(usethis)

# GPKG with river center line and sample points used in Métricas
mypath <- "yourpathhere"
# mypath <- "C:\\Users\\user\\Documents\\Articles\\gis_layers\\gisdata\\inst\\vector\\rivers.gpkg"
# subzone midpoints
rsm <- sf::st_read(mypath, layer = "midpoints")
# linha central de rios
rsl <- sf::st_read(mypath, layer = "centerline")

rio_pontos <- rsm |>
  select(aid, subz_id, long, lat, zone, rio, secl_r, impact)
# simplify to make smaller
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
usethis::use_data(rio_linhacentral, overwrite = TRUE)
