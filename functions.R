# libraries ----
if (!require(librarian)){
  # https://github.com/DesiQuintans/librarian/issues/21
  if (!require(remotes))
    install.packages("remotes")
  remotes::install_github("DesiQuintans/librarian")
  library(librarian)
}

shelf(
  # utility
  fs, here, glue, units,
  # tidyverse
  tibble, readr, dplyr, tidyr, purrr, stringr, lubridate, 
  # database
  DBI, RPostgres,
  # meta, web services
  yaml, rvest, jsonlite,
  # spatial
  sf, raster, leaflet,
  # widgets
  DT)
select = dplyr::select

# connect to database ----
passwd <- readLines("/share/mpatlas4r.org_password.txt")
con <- dbConnect(
  Postgres(),
  dbname   = "gis",
  host     = "postgis",
  port     = 5432,
  user     = "admin",
  password = passwd)
