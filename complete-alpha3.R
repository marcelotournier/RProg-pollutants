complete <- function(directory, ID = 1:332) {
  setwd(paste("/Users/mac15/Downloads/Curso 2 - Linguagem R/semana 2/", directory,sep=""))
  files  <- list.files(pattern = '\\.csv')
  tables <- lapply(files, read.csv, header = TRUE)
  combined.df <- do.call(rbind , tables)
  nobs=numeric()
  for(i in ID) {
    nobs=sum(combined.df$ID==i & !is.na(combined.df$sulfate) & !is.na(combined.df$nitrate))
    print(nobs)
  }
  tabel=data.frame(ID,nobs)
  print(tabel)
}
