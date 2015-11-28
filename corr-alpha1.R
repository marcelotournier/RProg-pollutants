corr <- function(directory, threshold = 0) {
  options(digits = 5)
  files <- list.files(pattern = "*.csv", full.names=TRUE)
  corrs <- numeric()
  for(i in length(files)) {
    completes <- complete(directory, i)
    if(completes[1, "nobs"] > threshold) { 
      data <- read.csv(files[i])
      x <- cor(b$sulfate, b$nitrate, use="complete.obs")
      corrs <- append(corrs, x)
    }
  }
}
  # version2
  cr <- c()
  
  for(i in 1:length(files)) {
    data <- read.csv( paste(directory, "/", files[i], sep="/") )
    data <- data[complete.cases(data),]
    if (nrow(data) > threshold ) {
      cr <- c(cr, cor(data$sulfate, data$nitrate))
  corrs
}