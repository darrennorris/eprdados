#' Species and landscape metrics.
#'
#' A sample of species abundances and landscape metrics around properties.
#'
#' @description
#' Values for simulated species around rural property locations in Amapá, Brazil.
#'
#' Abundances and presence absence of 11 species simulated using package \href{virtualspecies}{https://github.com/Farewe/virtualspecies} .
#' The species have contrasting responses to forest cover.
#' The response patterns follow those known for primate and carnivore species (Michalski & Peres 2005; Michalski & Peres 2007).
#'
#' Values for one metric \code{cpland} calculated using package  \href{https://r-spatialecology.github.io/landscapemetrics/}{landscapemetrics}.
#' \code{cpland} is the percentage of core area of class in relation to the total landscape area.
#' Landscape metric from \href{https://brasil.mapbiomas.org/}{MapBiomas} forest cover class.
#' Metrics are calculated around each property in buffers with radius of:
#'  0.125, 0.25, 0.5, 1, 2, 4, 8 and 16 km. To reduce influence of satellite
#'  image quality, the metric values are median values from three years:
#'  study year, year before and year after.
#'
#' @format `interview_species_metrics`
#' is a dataframe, with:
#' \describe{
#'   \item{aid}{Property identifier.}
#'   \item{long}{Longitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Latitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Habitat_WWF. Terrestrial ecoregion. https://doi.org/10.1641/0006-3568(2001)051[0933:TEOTWA]2.0.CO;2}
#'   \item{metric}{Metric identifier from landscapemetrics.}
#'   \item{buff_dist_km}{Buffer distance. Radius in km.}
#'   \item{value_median}{Median value of landscape metric.}
#'   \item{sp_name}{Identifier for simulated species.}
#'   \item{sp_ab}{Species abundances.}
#'   \item{sp_pa}{Species presence absence.}
#' }
#' @source <https://doi.org/10.1177/1940082920971747>
#'
#' @references
#' Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D. (2020).
#' Rural wage-earners’ attitudes towards diverse wildlife groups differ between tropical ecoregions:
#' implications for forest and savanna conservation in the Brazilian Amazon.
#' Tropical Conservation Science, 13, https://doi.org/10.1177/1940082920971747
#'
#' Michalski, F., & Peres, C. A. (2007).
#' Disturbance‐mediated mammal persistence and abundance‐area relationships in Amazonian forest fragments.
#' Conservation Biology, 21(6), 1626-1640. https://doi.org/10.1111/j.1523-1739.2007.00797.x
#'
#' Michalski, F., & Peres, C. A. (2005).
#' Anthropogenic determinants of primate and carnivore local extinctions in a fragmented forest landscape of southern Amazonia.
#' Biological conservation, 124(3), 383-396. https://doi.org/10.1016/j.biocon.2005.01.045
#'
#' @examples
#' # check data
#' table(interview_species_metrics$buff_dist_km)
#' table(interview_species_metrics$sp_name)
"interview_species_metrics"

#' Carnivore species and landscape metrics.
#'
#' A subset of three carnivore species abundances and landscape metrics around properties.
#'
#' @description
#' Values for simulated species around rural property locations in Amapá, Brazil.
#'
#' Abundances and presence absence of 3 carnivore species simulated using package \href{virtualspecies}{https://github.com/Farewe/virtualspecies}.
#' The three species have contrasting responses to forest cover.
#' The response patterns follow those known for carnivore species (Michalski & Peres 2005).
#'
#' Values for one metric \code{cpland} calculated using package  \href{https://r-spatialecology.github.io/landscapemetrics/}{landscapemetrics}.
#' \code{cpland} is the percentage of core area of class in relation to the total landscape area.
#' Landscape metric from \href{https://brasil.mapbiomas.org/}{MapBiomas} forest cover class.
#' Metrics are calculated around each property in buffers with radius of:
#'  0.125, 0.25, 0.5, 1, 2, 4, 8 and 16 km. To reduce influence of satellite
#'  image quality, the metric values are median values from three years:
#'  study year, year before and year after.
#'
#' @format `carnivoros`
#' is a dataframe, with:
#' \describe{
#'   \item{aid}{Property identifier.}
#'   \item{long}{Longitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Latitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Habitat_WWF. Terrestrial ecoregion. https://doi.org/10.1641/0006-3568(2001)051[0933:TEOTWA]2.0.CO;2}
#'   \item{metric}{Metric identifier from landscapemetrics.}
#'   \item{buff_dist_km}{Buffer distance. Radius in km.}
#'   \item{value_median}{Median value of landscape metric.}
#'   \item{sp_name}{Identifier for simulated species.}
#'   \item{sp_ab}{Species abundances.}
#'   \item{sp_pa}{Species presence absence.}
#' }
#' @source <https://doi.org/10.1177/1940082920971747>
#'
#' @references
#' Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D. (2020).
#' Rural wage-earners’ attitudes towards diverse wildlife groups differ between tropical ecoregions:
#' implications for forest and savanna conservation in the Brazilian Amazon.
#' Tropical Conservation Science, 13, https://doi.org/10.1177/1940082920971747.
#'
#' Michalski, F., & Peres, C. A. (2005).
#' Anthropogenic determinants of primate and carnivore local extinctions in a fragmented forest landscape of southern Amazonia.
#' Biological conservation, 124(3), 383-396. https://doi.org/10.1016/j.biocon.2005.01.045
#'
#' @examples
#' # check data. 3 species x 106 properties = 318
#' table(carnivoros$buff_dist_km)
#' # check data. 106 properties x 8 buffer distances = 848
#' table(carnivoros$sp_name)
"carnivoros"


#' Forest cover landscape metrics.
#'
#' A subset of forest cover landscape metrics around properties.
#'
#' @description
#' Forest cover around rural property locations in Amapá, Brazil.
#' Includes landscape metrics for MapBiomas forest cover class.
#'
#' Values for one metric \code{cpland} calculated using package  \href{https://r-spatialecology.github.io/landscapemetrics/}{landscapemetrics}.
#' \code{cpland} is the percentage of core area of class in relation to the total landscape area.
#' Landscape metric from \href{https://brasil.mapbiomas.org/}{MapBiomas} forest cover class.
#' Metrics are calculated around each property in buffers with radius of:
#'  0.125, 0.25, 0.5, 1, 2, 4, 8 and 16 km. To reduce influence of satellite
#'  image quality, the metric values are median values from three years:
#'  study year, year before and year after.
#'
#' @format `forest_cover_interviews`
#' is a dataframe, with:
#' \describe{
#'   \item{aid}{Property identifier.}
#'   \item{long}{Longitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Latitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Habitat_WWF. Terrestrial ecoregion. https://doi.org/10.1641/0006-3568(2001)051[0933:TEOTWA]2.0.CO;2}
#'   \item{metric}{Metric identifier from landscapemetrics.}
#'   \item{buff_dist_km}{Buffer distance. Radius in km.}
#'   \item{value_median}{Median value of landscape metric.}
#' }
#' @source <https://doi.org/10.1177/1940082920971747>
#'
#' @references
#' Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D. (2020).
#' Rural wage-earners’ attitudes towards diverse wildlife groups differ between tropical ecoregions:
#' implications for forest and savanna conservation in the Brazilian Amazon.
#' Tropical Conservation Science, 13, https://doi.org/10.1177/1940082920971747.
#'
#' @examples
#' # check data. 106 properties and 8 buffer distances.
#' table(forest_cover_interviews$buff_dist_km)
"forest_cover_interviews"
