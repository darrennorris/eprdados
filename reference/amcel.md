# AMCEL plantation

Polygon of the AMCEL - Amapá Florestal e Celulose S.A. plantation
forests Amapá, Brazil.

## Format

A \`gpkg\` file with 1 layer.

- amcel:

  Polygon of the plantation.

## Examples

``` r
# \donttest{
# check layers
famcel <- system.file("vector/amcel.gpkg", package="eprdados")
st_layers(famcel)
#> Driver: GPKG 
#> Available layers:
#>   layer_name geometry_type features fields crs_name
#> 1      amcel       Polygon        1      0   WGS 84
# load polygon
amcel <- st_read(famcel, layer ="amcel")
#> Reading layer `amcel' from data source 
#>   `/home/runner/work/_temp/Library/eprdados/vector/amcel.gpkg' 
#>   using driver `GPKG'
#> Simple feature collection with 1 feature and 0 fields
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -51.36856 ymin: 0.4187048 xmax: -50.83832 ymax: 0.7990081
#> Geodetic CRS:  WGS 84
# take a look
library(mapview)
mapview(amcel)
# }
```
