install.packages("jsonlite")
install.packages(c("devtools"), dependencies=TRUE, repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com"))
devtools::install_github(repo = "FantasyFootballAnalytics/ffanalytics", build_vignettes = TRUE)
library("ffanalytics")
library("jsonlite")

# get arguments of cli
args <- commandArgs(trailingOnly = TRUE)
 
# arguments to JSON
json <- fromJSON(args)

season <- json$season
week <- json$week

my_scrape <- scrape_data(src = c("CBS", "ESPN", "Yahoo"),
                        pos = c("K", "DST"), season = season, week = week)

my_projections <- projections_table(my_scrape)

my_projections <- my_projections %>% add_ecr() %>% add_risk() %>%
                 add_adp() %>% add_aav()

my_projections <- my_projections %>% add_player_info()

json_projections <- toJSON(my_projections, pretty = TRUE)

print(json_projections)

