complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
  
  my_specdata <- NULL
  for(file in dir(directory)) {
    my_data <- read.csv(paste(directory, file, sep="/"))
    my_specdata <- rbind(my_specdata, my_data)
  }
  
  my_df <- NULL
  my_nobs <- NULL
  for(i in id) {
    to_count <- complete.cases(my_specdata[my_specdata$ID == i, ])
    #nobs <- sum(to_count)
    #my_nobs <- rbind(my_nobs, sum(to_count))
    my_df <- data.frame(rbind(my_df, cbind(i, sum(to_count))))
  }
  #my_df <- data.frame(cbind(id, my_nobs))
  names(my_df) <- c("id", "nobs")
  return(my_df)
}