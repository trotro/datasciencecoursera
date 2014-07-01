best <- function(state, outcome) {
  ## Read outcome data
  my_outcome <- read.csv("outcome-of-care-measures.csv")
  best  <- 1
  bests  <- NULL
  ## Check that state and outcome are valid
  if (my_outcome[, "State"] != state) {
    return("invalid state")
  } else if (outcome == "heart attack") {
    for (i in 1:nrow(my_outcome[my_outcome$State == state])) {
      if (my_outcome[i, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"] < my_outcome[best, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]) {
        best  <- i
        bests  <- NULL
      } else if (my_outcome[i, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"] == my_outcome[best, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]) {
        bests  <- c(bests, i)
      }
    }
  }
  if (!is.null(bests)) {
    for (i in 1:nrow(bests)) {
      to_sort <- my_outcome[bests$i, "Hospital.Name"]
    }
    sort(to_sort, decreasing = FALSE)
    ## Return hospital name in that state with lowest 30-day death rate
    return(sort[1])
  } else if (outcome == "heart failure") {
    for (i in 1:nrow(my_outcome)) {
      if (my_outcome[i, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] < my_outcome[best, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"]) {
        best  <- i
        bests  <- NULL
      } else if (my_outcome[i, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"] == my_outcome[best, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"]) {
        bests  <- c(bests, i)
      }
    }
    if (!is.null(bests)) {
      for (i in 1:nrow(bests)) {
        to_sort <- my_outcome[bests$i, "Hospital.Name"]
      }
      sort(to_sort, decreasing = FALSE)
      ## Return hospital name in that state with lowest 30-day death rate
      return(sort[1])
    }
  } else if (outcome == "pneumonia") {
    for (i in 1:nrow(my_outcome)) {
      if (my_outcome[i, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"] < my_outcome[best, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]) {
        best  <- i
        bests  <- NULL
      } else if (my_outcome[i, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"] == my_outcome[best, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]) {
        bests  <- c(bests, i)
      }
    }
    if (!is.null(bests)) {
      for (i in 1:nrow(bests)) {
        to_sort <- my_outcome[bests$i, "Hospital.Name"]
      }
      sort(to_sort, decreasing = FALSE)
      ## Return hospital name in that state with lowest 30-day death rate
      return(sort[1])
    } else {
      ## Return hospital name in that state with lowest 30-day death rate
      return(my_outcome[best, "Hospital.Name"])
    }
  } else {
    return("invalid outcome")
  }
}