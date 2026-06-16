# Interview locations.

Point locations of 106 rural properties in Amapá, Brazil.

## Usage

``` r
entrevistas
```

## Format

\`entrevistas\` is a sf POINT geometry, with 106 locations and 2
variables:

- aid:

  Unique identifier.

- Habitat_WWF:

  Terrestrial ecoregion.
  https://doi.org/10.1641/0006-3568(2001)051\[0933:TEOTWA\]2.0.CO;2

## Source

\<https://fmichalski.wixsite.com/lecov\>

## Details

Location of 106 interviews.

## References

Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D.
(2020). Rural wage-earners’ attitudes towards diverse wildlife groups
differ between tropical ecoregions: implications for forest and savanna
conservation in the Brazilian Amazon. Tropical Conservation Science, 13,
https://doi.org/10.1177/1940082920971747.

## Examples

``` r
# check data. 106 properties and 2 ecoregions.
table(entrevistas$Habitat_WWF)
#> 
#>  Cerrado Floresta 
#>       41       65 
```
