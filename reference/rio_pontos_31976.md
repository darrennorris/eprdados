# Sample points along rivers, ESPG: 31976.

A copy of "rio_pontos" transformed to a different coordinate reference
system.

A total of 52 points are regularly spaced at approximately 5 km
intervals. Used to develop before-after control-impact analysis of dam
impacts on species including Giant Otters
(https://doi.org/10.7717/peerj.14287) and Yellow-spotted River Turtles (
https://doi.org/10.1002/aqc.3775).

- location:

  Amapá, Brazil.

- coord. ref:

  SIRGAS 2000 / UTM zone 22N (EPSG:31976).

## Usage

``` r
rio_pontos_31976
```

## Format

\`rio_pontos_31976\` is sf POINT geometry with 52 points and 8 fields,
including:

- subz_id:

  Unique identifier.

- long:

  Longitude. Decimal degrees.

- lat:

  Latitude. Decimal degrees.

- impact:

  Dam impact. 1 = yes, 0 = no.

## Source

\<https://fmichalski.wixsite.com/lecov\>

## Details

Sample points along Araguari and Falsino rivers.

## Examples

``` r
# plot to see the points
if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(rio_pontos_31976)

  plot(rio_pontos_31976["rio"])
}
```
