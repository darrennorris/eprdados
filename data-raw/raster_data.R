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

# reclassify as binary forest cover
# Reclassificação -
# Criar uma nova camada de floresta (novo objeto de raster copiando mapbiomas_2020,
# assim para ter os mesmos coordenados, resolução e extensão)
floresta_2020 <- utm_cover_AP_rio_2020
# Todos os pixels com valor de 0
values(floresta_2020) <- 0
# Atualizar com valor de 1 quando pixels originais são de floresta (classe 3 e 4)
floresta_2020[utm_cover_AP_rio_2020==3 | utm_cover_AP_rio_2020==4] <- 1
floresta_2020 <- wrap(floresta_2020)
# export
usethis::use_data(floresta_2020, overwrite = TRUE)
