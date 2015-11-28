complete <- function(directory, ID = 1:332) {
  files  <- list.files(path=directory,pattern = '*.csv', full.names = TRUE)
  tables <- lapply(files, read.csv, header = TRUE)
  combined.df <- do.call(rbind , tables)
  nobs=numeric()
  for(i in ID) {
  nobs=c(nobs,sum(as.numeric(combined.df$ID==i & !is.na(combined.df$sulfate) & !is.na(combined.df$nitrate))))
  }
tabel=data.frame(ID,nobs)
print(tabel)
}
