pollutantmean <- function(directory, pollutant, ID=1:332) {
  files  <- list.files(path=directory,pattern = '*.csv', full.names = TRUE)
  tables <- lapply(files, read.csv, header = TRUE)
  combined.df <- do.call(rbind , tables)
  a=min(ID)
  b=max(ID)
  subsetdf=combined.df[combined.df$ID >= a & combined.df$ID <= b,]
  med=mean(subsetdf[,pollutant],na.rm=TRUE)
  round(med, digits = 3)
}