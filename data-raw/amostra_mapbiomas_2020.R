## code to prepare `amostra_mapbiomas_2020` dataset

library(terra)

# MapBiomas cover map
# sample made using MapBiomas 6
filein <- "inst/raster/amostra_mapbiomas_2020.tif"
amostra_mapbiomas_2020 <- terra::rast(filein)

# Document your data (see 'https://r-pkgs.org/data.html')
usethis::use_data(amostra_mapbiomas_2020, overwrite = TRUE)
