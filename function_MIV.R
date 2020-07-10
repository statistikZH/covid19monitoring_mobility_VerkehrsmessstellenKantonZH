function_richtung <- function(path, number) {
  
  firstup <- function(x) {
    substr(x, 1, 1) <- toupper(substr(x, 1, 1))
    x
  } 
  
  sheets <- path %>% 
    excel_sheets() %>% 
    purrr::set_names() %>%
    purrr::map(read_excel, path = path)
  
  richtung <-sheets[[number]]
  colnames(richtung) = richtung[7, ] # the 8th row will be the header
  richtung <- richtung[-7, ] # removing the first row.
  
  # subset additional information and save to a data frame
  subset_zusatzinfo <- richtung[2:5, 1:2] %>% 
    tidyr::pivot_wider(values_from = Zeit, names_from = Datum) %>% 
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
    tidyr::pivot_longer(-c(Datum, Zeit), names_to = "variable_short", values_to = "value") %>%
    mutate(value = as.numeric(value),
           variable_short = case_when(
             variable_short == "PW" |
               variable_short == "PW+" ~ "privatverkehr",
             variable_short == "Lief" |
               variable_short == "Lief+" |
               variable_short == "Lief+Aufl." |
               variable_short == "LW" |
               variable_short == "LW+" |
               variable_short == "Sattelzug" |
               variable_short == "Bus" ~ "geschaeftsverkehr",
             variable_short == "MR" ~ "motorrad",
             variable_short == "Total" ~ "total"),
           variable_long = paste0("Aufkommen MIV, ", firstup(variable_short), ", ", subset_zusatzinfo$Messstelle),
           variable_short = paste0(variable_short, "_", str_extract(subset_zusatzinfo$Messstelle, 'ZH.{0,4}'))) %>%
    group_by(variable_short, Datum, variable_long) %>%
    summarise(value = round(sum(value, na.rm = TRUE))) %>%
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
