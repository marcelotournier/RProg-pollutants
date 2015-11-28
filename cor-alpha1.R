corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  setwd(paste("/Users/mac15/Downloads/Curso 2 - Linguagem R/semana 2/", directory,sep=""))
  files  <- list.files(pattern = '\\.csv')
  tables <- lapply(files, read.csv, header = TRUE)
  combined.df <- do.call(rbind , tables)
  combinado2=filter(combined.df, sulfate > 0 & nitrate > 0)
}