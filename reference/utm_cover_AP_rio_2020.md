# A sample of MapBiomas Collection 6 data

The sample covers an area upstream of the Cachoeira Caldeirão Dam. This
area has been studied to understand dam impacts on species including
Giant Otters (https://doi.org/10.7717/peerj.14287) and Yellow-spotted
River Turtles ( https://doi.org/10.1002/aqc.3775).

## Usage

``` r
utm_cover_AP_rio_2020
```

## Format

\`utm_cover_AP_rio_2020\` is a raster with 5727 rows and 6059 columns:

- location:

  Amapá, Brazil

- coord. ref:

  SIRGAS 2000 / UTM zone 22N (EPSG:31976)

- year:

  2020

## Source

\<https://brasil.mapbiomas.org/en/\>

## Details

A subset of data from MapBiomas Collection 6 classified land cover.

## Examples

``` r
# plot to see the raster cover classes
# internal raster data needs to be read
plot(terra::rast(utm_cover_AP_rio_2020))
```
