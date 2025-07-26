library(tidyverse)
library(glue)
library(lubridate)
library(arrow)
statichouselink <- "https://intro-datascience.s3.us-east-2.amazonaws.com/SC-data/static_house_info.parquet"
desclink <- "https://intro-datascience.s3.us-east-2.amazonaws.com/SC-data/data_dictionary.csv"
houseData <- read_parquet(statichouselink)
descData <- read_csv(desclink)


get_house_data <- function (id, county) {
  energy <- glue("https://intro-datascience.s3.us-east-2.amazonaws.com/SC-data/2023-houseData/{id}.parquet")
  energydata <- read_parquet(energy) %>% 
    filter(month(time) == 7)
  weather <- glue("https://intro-datascience.s3.us-east-2.amazonaws.com/SC-data/weather/2023-weather-data/{county}.csv")
  weatherdata <- read_csv(weather) %>% 
    filter(month(date_time) == 7)
  energy_weather <- inner_join(energydata, weatherdata, by = c("time" = "date_time"))
  full_data <- merge(houseData %>% filter(houseData$bldg_id == id), energy_weather)
}

statichouselink <- "https://intro-datascience.s3.us-east-2.amazonaws.com/SC-data/static_house_info.parquet"
houseData <- read_parquet(statichouselink)
get_mult_house_data <- function() {
  house_data_list <- list()
  for (i in seq_len(nrow(houseData))) {
    bldg_id <- houseData[i, "bldg_id"]
    in_county <- houseData[i, "in.county"]
    house_data <- get_house_data(bldg_id, in_county)
    house_data_list[[i]] <- house_data
  }
  combined_data <- bind_rows(house_data_list)
  return(combined_data)
}
data <- get_mult_house_data()
