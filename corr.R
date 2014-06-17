corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  my_specdata <- NULL
  for(file in dir(directory)) {
    my_data <- read.csv(paste(directory, file, sep="/"))
    my_specdata <- rbind(my_specdata, my_data)
  }
  ## 'threshold' is a numeric vector of length 1 indicating the number of 
  ## completely observed observations (on all variables) required to compute the correlation 
  ## between nitrate and sulfate; the default is 0
  my_comp <- complete(directory, 1:332)
  ## Write a function that takes a directory of data files and a threshold for complete cases 
  ## and calculates the correlation between sulfate and nitrate for monitor locations 
  ## where the number of completely observed cases (on all variables) is greater than the threshold.
  to_cor  <- NULL
  my_corr <- NULL
  for(i in 1:nrow(my_comp)) {
    if(my_comp[i ,"nobs"] > threshold) {
      #to_cor <- rbind(to_cor, my_specdata[my_specdata$ID == my_comp[i, "id"], ])
      my_corr <- c(my_corr, cor(my_specdata[my_specdata$ID == my_comp[i, "id"], "sulfate"], my_specdata[my_specdata$ID == my_comp[i, "id"], "nitrate"], use="pairwise.complete.obs"))
    }
  }
  ## use the cor() function
  #my_corr <- cor(to_cor[, "sulfate"], to_cor[, "nitrate"], na.rm=TRUE, use="pairwise.complete.obs")
  ## Return a numeric vector of correlations
  return(my_corr)
}