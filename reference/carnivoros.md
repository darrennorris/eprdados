# Carnivore species and landscape metrics.

Values for simulated species around rural property locations in Amapá,
Brazil.

Abundances and presence absence of 3 carnivore species simulated using
package [virtualspecies](https://github.com/Farewe/virtualspecies) . The
three species have contrasting responses to forest cover. The response
patterns follow those known for carnivore species (Michalski & Peres
2005).

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
carnivoros
```

## Format

\`carnivoros\` is a dataframe, with:

- aid:

  Property identifier.

- long:

  Longitude. Decimal degrees (EPSG:4326).

- lat:

  Latitude. Decimal degrees (EPSG:4326).

- lat:

  Habitat_WWF. Terrestrial ecoregion.
  https://doi.org/10.1641/0006-3568(2001)051\[0933:TEOTWA\]2.0.CO;2

- metric:

  Metric identifier from landscapemetrics.

- buff_dist_km:

  Buffer distance. Radius in km.

- value_median:

  Median value of landscape metric.

- sp_name:

  Identifier for simulated species.

- sp_ab:

  Species abundances.

- sp_pa:

  Species presence absence.

## Source

\<https://doi.org/10.1177/1940082920971747\>

## Details

A subset of three carnivore species abundances and landscape metrics
around properties.

## References

Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D.
(2020). Rural wage-earners’ attitudes towards diverse wildlife groups
differ between tropical ecoregions: implications for forest and savanna
conservation in the Brazilian Amazon. Tropical Conservation Science, 13,
https://doi.org/10.1177/1940082920971747.

Michalski, F., & Peres, C. A. (2005). Anthropogenic determinants of
primate and carnivore local extinctions in a fragmented forest landscape
of southern Amazonia. Biological conservation, 124(3), 383-396.
https://doi.org/10.1016/j.biocon.2005.01.045

## Examples

``` r
# check data. 3 species x 106 properties = 318
table(carnivoros$buff_dist_km)
#> 
#> 0.125  0.25   0.5     1     2     4     8    16 
#>   318   318   318   318   318   318   318   318 
# check data. 106 properties x 8 buffer distances = 848
table(carnivoros$sp_name)
#> 
#> sppB sppC sppD 
#>  848  848  848 
```
