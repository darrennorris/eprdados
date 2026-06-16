# Centerline of river channels.

Centerline of rivers upstream of the Cachoeira Caldeirão Dam. A total of
260 km of rivers, obtained from GPS tracklogs recorded during boat
surveys along the rivers. Rivers were divided into 52 sections at
approximately 5 km intervals. Used to develop before-after
control-impact analysis of dam impacts on species including Giant Otters
(https://doi.org/10.7717/peerj.14287) and Yellow-spotted River Turtles (
https://doi.org/10.1002/aqc.3775).

- location:

  Amapá, Brazil.

- coord. ref:

  WGS 84 (EPSG:4326).

## Usage

``` r
rio_linhacentral
```

## Format

\`rio_linhacentral\` is a sf MULTILINESTRING geometry, with 52 river
sections and 6 variables, including:

- subz_id:

  Unique identifier.

- secl_r:

  Length of river section in meters.

- impact:

  Dam impact. 1 = yes, 0 = no.

## Source

\<https://fmichalski.wixsite.com/lecov\>

## Details

Centerline of Araguari and Falsino rivers.

## Examples

``` r
# plot to see the rivers
plot(rio_linhacentral["rio"])


# total length of rivers (262276.4 [m])
sum(st_length(rio_linhacentral))
#> 262276.4 [m]
```
