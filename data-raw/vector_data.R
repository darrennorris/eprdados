## code to prepare vector datasets goes here
library(tidyverse)
library(sf)
library(terra)
library(landscapemetrics)
library(rnaturalearth)
library(rnaturalearthdata)
library(usethis)

# GPKG with river center line and sample points used in Métricas
mypath <- "yourpathhere"
#mypath <- "C:\\Users\\user\\Documents\\Articles\\gis_layers\\gisdata\\inst\\vector\\rivers.gpkg"
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
  group_by(aid, Latitude, Longitude, Habitat_WWF) |>
              summarise(acount = n()) |>
              ungroup() |>
  select(!acount) |>
  st_as_sf(coords = c("Longitude", "Latitude"),
           crs = 4326,
           agr = c(aid = "identity", Habitat_WWF = "constant")
           )

usethis::use_data(entrevistas, overwrite = TRUE)

# To make barragens.gpkg -------------------------------------------
#
# Packages
library(tidyverse)
library(sf)

# 1 reservoirs
filemassa <- "C:\\Users\\user\\Documents\\CA\\CA_2023\\EP\\vectors\\geoft_bho_massa_dagua_v2019\\geoft_bho_massa_dagua_v2019.shp"
AP_res_31976 <- read_sf(filemassa) |>
  filter(detipomass=="Artificial") |>
  filter(nmufe %in% c("AMAPÁ", "AMAPÁ, PARÁ"),
         nmgenerico == "UHE") |>
  st_transform(31976) |>
  st_make_valid()
# ANEEL. Correct geometry in QGIS.
# Drop Z dimension so is valid
fileres <- "C:\\Users\\user\\Documents\\rbooks\\epr\\data\\vector\\AP_reserv_ANEEL\\reserv_fixed_geom.shp"
AP_res_ANEEL_31976 <- st_read(fileres) |>
  st_transform(31976) |>
  st_zm()
# simplify to make smaller
res_simple <- AP_res_ANEEL_31976 |>
  st_simplify(preserveTopology = TRUE, dTolerance = 10) |>
  st_cast("MULTIPOLYGON")
# 2 Barragens
# dados de
# ANEEL (SIGEL) Aproveitamento Hidrelétricos - AHE:
# <https://sigel.aneel.gov.br/portal/home/index.html>
# "C:\\Users\\user\\Documents\\rbooks\\epr\\
bin <- "C:\\Users\\user\\Documents\\rbooks\\epr\\data\\vector\\AHE\\Aproveitamento_Hidrelétricos_-_AHE.shp"
ahe <- read_sf(bin)
AP_UHE_31976 <- ahe |>
  filter(UF_1 == "AP",
         TIPO_AHE == "UHE",
         FASE == "Operação") |>
  st_transform(31976)

#3 Make vector data
# write files
st_write(AP_res_31976,
         dsn = "inst/vector/barragens.gpkg",
         layer = "AP_reservatorios", delete_layer = TRUE,
         append = TRUE)
st_write(res_simple,
         dsn = "inst/vector/barragens.gpkg",
         layer = "AP_reservatorios_ANEEL", delete_layer = TRUE,
         append = TRUE)
# UHE barragens
st_write(AP_UHE_31976,
         dsn = "inst/vector/barragens.gpkg",
         layer = "AP_UHE", delete_layer = TRUE,
         append = TRUE)

# Cachoeira Caldeirão
AP_res_31976 |>
  filter(nmoriginal == "UHE Cachoeira Caldeirão") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "CC_reservatorio", delete_layer = TRUE,
           append = TRUE)
AP_UHE_31976 |>
  filter(NOME == "Cachoeira Caldeirão") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "CC_ponto", delete_layer = TRUE,
           append = TRUE)

# Coaracy Nunes
AP_res_31976 |>
  filter(nmoriginal == "UHE Coaracy Nunes") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "CN_reservatorio", delete_layer = TRUE,
           append = TRUE)
AP_UHE_31976 |>
  filter(NOME == "Coaracy Nunes") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "CN_ponto", delete_layer = TRUE,
           append = TRUE)
# Ferreria Gomes
st_write(res_ferreira_gomes,
         dsn = "inst/vector/barragens.gpkg",
         layer = "FG_reservatorio", delete_layer = TRUE,
         append = TRUE)
AP_UHE_31976 |>
  filter(NOME == "Ferreira Gomes") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "FG_ponto", delete_layer = TRUE,
           append = TRUE)

# Santo Antônio do Jari
AP_res_31976 |>
  filter(nmoriginal == "UHE Santo Antônio do Jari") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "SA_reservatorio", delete_layer = TRUE,
           append = TRUE)
AP_UHE_31976 |>
  filter(NOME == "Santo Antônio do Jari") |>
  st_write(dsn = "inst/vector/barragens.gpkg",
           layer = "SA_ponto", delete_layer = TRUE,
           append = TRUE)

# To make layers for Ferreira Gomes ---------------------------------
# Study area extent.
rfile <- "C:\\Users\\user\\Documents\\rbooks\\epr\\data\\raster\\mapbiomas\\utm_cover_UHEFerreiraGomes_85a22.tif"
r85a22 <- rast(rfile)
fg_ext <- st_as_sf(as.polygons(ext(r85a22), crs = crs(r85a22)))

# Main river in study area.
rivers110 <- ne_download(scale = 10,
                         type = 'rivers_lake_centerlines',
                         category = 'physical',
                         returnclass = "sf"
) |>
  st_transform(31976)
rivers_cropped <- st_crop(rivers110, st_bbox(fg_ext))

# Dam point
FG_ponto <- st_read(system.file("vector/barragens.gpkg",
                                package="eprdados"),
                    layer ="FG_ponto")
# Reservoir ANA
FG_reservatorio <- st_read(system.file("vector/barragens.gpkg",
                                       package="eprdados"),
                           layer ="AP_reservatorios") |>
  filter(nmoriginal == "UHE Ferreira Gomes")
# Reservoir ANEEL
FG_reservatorio_ANEEL <- st_read(system.file("vector/barragens.gpkg",
                                       package="eprdados"),
                           layer ="AP_reservatorios_ANEEL") |>
  filter(USINA == "Ferreira Gomes")

# water cover
filemassa <- "C:\\Users\\user\\Documents\\CA\\CA_2023\\EP\\vectors\\geoft_bho_massa_dagua_v2019\\geoft_bho_massa_dagua_v2019.shp"
AP_massa_31976 <- read_sf(filemassa) |>
  filter(nmufe %in% c("AMAPÁ", "AMAPÁ, PARÁ")) |>
  st_transform(31976) |>
  st_make_valid()

FG_massa_de_agua <- st_crop(AP_massa_31976, st_bbox(fg_ext))

# Water course
fcurso <- "C:\\Users\\user\\Documents\\CA\\CA_2023\\EP\\vectors\\geoft_bho_2017_50k_curso_dagua.gpkg"
curso_31976 <- read_sf(fcurso) |>
  st_transform(31976)
FG_curso_agua <- st_crop(curso_31976, st_bbox(fg_ext)) |>
  st_cast("MULTILINESTRING")
FG_curso_araguari <- FG_curso_agua |>
  filter(nuordemcda == 1, cocursodag == 398)

# write files
st_write(fg_ext,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "fg_extensao", delete_layer = TRUE,
         append = TRUE)
st_write(FG_ponto,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "FG_ponto", delete_layer = TRUE,
         append = TRUE)
st_write(FG_reservatorio,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "FG_reservatorio", delete_layer = TRUE,
         append = TRUE)
st_write(FG_reservatorio_ANEEL,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "FG_reservatorio_ANEEL", delete_layer = TRUE,
         append = TRUE)
st_write(rivers_cropped,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "rivers_ne_110", delete_layer = TRUE,
         append = TRUE)
st_write(FG_curso_agua,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "FG_curso_agua", delete_layer = TRUE,
         append = TRUE)
st_write(FG_curso_araguari,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "FG_curso_araguari", delete_layer = TRUE,
         append = TRUE)
st_write(FG_massa_de_agua,
         dsn = "inst/vector/UHE_Ferreira_Gomes.gpkg",
         layer = "FG_massa_de_agua", delete_layer = TRUE,
         append = TRUE)
st_layers("inst/vector/UHE_Ferreira_Gomes.gpkg")
