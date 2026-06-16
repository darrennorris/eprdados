# Ferreira Gomes dam

Collection of data from around the Ferreria Gomes dam in Amapá, Brazil.

## Format

A \`gpkg\` file with 8 layers.

- fg_extensao:

  Polygon with the extension from a 32 km buffer around the reservoir.

- FG_reservatorio:

  Reservoir polyogns from ANA 2020. Massas d'Água:
  https://metadados.snirh.gov.br/files/7d054e5a-8cc9-403c-9f1a-085fd933610c/geoft_bho_massa_dagua_v2019.zip
  .

- FG_reservatorio_ANEEL:

  Reservoir polyogns from ANEEL 2023.
  https://sigel.aneel.gov.br/portal/home/index.html .

- FG_ponto:

  Dam point from ANEEL 2023.
  https://sigel.aneel.gov.br/portal/home/index.html .

## Examples

``` r
# \donttest{
# check layers
st_layers(system.file("vector/UHE_Ferreira_Gomes.gpkg", package="eprdados"))
#> Driver: GPKG 
#> Available layers:
#>              layer_name     geometry_type features fields
#> 1           fg_extensao           Polygon        1      0
#> 2              FG_ponto             Point        1     62
#> 3       FG_reservatorio           Polygon        1     51
#> 4 FG_reservatorio_ANEEL     Multi Polygon        1     18
#> 5         rivers_ne_110       Line String        1     38
#> 6         FG_curso_agua Multi Line String       43     11
#> 7     FG_curso_araguari Multi Line String        1     11
#> 8      FG_massa_de_agua           Polygon       11     51
#>                     crs_name
#> 1 SIRGAS 2000 / UTM zone 22N
#> 2 SIRGAS 2000 / UTM zone 22N
#> 3 SIRGAS 2000 / UTM zone 22N
#> 4 SIRGAS 2000 / UTM zone 22N
#> 5 SIRGAS 2000 / UTM zone 22N
#> 6 SIRGAS 2000 / UTM zone 22N
#> 7 SIRGAS 2000 / UTM zone 22N
#> 8 SIRGAS 2000 / UTM zone 22N
# load dam location
uhe_fg <- st_read(system.file("vector/UHE_Ferreira_Gomes.gpkg", package="eprdados"),
layer ="FG_ponto")
#> Reading layer `FG_ponto' from data source 
#>   `/home/runner/work/_temp/Library/eprdados/vector/UHE_Ferreira_Gomes.gpkg' 
#>   using driver `GPKG'
#> Simple feature collection with 1 feature and 62 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 478099.8 ymin: 94576.28 xmax: 478099.8 ymax: 94576.28
#> Projected CRS: SIRGAS 2000 / UTM zone 22N
# take a look
library(mapview)
mapview(uhe_fg)
# }
```
