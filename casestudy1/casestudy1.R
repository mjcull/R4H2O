## Case Study 1: Water Quality Regulations

## LOAD
turbidity <- read.csv("casestudy1/turbidity_laanecoorie.csv")

## INSPECT
turbidity

head(turbidity) ## First six rows

tail(turbidity) ## Last six rows

names(turbidity) ## Variable names

dim(turbidity) ## Dimensions

View(turbidity) ## View the results in a separate window

nrow(turbidity) ## Number of columns

ncol(turbidity) ## Number of rows

str(turbidity) ## Show the structure of the data frame

## EXPLORE
turbidity$Result ## All results in a vector

turbidity$Result[1:10] ## First ten results in a vector

turbidity[1:10, 4:5] ## First ten rows with column four and five

turbidity[, 4:5] ## Show all rows with column four and five

turbidity[1:10,] ## Show all variables for the first ten rows

turbidity[1:10, "Result"]

turbidity[1:10, c("Zone", "Result")] ## First ten rows of zone and result

## What is the result of the last sample taken in the turbidity?
turbidity$Result[nrow(turbidity)]

turbidity[turbidity$Zone == "Bealiba", "Result"] ## All results for Bealiba
subset(turbidity, Zone == "Bealiba") ## All results for Bealiba

turbidity[turbidity$Zone == "Laanecoorie" & turbidity$Result > 1, ]

## How many turbidity results, except for  Bealiba, are lower than to 0.1 NTU?
nrow(subset(turbidity, Zone != "Bealiba" & Result < 0.1))

## VISUALISE

hist(turbidity$Result)





## Histogram
b <- max(turbidity$Result) / 0.1
hist(turbidity$Result, breaks = b, main = "Turbidity Results")

## Plot the histogram of the Laanecoorie water quality zone.
l <- subset(turbidity, Zone = "Laanecoorie")
b <- max(l$Result) / 0.1
hist(l$Result, breaks = b)

par(mfrow = c(2, 2))
for (z in unique(turbidity$Zone)) {
    l <- subset(turbidity, Zone = z)
    b <- max(l$Result) / 0.1
    hist(l$Result, breaks = b, main = z)
}

turbidity_bealiba <- turbidity$Result[turbidity$Zone == "Bealiba"]
hist(turbidity_bealiba)

max(turbidity_bealiba)










boxplot(turbidity$Result)



## Boxplot
boxplot(Result ~ Zone, data = turbidity, col = "lightblue",
        main = "Turbidity Results Laanecoorie water system",
        ylab = "Turbidity (NTU)")

## ANALYSE

## What is the mean turbidity value for the samples in Bealiba?
mean(turbidity$Result[turbidity$Zone == "Bealiba"])

median(turbidity$Result)

## What is the third quartile for the turbidity of sample point 090A01?
summary(turbidity$Result[turbidity$Sample_Point == "090A01"])

quantile(turbidity$Result, c(0.50, 0.95))  ## 50th and 95th percentile

quantile(turbidity$Result, 0.95, method = 6) ## Weibull method

## GROUPING
aggregate(turbidity$Result, list(turbidity$Zone), max) ## Maximum turbidity per zone

## Determine the 95^th^percentile using the Weibull method for all water quality zones in Laanecoorie.
aggregate(turbidity$Result, list(turbidity$Zone), quantile, 0.95, method = 6)
