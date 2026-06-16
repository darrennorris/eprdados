# Dams and reservoirs

Locations of four dams and the reservoirs in Amapá, Brazil.

## Format

A \`gpkg\` file with 11 layers.

- AP_reservatorios:

  Reservoir polyogns from ANA 2020. Massas d'Água:
  https://metadados.snirh.gov.br/files/7d054e5a-8cc9-403c-9f1a-085fd933610c/geoft_bho_massa_dagua_v2019.zip
  .

- AP_reservatorios_ANEEL:

  Reservoir polyogns from ANEEL 2023.
  https://sigel.aneel.gov.br/portal/home/index.html .

- AP_UHE:

  Dam poiints from ANEEL 2023.
  https://sigel.aneel.gov.br/portal/home/index.html .

## Examples

``` r
# \donttest{
# check layers
st_layers(system.file("vector/barragens.gpkg", package="eprdados"))
#> Driver: GPKG 
#> Available layers:
#>                layer_name geometry_type features fields
#> 1        AP_reservatorios       Polygon        4     51
#> 2  AP_reservatorios_ANEEL Multi Polygon        4     18
#> 3                  AP_UHE         Point        4     62
#> 4         CC_reservatorio       Polygon        1     51
#> 5                CC_ponto         Point        1     62
#> 6         CN_reservatorio       Polygon        1     51
#> 7                CN_ponto         Point        1     62
#> 8         FG_reservatorio       Polygon        1     51
#> 9                FG_ponto         Point        1     62
#> 10        SA_reservatorio       Polygon        1     51
#> 11               SA_ponto         Point        1     62
#>                      crs_name
#> 1  SIRGAS 2000 / UTM zone 22N
#> 2  SIRGAS 2000 / UTM zone 22N
#> 3  SIRGAS 2000 / UTM zone 22N
#> 4  SIRGAS 2000 / UTM zone 22N
#> 5  SIRGAS 2000 / UTM zone 22N
#> 6  SIRGAS 2000 / UTM zone 22N
#> 7  SIRGAS 2000 / UTM zone 22N
#> 8  SIRGAS 2000 / UTM zone 22N
#> 9  SIRGAS 2000 / UTM zone 22N
#> 10 SIRGAS 2000 / UTM zone 22N
#> 11 SIRGAS 2000 / UTM zone 22N
# load dam locations
uhe <- st_read(system.file("vector/barragens.gpkg", package="eprdados"), layer ="AP_UHE")
#> Reading layer `AP_UHE' from data source 
#>   `/home/runner/work/_temp/Library/eprdados/vector/barragens.gpkg' 
#>   using driver `GPKG'
#> Simple feature collection with 4 features and 62 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 331223.9 ymin: -71869.91 xmax: 478099.8 ymax: 99834.19
#> Projected CRS: SIRGAS 2000 / UTM zone 22N
# take a look
library(mapview)
mapview(uhe)
# }
```
