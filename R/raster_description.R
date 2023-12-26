#' A small sample of MapBiomas Collection 6 data
#'
#' A subset of data from MapBiomas Collection 6 classified land cover.
#'
#' @format `amostra_mapbiomas_2020`
#' is a raster with 8 rows and 9 columns:
#' \describe{
#'   \item{location}{Amapá, Brazil}
#'   \item{coord. ref}{SIRGAS 2000 / UTM zone 22N (EPSG:31976)}
#'   \item{year}{2020}
#' }
#' @source <https://brasil.mapbiomas.org/en/>
#' @importFrom terra wrap
#' @examples
#' # plot to see the raster cover classes
#' # internal raster data needs to be read
#' plot(terra::rast(amostra_mapbiomas_2020))
"amostra_mapbiomas_2020"


#' A sample of MapBiomas Collection 6 data
#'
#' A subset of data from MapBiomas Collection 6 classified land cover.
#'
#' @description
#' The sample covers an area upstream of the Cachoeira Caldeirão Dam.
#' This area has been studied to understand dam impacts on species including
#' Giant Otters (https://doi.org/10.7717/peerj.14287) and
#' Yellow-spotted River Turtles ( https://doi.org/10.1002/aqc.3775).
#'
#' @format `utm_cover_AP_rio_2020`
#' is a raster with 5727 rows and 6059 columns:
#' \describe{
#'   \item{location}{Amapá, Brazil}
#'   \item{coord. ref}{SIRGAS 2000 / UTM zone 22N (EPSG:31976)}
#'   \item{year}{2020}
#' }
#' @source <https://brasil.mapbiomas.org/en/>
#' @importFrom terra wrap
#' @examples
#' # plot to see the raster cover classes
#' # internal raster data needs to be read
#' plot(terra::rast(utm_cover_AP_rio_2020))
"utm_cover_AP_rio_2020"
