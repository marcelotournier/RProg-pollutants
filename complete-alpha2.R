# Write a function that reads a directory full of files and reports the number
# of completely observed cases in each data file. The function should return a 
# data frame where the first column is the name of the file and the second 
# column is the number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  setwd(paste("/Users/mac15/Downloads/Curso 2 - Linguagem R/semana 2/", directory,sep=""))
  files  <- list.files(pattern = '\\.csv')
  tables <- lapply(files, read.csv, header = TRUE)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  combined.df <- do.call(rbind , tables)
  a=min(ID)
  b=max(ID)
  subsetdf=combined.df[combined.df$ID >= a & combined.df$ID <= b,]
  for(i in ID) {
    sum(!is.na(subsetdf$sulfate) & !is.na(subsetdf$nitrate) & subsetdf$ID == i)
  }
  

   ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
}
