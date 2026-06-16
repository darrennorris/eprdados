# A small sample of MapBiomas Collection 6 data

A subset of data from MapBiomas Collection 6 classified land cover.

## Usage

``` r
amostra_mapbiomas_2020
```

## Format

\`amostra_mapbiomas_2020\` is a raster with 8 rows and 9 columns:

- location:

  Amapá, Brazil

- coord. ref:

  SIRGAS 2000 / UTM zone 22N (EPSG:31976)

- year:

  2020

## Source

\<https://brasil.mapbiomas.org/en/\>

## Examples

``` r
# plot to see the raster cover classes
# internal raster data needs to be read
plot(terra::rast(amostra_mapbiomas_2020))
```
