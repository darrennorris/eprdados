# Landscape metric around a point.

Landscape metric calculated within a series of circular buffers around a
single point along a river centerline, upstream of the Cachoeira
Caldeirão Dam, Amapá, Brazil.

Values for one metric `cpland` calculated using package
[landscapemetrics](https://r-spatialecology.github.io/landscapemetrics/).
`cpland` is the percentage of core area of class in relation to the
total landscape area. Landscape metric from
[MapBiomas](https://brasil.mapbiomas.org/) forest cover class. Metrics
are calculated within each buffer radii: 0.125, 0.25, 0.5, 1, 2, 4, 8
and 16 km.

## Usage

``` r
amostras_metrica
```

## Format

\`amostras_metrica\` is a tibble, with:

- layer:

  Identifier for raster layer.

- level:

  Level of metric.

- class:

  Cover class from landscape raster.

- id:

  identifier from landscapemetrics.

- metric:

  Metric identifier from landscapemetrics.

- value:

  Value of landscape metric.

- plot_id:

  Identifier. Buffer distance. Radius in m.

- percentage_inside:

  From landscapemetrics.

## Source

\<https://fmichalski.wixsite.com/lecov\>

## Details

Values of a landscape metric calculated around a point.

## Examples

``` r
# check data
table(amostras_metrica$raio)
#> 
#>   250   500  1000  2000  4000  8000 16000 
#>     1     2     2     2     2     2     2 
```
