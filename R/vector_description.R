#' Sample points along rivers.
#'
#' Sample points along Araguari and Falsino rivers.
#'
#' @description
#'
#' The sample points are along centerline of rivers upstream of the
#' Cachoeira Caldeirão Dam.
#' A total of 52 points are regularly spaced at approximately 5 km intervals.
#' Used to develop before-after control-impact analysis of dam impacts on species including
#' Giant Otters (https://doi.org/10.7717/peerj.14287) and
#' Yellow-spotted River Turtles ( https://doi.org/10.1002/aqc.3775).
#' \describe{
#'   \item{location}{Amapá, Brazil.}
#'   \item{coord. ref}{WGS 84 (EPSG:4326).}
#' }
#'
#' @format `rio_pontos`
#' is sf POINT geometry with 52 points and 8 fields, including:
#' \describe{
#'   \item{subz_id}{Unique identifier.}
#'   \item{long}{Longitude. Decimal degrees.}
#'   \item{lat}{Latitude. Decimal degrees.}
#'   \item{impact}{Dam impact. 1 = yes, 0 = no.}
#' }
#' @source <https://fmichalski.wixsite.com/lecov>
#' @importFrom sf st_read
#' @examples
#' # plot to see the points
#' plot(rio_pontos["rio"])
"rio_pontos"


#' Centerline of river channels.
#'
#' Centerline of Araguari and Falsino rivers.
#'
#' @description
#'
#' Centerline of rivers upstream of the Cachoeira Caldeirão Dam.
#' A total of 260 km of rivers, obtained from GPS tracklogs recorded
#' during boat surveys along the rivers. Rivers were divided into 52
#' sections at approximately 5 km intervals.
#' Used to develop before-after control-impact analysis of dam impacts on species including
#' Giant Otters (https://doi.org/10.7717/peerj.14287) and
#' Yellow-spotted River Turtles ( https://doi.org/10.1002/aqc.3775).
#' \describe{
#'   \item{location}{Amapá, Brazil.}
#'   \item{coord. ref}{WGS 84 (EPSG:4326).}
#' }
#'
#' @format `rio_linhacentral`
#' is a sf MULTILINESTRING geometry,
#' with 52 river sections and 6 variables, including:
#' \describe{
#'   \item{subz_id}{Unique identifier.}
#'   \item{secl_r}{Length of river section in meters.}
#'   \item{impact}{Dam impact. 1 = yes, 0 = no.}
#' }
#'
#' @source <https://fmichalski.wixsite.com/lecov>
#' @importFrom sf st_read
#' @examples
#' # plot to see the rivers
#' plot(rio_linhacentral["rio"])
#'
#' # total length of rivers (262276.4 [m])
#' sum(st_length(rio_linhacentral))
"rio_linhacentral"
