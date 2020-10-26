# prepare miv verkehrsmessstellen data for monitoring covid19

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
source("C:/gitrepos/covid19monitoring_mobility_VerkehrsmessstellenKantonZH/function_MIV.R")

# Replace folder name with current folder

#mes 1
mes1 <- "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @109@ - Rohdaten - Kilchberg (ZH0109), Seestrasse (Route Nr. 3).xlsx"
mes1_richtung1 <- function_richtung(mes1, 1)
mes1_richtung2 <- function_richtung(mes1, 2)
mes1_df <- function_rbind(mes1_richtung1, mes1_richtung2)

#mes 2
mes2 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @587@ - Rohdaten - Uster (ZH0587), Riedikerstrasse (Route Nr. 339).xlsx"
mes2_richtung1 <- function_richtung(mes2, 1)
mes2_richtung2 <- function_richtung(mes2, 2)
mes2_df <- function_rbind(mes2_richtung1, mes2_richtung2)

#mes 3
mes3 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @609@ - Rohdaten - Zürich (ZH0609), Birmensdorferstrasse (Route Nr. 382).xlsx"
mes3_richtung1 <- function_richtung(mes3, 1)
mes3_richtung2 <- function_richtung(mes3, 2)
mes3_df <- function_rbind(mes3_richtung1, mes3_richtung2)

#mes 4
mes4 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @5191@ - Rohdaten - Dübendorf (ZH5191), Zürichstrasse (Route Nr. 740).xlsx"
mes4_richtung1 <- function_richtung(mes4, 1)
mes4_richtung2 <- function_richtung(mes4, 2)
mes4_df <- function_rbind(mes4_richtung1, mes4_richtung2)

#mes 5 - Autobahn (4 Richtungen)
mes5 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @5186@ - Rohdaten - Uster (ZH5186), Oberland-Autobahn (A53).xlsx"
mes5_richtung1 <- function_richtung(mes5, 1)
mes5_richtung2 <- function_richtung(mes5, 2)
mes5_richtung3 <- function_richtung(mes5, 3)
mes5_richtung4 <- function_richtung(mes5, 4)
mes5_df <- function_rbind_B(mes5_richtung1, mes5_richtung2, mes5_richtung3, mes5_richtung4)

#mes 6
mes6 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @4790@ - Rohdaten - Horgen (ZH4790), Zugerstrasse (Route Nr. 341).xlsx"
mes6_richtung1 <- function_richtung(mes6, 1)
mes6_richtung2 <- function_richtung(mes6, 2)
mes6_df <- function_rbind(mes6_richtung1, mes6_richtung2)

#mes 7 -- grössere Bautätigkeit. Bis auf Weiteres keine Daten
# mes7 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @3690@ - Rohdaten - Thalwil (ZH3690), Zürcherstrasse (Route Nr.xlsx"
# mes7_richtung1 <- function_richtung(mes7, 1)
# mes7_richtung2 <- function_richtung(mes7, 2)
# mes7_df <- function_rbind(mes7_richtung1, mes7_richtung2)

#mes 8
mes8 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @3687@ - Rohdaten - Birmensdorf (ZH3687), Aargauerstrasse (Route Nr. 638).xlsx"
mes8_richtung1 <- function_richtung(mes8, 1)
mes8_richtung2 <- function_richtung(mes8, 2)
mes8_df <- function_rbind(mes8_richtung1, mes8_richtung2)

#mes 9
mes9 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @2287@ - Rohdaten - Horgen (ZH2287), Zugerstrasse (Route Nr. 338).xlsx"
mes9_richtung1 <- function_richtung(mes9, 1)
mes9_richtung2 <- function_richtung(mes9, 2)
mes9_df <- function_rbind(mes9_richtung1, mes9_richtung2)

#mes 10
mes10 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @2085@ - Rohdaten - Regensdorf (ZH2085), Wehntalerstrasse (Route Nr. 17).xlsx"
mes10_richtung1 <- function_richtung(mes10, 1)
mes10_richtung2 <- function_richtung(mes10, 2)
mes10_df <- function_rbind(mes10_richtung1, mes10_richtung2)

#mes 11
mes11 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @208@ - Rohdaten - Obfelden (ZH0208), Dorfstrasse (Route Nr. 654).xlsx"
mes11_richtung1 <- function_richtung(mes11, 1)
mes11_richtung2 <- function_richtung(mes11, 2)
mes11_df <- function_rbind(mes11_richtung1, mes11_richtung2)

#mes 12
#mes12 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @1887@ - Rohdaten - Langnau am Albis (ZH1887), Albisstrasse (Route Nr.xlsx"
#mes12_richtung1 <- function_richtung(mes12, 1)
#mes12_richtung2 <- function_richtung(mes12, 2)
#mes12_df <- function_rbind(mes12_richtung1, mes12_richtung2)

#mes 13
mes13 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @1288@ - Rohdaten - Zollikon (ZH1288), Forchstrasse (Route Nr. 347).xlsx"
mes13_richtung1 <- function_richtung(mes13, 1)
mes13_richtung2 <- function_richtung(mes13, 2)
mes13_df <- function_rbind(mes13_richtung1, mes13_richtung2)

#mes 14
#mes14 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @1109@ - Rohdaten - Knonau (ZH1109), Zürichstrasse (Route Nr.xlsx"
#mes14_richtung1 <- function_richtung(mes14, 1)
#mes14_richtung2 <- function_richtung(mes14, 2)
#mes14_df <- function_rbind(mes14_richtung1, mes14_richtung2)

#mes 15 - Autobahn (4 Richtungen)
mes15 <-  "./Rohdaten_MIV/Oktober_bis25102020_MIV/B290pgj - @110@ - Rohdaten - Winkel (ZH0110), Autobahn (A51).xlsx"
mes15_richtung1 <- function_richtung(mes15, 1)
mes15_richtung2 <- function_richtung(mes15, 2)
mes15_richtung3 <- function_richtung(mes15, 3)
mes15_richtung4 <- function_richtung(mes15, 4)
mes15_df <- function_rbind_B(mes15_richtung1, mes15_richtung2, mes15_richtung3, mes15_richtung4)

# rbind f. alle messstationen
#mes <- rbind(mes1_df, mes2_df, mes3_df, mes4_df, mes5_df, mes6_df, mes8_df, mes9_df, mes10_df, mes11_df, mes12_df, mes13_df, mes14_df, mes15_df)
mes <- rbind(mes1_df, mes2_df, mes3_df, mes4_df, mes5_df, mes6_df, mes8_df, mes9_df, mes10_df, mes11_df, mes13_df, mes15_df)

# korrekt formatieren
miv_tageswerte <- mes %>%
  transmute('date' = as.POSIXct(paste(Datum, "%d.%m.%Y"), format="%d.%m.%Y"),
            'value' = mes$value,
            'topic' := "Mobilität",
            'variable_short' = mes$variable_short,
            'variable_long' := mes$variable_long, 
            'location' := "ZH",      
            'unit' := "Anzahl",    
            'source' := "Kanton Zürich, Baudirektion, Tiefbauamt",
            'update' := "t\u00e4glich",
            'public' := "ja",
            'description' := "https://github.com/statistikZH/covid19monitoring_mobility_VerkehrsmessstellenKantonZH") %>%
  tidyr::drop_na() %>%
  arrange(date)