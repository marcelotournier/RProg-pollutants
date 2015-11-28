corr <- function(directory, threshold = 0) {
ID=1:332
files  <- list.files(path=directory,pattern = '*.csv', full.names = TRUE)
tables <- lapply(files, read.csv, header = TRUE)
combined.df <- do.call(rbind , tables)
nobs=numeric()
for(i in ID) {
  nobs=c(nobs,sum(as.numeric(combined.df$ID==i & !is.na(combined.df$sulfate) & !is.na(combined.df$nitrate))))
}
tabel=data.frame(ID,nobs)
tabel2=tabel[tabel$nobs!=0,]
correl=numeric()
for(i in tabel2$ID) {
  fileq=read.csv(files[i])
  correl=c(correl,cor(fileq$sulfate,fileq$nitrate, use="na.or.complete"))
}
correla=data.frame(tabel2$ID,tabel2$nobs,correl)
correlaf=round(correla, digits = 5)
final=subset(correlaf,tabel2.nobs>threshold)
print(final$correl)
}

# testes
# teste=subset(correla, tabel2.nobs>150)
# teste=round(teste, digits = 5)
# summary(teste$correl)
# head(teste$correl)







