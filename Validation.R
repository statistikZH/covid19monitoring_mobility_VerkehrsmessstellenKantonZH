
# prepare mobility_messstellen verkehrsmessstellen data for monitoring covid19

###########################################################################

# import function

source("~/git/covid19monitoring_mobility_VerkehrsmessstellenKantonZH/function.R")

###########################################################################

# Import libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(rmarkdown)

# Number formatting
options(scipen = 1000000)
options(digits = 6)

###########################################################################

# dir <- "C:/gitrepos/covid19monitoring_mobility_VerkehrsmessstellenKantonZH"
dir <- ("~/git/covid19monitoring_mobility_VerkehrsmessstellenKantonZH")
setwd(dir)

###########################################################################

# import master data file from previous update
# master <- readr::read_csv("./Mobility_VerkehrsmessstellenKantonZH.csv") %>%
#     mutate('date' = as.POSIXct(paste(date, "%Y-%m-%d"), format="%Y-%m-%d"))

master <- readr::read_csv("./Mobility_VerkehrsmessstellenKantonZH.csv") %>%
  mutate('date' = as.POSIXct(paste(date, "%Y-%m-%d"), format="%Y-%m-%d"))

# join miv and velo to master
mobility_messstellen <- rbind(master, miv_tageswerte, velo_tageswerte) %>% filter(value != 0) %>% arrange(date)

# write updated master data file
write.table(mobility_messstellen, "./Mobility_VerkehrsmessstellenKantonZH.csv", sep=",", fileEncoding="UTF-8", row.names = F)

###########################################################################

# check

# CheckIfDfFollowsStandard1(mobility_messstellen)
# render("./Validation.Rmd")


