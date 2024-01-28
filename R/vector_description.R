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

#' Sample points along rivers, ESPG: 31976.
#'
#' Sample points along Araguari and Falsino rivers.
#'
#' @description
#'
#' A copy of "rio_pontos" transformed to a different coordinate reference system.
#'
#' A total of 52 points are regularly spaced at approximately 5 km intervals.
#' Used to develop before-after control-impact analysis of dam impacts on species including
#' Giant Otters (https://doi.org/10.7717/peerj.14287) and
#' Yellow-spotted River Turtles ( https://doi.org/10.1002/aqc.3775).
#' \describe{
#'   \item{location}{Amapá, Brazil.}
#'   \item{coord. ref}{SIRGAS 2000 / UTM zone 22N (EPSG:31976).}
#' }
#'
#' @format `rio_pontos_31976`
#' is sf POINT geometry with 52 points and 8 fields, including:
#' \describe{
#'   \item{subz_id}{Unique identifier.}
#'   \item{long}{Longitude. Decimal degrees.}
#'   \item{lat}{Latitude. Decimal degrees.}
#'   \item{impact}{Dam impact. 1 = yes, 0 = no.}
#' }
#' @source <https://fmichalski.wixsite.com/lecov>
#' @examples
#' # plot to see the points
#' if (requireNamespace("sf", quietly = TRUE)) {
#'   library(sf)
#'   data(rio_pontos_31976)
#'
#'   plot(rio_pontos_31976["rio"])
#' }
"rio_pontos_31976"

#' Buffers around sample point along rivers.
#'
#' Buffers around a sample point along the Araguari river.
#
#' @description
#'
#' Circular buffers around a sample point along centerline of rivers upstream of the
#' Cachoeira Caldeirão Dam.
#' A total of 7 buffers with different radii.
#' \describe{
#'   \item{location}{Amapá, Brazil.}
#'   \item{coord. ref}{WGS 84 (EPSG:4326).}
#' }
#'
#' @format `rio_pontos_buff`
#' is sf POLYGON geometry with 7 polygons and 9 fields, including:
#' \describe{
#'   \item{subz_id}{Unique identifier.}
#'   \item{long}{Longitude. Decimal degrees.}
#'   \item{lat}{Latitude. Decimal degrees.}
#'   \item{impact}{Dam impact. 1 = yes, 0 = no.}
#'   \item{raio}{Radius around point in meters.}
#' }
#' @source <https://fmichalski.wixsite.com/lecov>
#' @importFrom sf st_read
#' @examples
#' # plot to see the points
#' plot(rio_pontos_buff["raio"])
#'
#' # visualize overlapping buffers with ggplot2
#' library(ggplot2)
#' rio_pontos_buff |>
#' # Arrange according to radius attribute in descending order
#' dplyr::arrange(desc(raio)) |>
#' # Make ggplot and set fill color to radius
#' ggplot(aes(fill = raio)) +
#' geom_sf()
"rio_pontos_buff"

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


#' Interview locations.
#'
#' Location of 106 interviews.
#'
#' @description
#'
#' Point locations of 106 rural properties in Amapá, Brazil.
#'
#' @format `entrevistas`
#' is a sf POINT geometry,
#' with 106 locations and 2 variables:
#' \describe{
#'   \item{aid}{Unique identifier.}
#'   \item{Habitat_WWF}{Terrestrial ecoregion. https://doi.org/10.1641/0006-3568(2001)051[0933:TEOTWA]2.0.CO;2}
#' }
#'
#' @references
#' Michalski, F., Boulhosa, R. L. P., Nascimento, Y. N. D., & Norris, D. (2020).
#' Rural wage-earners’ attitudes towards diverse wildlife groups differ between tropical ecoregions:
#' implications for forest and savanna conservation in the Brazilian Amazon.
#' Tropical Conservation Science, 13, https://doi.org/10.1177/1940082920971747.
#'
#' @source <https://fmichalski.wixsite.com/lecov>
#' @importFrom sf st_read
#' @examples
#' # check data. 106 properties and 2 ecoregions.
#' table(entrevistas$Habitat_WWF)
"entrevistas"


#' Dams and reservoirs
#'
#' Locations of four dams and the reservoirs in Amapá, Brazil.
#' @format A `gpkg` file with 11 layers.
#' \describe{
#'   \item{AP_reservatorios}{Reservoir polyogns from ANA 2020. Massas d'Água: https://metadados.snirh.gov.br/files/7d054e5a-8cc9-403c-9f1a-085fd933610c/geoft_bho_massa_dagua_v2019.zip .}
#'   \item{AP_reservatorios_ANEEL}{Reservoir polyogns from ANEEL 2023. https://sigel.aneel.gov.br/portal/home/index.html .}
#'   \item{AP_UHE}{Dam poiints from ANEEL 2023. https://sigel.aneel.gov.br/portal/home/index.html .}
#' }
#' @name barragens
#' @docType data
#' @examples
#' \donttest{
#' # check layers
#' st_layers(system.file("vector/barragens.gpkg", package="eprdados"))
#' # load dam locations
#' uhe <- st_read(system.file("vector/barragens.gpkg", package="eprdados"), layer ="AP_UHE")
#' # take a look
#' library(mapview)
#' mapview(uhe)
#' }
NULL


#' Ferreira Gomes dam
#'
#' Collection of data from around the Ferreria Gomes dam in Amapá, Brazil.
#' @format A `gpkg` file with 8 layers.
#' \describe{
#'    \item{fg_extensao}{Polygon with the extension from a 32 km buffer around the reservoir.}
#'   \item{FG_reservatorio}{Reservoir polyogns from ANA 2020. Massas d'Água: https://metadados.snirh.gov.br/files/7d054e5a-8cc9-403c-9f1a-085fd933610c/geoft_bho_massa_dagua_v2019.zip .}
#'   \item{FG_reservatorio_ANEEL}{Reservoir polyogns from ANEEL 2023. https://sigel.aneel.gov.br/portal/home/index.html .}
#'   \item{FG_ponto}{Dam point from ANEEL 2023. https://sigel.aneel.gov.br/portal/home/index.html .}
#' }
#' @name UHE_Ferreira_Gomes
#' @docType data
#' @examples
#' \donttest{
#' # check layers
#' st_layers(system.file("vector/UHE_Ferreira_Gomes.gpkg", package="eprdados"))
#' # load dam location
#' uhe_fg <- st_read(system.file("vector/UHE_Ferreira_Gomes.gpkg", package="eprdados"),
#' layer ="FG_ponto")
#' # take a look
#' library(mapview)
#' mapview(uhe_fg)
#' }
NULL

#' AMCEL plantation
#'
#' Polygon of the AMCEL - Amapá Florestal e Celulose S.A. plantation forests Amapá, Brazil.
#' @format A `gpkg` file with 1 layer.
#' \describe{
#'    \item{amcel}{Polygon of the plantation.}
#' }
#' @name amcel
#' @docType data
#' @examples
#' \donttest{
#' # check layers
#' famcel <- system.file("vector/amcel.gpkg", package="eprdados")
#' st_layers(famcel)
#' # load polygon
#' amcel <- st_read(famcel, layer ="amcel")
#' # take a look
#' library(mapview)
#' mapview(amcel)
#' }
NULL
