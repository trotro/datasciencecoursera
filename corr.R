corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  my_comp <- complete(diretory, 1:332)
  ## 'threshold' is a numeric vector of length 1 indicating the number of 
  ## completely observed observations (on all variables) required to compute the correlation 
  ## between nitrate and sulfate; the default is 0
  
  ## Write a function that takes a directory of data files and a threshold for complete cases 
  ## and calculates the correlation between sulfate and nitrate for monitor locations 
  ## where the number of completely observed cases (on all variables) is greater than the threshold.
  for(nob in my_comp("nobs")) {
    if(nob > treshold) {
      
    } else {
      
    }
  }
  
  ## use the cor() function
  my_corr <- cor()
  ## Return a numeric vector of correlations
  return(my_corr)
}