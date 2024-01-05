library(usethis)
library(tidyverse)
library(terra)
library(sf)
library(landscapemetrics)


# -------------------------------------------------------------------------
interview_species_metrics <- read.csv("data-raw/species_interviews_forest.csv")
usethis::use_data(interview_species_metrics, overwrite = TRUE)


# -------------------------------------------------------------------------
# three carnivore species: sppB = lontra, sppC = cachorro do mato, sppD = onca.
carnivoros <- interview_species_metrics |>
  filter(sp_name %in% c("sppB", "sppC", "sppD"))
usethis::use_data(carnivoros, overwrite = TRUE)

# -------------------------------------------------------------------------
# forest cover around interviews.
forest_cover_interviews <- interview_species_metrics |>
  filter(sp_name == "sppB") |>
  select(!c(sp_name, sp_ab, sp_pa))
usethis::use_data(forest_cover_interviews, overwrite = TRUE)

# -------------------------------------------------------------------------
# landscape metrics around a point.
# buffers around sample points
# GPKG with river center line and sample points used in Métricas
mypath <- "yourpathhere"
mypath <- "C:\\Users\\user\\Documents\\Articles\\gis_layers\\gisdata\\inst\\vector\\rivers.gpkg"
# subzone midpoints
rsm <- sf::st_read(mypath, layer = "midpoints")
rio_pontos_31976 <- rsm |>
  select(aid, subz_id, long, lat, zone, rio, secl_r, impact) |>
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
)
# binary raster
utm_cover_AP_rio_2020 <- rast("inst/raster/utm_cover_AP_rio_2020.tif")
floresta_2020 <- utm_cover_AP_rio_2020
# Todos os pixels com valor de 0
values(floresta_2020) <- 0
# Atualizar com valor de 1 quando pixels originais são de floresta (classe 3 e 4)
floresta_2020[utm_cover_AP_rio_2020==3 | utm_cover_AP_rio_2020==4] <- 1
# calculate landscapemetrics
amostras_metrica <- sample_lsm(floresta_2020,
                               y = rio_pontos_buff,
                               plot_id = data.frame(rio_pontos_buff)[, "raio"],
                               metric = "cpland")
# export
usethis::use_data(amostras_metrica, overwrite = TRUE)
