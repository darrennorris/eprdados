# MapBiomas Collection 6 forest cover.

The sample covers an area upstream of the Cachoeira Caldeirão Dam. This
area has been studied to understand dam impacts on species including
Giant Otters (https://doi.org/10.7717/peerj.14287) and Yellow-spotted
River Turtles ( https://doi.org/10.1002/aqc.3775).

## Usage

``` r
floresta_2020
```

## Format

\`floresta_2020\` Is a binary reclassification of utm_cover_AP_rio_2020.
Is a raster where values of 1 include both forest and savanna
formations. The raster has 5727 rows and 6059 columns:

- location:

  Amapá, Brazil

- coord. ref:

  SIRGAS 2000 / UTM zone 22N (EPSG:31976)

- year:

  2020

## Source

\<https://brasil.mapbiomas.org/en/\>

## Details

A reclassified subset of data from MapBiomas Collection 6.

## Examples

``` r
# plot to see the raster cover classes
# internal raster data needs to be read
plot(terra::rast(floresta_2020))
```
