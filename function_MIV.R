function_richtung <- function(path, number) {
  
  sheets <- path %>% 
    excel_sheets() %>% 
    set_names() %>%
    map(read_excel, path = path)
  
  richtung <-sheets[[number]]
  colnames(richtung) = richtung[7, ] # the 8th row will be the header
  richtung <- richtung[-7, ] # removing the first row.
  
  # subset additional information and save to a data frame
  subset_zusatzinfo <- richtung[2:5, 1:2] %>% 
    pivot_wider(values_from = Zeit, names_from = Datum) %>% 
    rename(Messstelle = 1, Richtung = 2) %>%
    select(Messstelle, Richtung)
  
  # adding direction and station id to data frame
  richtung <- richtung[-c(1, 2, 3, 4, 5, 6, 7),]
  #richtung<- richtung #%>% 
    #mutate('Messstelle' = subset_zusatzinfo$Messstelle,
           #'Richtung' = subset_zusatzinfo$Richtung,
           #'date' = as.POSIXct(paste(.data$Datum, "%d.%m.%Y"), format="%d.%m.%Y"))
  
  # transform data frame
  richtung <- richtung %>% 
    pivot_longer(-c(Datum, Zeit), names_to = "variable_short", values_to = "value") %>%
    mutate(value = as.numeric(value),
           variable_short = case_when(
             variable_short == "PW" |
               variable_short == "PW+" ~ "Privatverkehr",
             variable_short == "Lief" |
               variable_short == "Lief+" |
               variable_short == "Lief+Aufl." |
               variable_short == "LW" |
               variable_short == "LW+" |
               variable_short == "Sattelzug" |
               variable_short == "Bus" ~ "Gesch\u00e4ftsverkehr",
             variable_short == "MR" ~ "Motorrad",
             variable_short == "Total" ~ "Total"),
           variable_long = paste("Aufkommen MIV nach Fahrzeugkategorie", subset_zusatzinfo$Messstelle)) %>%
    group_by(variable_short, Datum, variable_long) %>%
    summarise(value = round(sum(value))) %>%
    ungroup() 

}

function_rbind <- function(dat1, dat2){
    dat <- rbind(dat1, dat2) %>%
    group_by(Datum, variable_short, variable_long) %>%
    summarize(value = round(sum(value))) %>%
    ungroup()  
}


function_rbind_B <- function(dat1, dat2, dat3, dat4){
  dat <- rbind(dat1, dat2, dat3, dat4) %>%
    group_by(Datum, variable_short, variable_long) %>%
    summarize(value = round(sum(value))) %>%
    ungroup()  
}
