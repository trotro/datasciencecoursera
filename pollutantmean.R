pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  ## 'pollutant' is a character vector of length 1 indicating the name of 
  ## the pollutant for which we will calculate the mean; either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  my_specdata <- NULL
  for(file in dir(directory)) {
    my_data <- read.csv(paste(directory, file, sep="/"))
    my_specdata <- rbind(my_specdata, my_data)
  }
  
  #my_na <- is.na(my_specdata[pollutant])
  #my_list <- my_specdata[!my_na, "ID"] == id
  my_mean <- mean(my_specdata[my_specdata$ID %in% id, pollutant], na.rm = TRUE)
  ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
  #return(mean(my_specdata[!my_na, ][my_list, pollutant]))
  return(my_mean)
}