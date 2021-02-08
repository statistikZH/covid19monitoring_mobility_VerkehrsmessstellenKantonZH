# prepare velo verkehrsmessstellen data for monitoring covid19

###############################################################################

# Import libraries
# library(tidyverse)
library(readxl)
library(dplyr)
library(ggplot2)
library(stringr)


# Number formatting
options(scipen = 1000000)
options(digits = 6)

dir <- "L:/STAT/03_AS/03_Publikationen/20_monitoring_covid/verkehrsmessstellen_KtZH"
setwd(dir)
source("C:/gitrepos/covid19monitoring_mobility_VerkehrsmessstellenKantonZH/function_Velo.R")

# Replace folder name with current folder

#mes 16
mes16 <- "./Rohdaten_Velo/Wo 1_Februar2021_Velo/B290pgj - @1018@ - Rohdaten - Dietikon (ZH1018), Radweg (1018_Dietikon).xlsx"
mes16_richtung1 <- function_richtung(mes16, 1)
mes16_richtung2 <- function_richtung(mes16, 2)
mes16_df <- function_rbind(mes16_richtung1, mes16_richtung2)

#mes 17
mes17 <-  "./Rohdaten_Velo/Wo 1_Februar2021_Velo/B290pgj - @2019@ - Rohdaten - Hausen am Albis (ZH2019), Radweg, (2019_Hausen am Albis).xlsx"
mes17_richtung1 <- function_richtung(mes17, 1)
mes17_richtung2 <- function_richtung(mes17, 2)
mes17_df <- function_rbind(mes17_richtung1, mes17_richtung2)

#mes 18
mes18 <-  "./Rohdaten_Velo/Wo 1_Februar2021_Velo/B290pgj - @316@ - Rohdaten - Greifensee (ZH0316), Radweg (316_Greifensee).xlsx"
mes18_richtung1 <- function_richtung(mes18, 1)
mes18_richtung2 <- function_richtung(mes18, 2)
mes18_df <- function_rbind(mes18_richtung1, mes18_richtung2)

#mes 19
mes19 <-  "./Rohdaten_Velo/Wo 1_Februar2021_Velo/B290pgj - @716@ - Rohdaten - Regensdorf (ZH0716), Radweg, (716_Regensdorf).xlsx"
mes19_richtung1 <- function_richtung(mes19, 1)
mes19_richtung2 <- function_richtung(mes19, 2)
mes19_df <- function_rbind(mes19_richtung1, mes19_richtung2)


# rbind f. alle messstationen
mes <- rbind(mes16_df, mes17_df, mes18_df, mes19_df)

# korrekt formatieren
velo_tageswerte <- mes %>%
  transmute('date' = as.POSIXct(paste(Datum, "%d.%m.%Y"), format="%d.%m.%Y"),
            'value' = mes$value,
            'topic' := "Mobilität",
            'variable_short' = mes$variable_short,
            'variable_long' := mes$variable_long, 
            'location' := "ZH",      
            'unit' := "Anzahl",    
            'source' := "Kanton Zürich, Baudirektion, Tiefbauamt",
            'update' := "täglich",
            'public' := "ja",
            'description' := "https://github.com/statistikZH/covid19monitoring_mobility_VerkehrsmessstellenKantonZH") %>%
  tidyr::drop_na() %>%
  arrange(date)
