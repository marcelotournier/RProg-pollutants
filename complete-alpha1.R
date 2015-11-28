for (i in min(ID):max(ID)) {
  sum(subsetdf$ID==1 & !is.na(subsetdf$sulfate) & !is.na(subsetdf$nitrate))
}
mydata <- data.frame()
for(i in ID) {
  cbind(mydata, sum(subsetdf$ID==i & !is.na(subsetdf$sulfate) & !is.na(subsetdf$nitrate)))
  
  }

for(i in ID) {
  nobs=sum(subsetdf$ID==i & !is.na(subsetdf$sulfate) & !is.na(subsetdf$nitrate))
datax=data.frame(ID,nobs)
print(datax)
  }

arquivos  <- list.files(pattern = '\\.csv')
#read files into a list - are there headers?
soma2=sum(!is.na('sulfate') & !is.na('nitrate'))
tabelas <- lapply(arquivos, soma2, header = TRUE)
#rbind files

combinado <- do.call(rbind , tabelas)