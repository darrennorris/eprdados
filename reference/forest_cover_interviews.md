# Forest cover landscape metrics.

Forest cover around rural property locations in Amapá, Brazil. Includes
landscape metrics for MapBiomas forest cover class.

Values for one metric `cpland` calculated using package
[landscapemetrics](https://r-spatialecology.github.io/landscapemetrics/).
`cpland` is the percentage of core area of class in relation to the
total landscape area. Landscape metric from
[MapBiomas](https://brasil.mapbiomas.org/) forest cover class. Metrics
are calculated around each property in buffers with radius of: 0.125,
0.25, 0.5, 1, 2, 4, 8 and 16 km. To reduce influence of satellite image
quality, the metric values are median values from three years: study
year, year before and year after.

## Usage

``` r
forest_cover_interviews
```

## Format

\`forest_cover_interviews\` is a dataframe, with:

- aid:

  Property identifier.

- long:

  Longitude. Decimal degrees (EPSG:4326).

- lat:

  Latitude. Decimal degrees (EPSG:4326).

- Habitat_WWF:

  Terrestrial ecoregion.
  https://doi.org/10.1641/0006-3568(2001)051\[0933:TEOTWA\]2.0.CO;2

- metric:

  Metric identifier from landscapemetrics.

- buff_dist_km:

  Buffer distance. Radius in km.

- value_median:

  Median value of landscape metric.

## Source

\<https://doi.org/10.1177/1940082920971747\>

## Details

A subset of forest cover landscape metrics around properties.

## References

Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D.
(2020). Rural wage-earners’ attitudes towards diverse wildlife groups
differ between tropical ecoregions: implications for forest and savanna
conservation in the Brazilian Amazon. Tropical Conservation Science, 13,
https://doi.org/10.1177/1940082920971747.

## Examples

``` r
# check data. 106 properties and 8 buffer distances.
table(forest_cover_interviews$buff_dist_km)
#> 
#> 0.125  0.25   0.5     1     2     4     8    16 
#>   106   106   106   106   106   106   106   106 
```
