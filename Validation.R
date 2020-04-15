# prepare mobility_messstellen verkehrsmessstellen data for monitoring covid19

# Date: 15.04.2020
###########################################################################

# import function

source("./function.R")

###########################################################################

# Import libraries
library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)
library(rmarkdown)

# Number formatting
options(scipen = 1000000)
options(digits = 6)

###########################################################################

dir <- "C:/gitrepos/covid19_mobility_ZaehlstellenMIVVeloKantonZH"
setwd(dir)

###########################################################################

# import master data file from previous day
master <- read_csv("./Mobility_VerkehrsmessstellenKantonZH.csv") %>%
    mutate('date' = as.POSIXct(paste(date, "%Y-%m-%d"), format="%Y-%m-%d")) 

# join miv and velo to master
mobility_messstellen <- rbind(master, miv_tageswerte, velo_tageswerte) %>% arrange(date)

# write updated master data file
write.table(mobility_messstellen, "./Mobility_VerkehrsmessstellenKantonZH.csv", sep=",", fileEncoding="UTF-8", row.names = F)

###########################################################################

# check 

CheckIfDfFollowsStandard1(mobility_messstellen)
render("./Validation.Rmd")


