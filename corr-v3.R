corr <- function(directory, threshold = 0) {
  setwd(paste("/Users/mac15/Downloads/Curso 2 - Linguagem R/semana 2/", directory,sep=""))
  options(digits = 5)
  files  <- list.files(pattern = '\\.csv')
  tables <- lapply(files, read.csv, header = TRUE)
  combined.df <- do.call(rbind , tables)
  ID=1:332
  nobs=numeric()
  correl=numeric()
  for(i in 1:332) {
    nobs=c(nobs,sum(as.numeric(combined.df$ID==i & !is.na(combined.df$sulfate) & !is.na(combined.df$nitrate))))
    correl=c(correl,cor(read.csv(files[i])$sulfate, read.csv(files[i])$nitrate, use="complete.obs"))
    }
  tabely=data.frame(ID,nobs,correl)
  print(tabely)
}