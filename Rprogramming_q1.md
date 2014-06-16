# Markdown file with some of the answers of the 1st quiz of the course "R programming"

## Load the datafile

`data <- read.csv("hw1_data.csv")`

## Question 12
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

`> data[1:2, ]` or `> head(data, 2)`

      Ozone Solar.R Wind Temp Month Day
    1    41     190  7.4   67     5   1
    2    36     118  8.0   72     5   2

## Question 13
How many observations (i.e. rows) are in this data frame?

`> nrow(data)`

    [1] 153

## Question 14
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?

`> tail(data, 2)`

        Ozone Solar.R Wind Temp Month Day
    152    18     131  8.0   76     9  29
    153    20     223 11.5   68     9  30

## Question 15
What is the value of Ozone in the 47th row?

`> data[47, "Ozone"]`

    [1] 21

## Question 16
How many missing values are in the Ozone column of this data frame?

bad <- is.na(data[ , "Ozone"])


Question 17
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.


Question 18
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

Question 19
What is the mean of "Temp" when "Month" is equal to 6?

Question 20
What was the maximum ozone value in the month of May (i.e. Month = 5)?

good <- data[!bad, ]

good[, "Month"] > 6
g6 <- good[, "Month"] > 6
good[, g6]
good[g6, ]
good[!g6, ]
good[!g6, ] < 6
good[!g6, "Month"] < 6
l6 <- good[!g6, "Month"] < 6
good[!g6, ]
moins6 <- good[!g6, ]
moins6[l6, "Month"]
moins6[!l6, "Month"]
mean(moins6[!l6, "Temp"])
good[, ]
good[l6, ]
good[!l6, ]
good[g6, ]
good[!g6, ]
nrow(good[!g6, ])
good[!g6, ] > 5
good[!g6, "Month"] > 5
g5 <- good[!g6, "Month"] > 5
june <- good[!g6, ]
june[g5, ]
mean(june[g5, "Temp"])
View(data)
View(data)
data[ , "Month"] > 5
g5 <- data[ , "Month"] > 5
may <- data[ , "Month"] > 5
data[may, ]
data[!may, ]
data[!may, ]
data[may, ]
data[may, 'Month']
data[may, 'Month'] > 6
g6 <- data[may, 'Month'] > 6
data[may, ][g6, ]
data[may, ][!g6, ]
mean(data[may, 'Temp'][!g6, 'Temp'])
june <- data[may, ][!g6, ]
june
mean(june[ ,"Temp"]
)
data[!may, ]
max(data[!may, "Ozone"])
data[!bad, ]
data[!bad, ][!may, ]
data[!bad, "Month"] < 6
may <- data[!bad, "Month"] < 6
data[!bad, ][may, ]
max("Ozone", data[!bad, ][may,])
max(data[!bad, ][may,])
max(data[!bad, 'Ozone'][may,])
max(data[!bad, ][may, "Ozone"])