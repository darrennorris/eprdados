library(usethis)
library(tidyverse)


# -------------------------------------------------------------------------
interview_species_metrics <- read.csv("data-raw/species_interviews_forest.csv")
usethis::use_data(interview_species_metrics, overwrite = TRUE)


# -------------------------------------------------------------------------
# three carnivore species: sppB = lontra, sppC = cachorro do mato, sppD = onca.
carnivoros <- interview_species_metrics |>
  filter(sp_name %in% c("sppB", "sppC", "sppD"))
usethis::use_data(carnivoros, overwrite = TRUE)

# -------------------------------------------------------------------------
# forest cover around interviews.
forest_cover_interviews <- interview_species_metrics |>
  filter(sp_name == "sppB") |>
  select(!c(sp_name, sp_ab, sp_pa))
usethis::use_data(forest_cover_interviews, overwrite = TRUE)
