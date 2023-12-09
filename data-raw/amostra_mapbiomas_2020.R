## code to prepare `amostra_mapbiomas_2020` dataset

library(terra)
library(sf)

# link to MapBiomas cover map
filein <- "E:\\mapbiomas\\brasil_coverage_2020.tif"
mapbiomas_2020 <- rast(filein)

# point
pt1 <- st_point(c(-51.400312, 0.726236))
d <- data.frame(sample_point = "rio")
d$geom <- st_sfc(pt1)
point_sf <- st_as_sf(d, crs = st_crs(mapbiomas_2020))
buff_point <- st_buffer(point_sf, 150)

amostra_mapbiomas_2020 <- terra::crop(mapbiomas_2020,
                                      buff_point, snap = "out")
# Document your data (see 'https://r-pkgs.org/data.html')
usethis::use_data(amostra_mapbiomas_2020, overwrite = TRUE)
