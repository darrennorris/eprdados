#' Species and landscapemetrics.
#'
#' A sample of species abundances and landscapemetrics around properties.
#'
#' @description
#' Values for simulated species around rural property locations.
#' Includes landscape metrics for MapBiomas forest cover class.
#' Metrics are calculated in buffers with radius of:
#'  0.125, 0.25, 0.5, 1, 2, 4, 8 and 16 km.
#' To reduce influence of satellite image quality, the metric values are
#' median values from three years:
#'  study year, year before and year after.
#'  Values for one metric cpland calculated using package landscapemetrics.
#'  cpland is the percentage of core area of class in relation to the total landscape area.
#'
#' @format `interview_species_metrics`
#' is a dataframe, with:
#' \describe{
#'   \item{location}{Amapá, Brazil}
#'   \item{aid}{Property identifier.}
#'   \item{long}{Longitude. Decimal degrees (EPSG:4326).}
#'   \item{lat}{Latitude. Decimal degrees (EPSG:4326).}
#'   \item{metric}{Metric identifier from landscapemetrics.}
#'   \item{buff_dist_km}{Buffer distance. Radius in km.}
#'   \item{sp_name}{Identifier for simulated species.}
#'   \item{sp_ab}{Species abundances.}
#'   \item{sp_pa}{Species presence absence.}
#' }
#' @source <https://doi.org/10.1177/1940082920971747>
#'
#' @examples
#' # check data
#' table(interview_species_metrics$buff_dist_km)
"interview_species_metrics"


