## code to prepare raster datasets goes here
library(terra)
library(usethis)

# terra::wrap so passes check and lazyload works
# small sample used in Chapter 1: Escala
amostra_mapbiomas_2020 <- rast("inst/raster/amostra_mapbiomas_2020.tif")
amostra_mapbiomas_2020 <- wrap(amostra_mapbiomas_2020)
# export
usethis::use_data(amostra_mapbiomas_2020, overwrite = TRUE)

# sample around river used in Escala and Métricas
utm_cover_AP_rio_2020 <- rast("inst/raster/utm_cover_AP_rio_2020.tif")
utm_cover_AP_rio_2020 <- wrap(utm_cover_AP_rio_2020)
# export
usethis::use_data(utm_cover_AP_rio_2020, overwrite = TRUE)
