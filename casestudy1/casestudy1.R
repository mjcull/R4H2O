## Case Study 1: Water Quality Regulations

## Initialise the Tidyverse libraries
library(tidyverse)

## LOAD
turbidity <- read_csv("casestudy1/turbidity_laanecoorie.csv")

## INSPECT
turbidity

names(turbidity) ## Variable names

dim(turbidity) ## Dimensions

View(turbidity) ## View the results in a separate window

nrow(turbidity) ## Number of columns

ncol(turbidity) ## Number of rows

glimpse(turbidity) ## Show the structure of the data frame

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

filter(turbidity, Zone == "Bealiba") ## All results for Bealiba

filter(turbidity, Zone == "Laanecoorie" & Result > 1)

## How many turbidity results, except for  Bealiba, are lower than to 0.1 NTU?
nrow(filter(turbidity, Zone != "Bealiba" & Result < 0.1))

## VISUALISE

hist(turbidity$Result)

## Plot the histogram of the Laanecoorie water quality zone.
l <- filter(turbidity, Zone == "Laanecoorie")
b <- max(l$Result) / 0.1
hist(l$Result, breaks = b)

par(mfrow = c(2, 2)) # Divide plot screen in two by two columns
for (z in unique(turbidity$Zone)) {
    l <- filter(turbidity, Zone == z)
    b <- max(l$Result) / 0.1
    hist(l$Result, breaks = b, main = z)
}
par(mfrow = c(1, 1)) ## Reset screen

turbidity_bealiba <- filter(turbidity, Zone == "Bealiba")
hist(turbidity_bealiba$Result)

max(turbidity_bealiba$Result)

boxplot(turbidity$Result)

## Boxplot
boxplot(Result ~ Zone, data = turbidity, col = "lightblue",
        main = "Turbidity Results Laanecoorie water system",
        ylab = "Turbidity (NTU)")

## ANALYSE

## What is the mean turbidity value for the samples in Bealiba?
turbidity_bealiba <- filter(turbidity, Result, Zone == "Bealiba" & Measure == "Turbidity")
mean(turbidity_bealiba$Result)

## What is the third quartile for the turbidity of sample point 090A01?
p090a01 <- filter(turbidity, Sample_Point == "090A01" & Measure == "Turbidity")
summary(p090a01$Result)

quantile(turbidity$Result, c(0.50, 0.95))  ## 50th and 95th percentile

quantile(turbidity$Result, 0.95, method = 6) ## Weibull method

## GROUPING
turb_zones <- group_by(turbidity, Zone)
summarise(turb_zones, Maximum = max(Result))
