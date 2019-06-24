# Answers to the questions

## Introduction to the R Language
Q> Produce a plot of the function `y=-x^2-2x+3`$.

To plot this function, we can use the same approach as in the example, with a minor enhancement.

{format: r, line-numbers: false}
```R
x <- seq(-5, 3, .1)
y <- -x^2 - 2 * x + 3
plot(x, y, type = "l")
```

This code uses the `seq()` function to create a smoother line than the colon (`-5:3`), which increments by 1. This function creates a vector from -5 to 1 with steps of 0.1.

The formula for determining where the parabola intersects with the x-axis is:

```$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
```

Q> Use the quadratic formula in the R console. Where does this parabola intersect with the x-axis?

{format: r, line-numbers: false}
```
a <- -1 
b <- -2
c <- 3

x1 <- (-b + sqrt(b^2 - 4 * a * c)) / (2 * a)
x2 <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * a)

abline(h = 0, col = "grey")
abline(v = 0, col = "grey")
points(c(x1, x2), c(0, 0), col = "red", pch = 19)
```

We can enhance the basic plot to visualise the solution. The `abline()` function adds a horizontal and vertical grey line to indicate the axes. The `points()` function adds red points at the calculated intersects.

![Parabola visualisation](resources/session2/parabola.png)

## Case Study: Water Quality Regulations
Q> You have 99 turbidity results. The first 94 are 0.1 NTU and the last five are 5 NTU. What is the 95^th^ percentile using the Weibull method?

Answer without using any code:
1. Rank the results in ascending order: `0.1, 0.1, \ldots , 5, 5, 5`$.
2. Determine the percentile rank: `0.95 \times (99 + 1) = 95`$.
3. The 95^th^ percentile is the 95^th^ result, which is 5 NTU.

We can also answer this question using R code:

{format: r, line-numbers: false}
```
results <- c(rep(0.1, 94), rep(5, 5))
rank <- 0.95 * (length(results) + 1)
rank_frac <- (r - floor(rank))
(1 - rank_frac) * results[floor(rank)] + rank_frac * results[floor(rank) + 1]
```

The first line create the results. The `rep()` function repeats a variable, in this case 94 times and 5 times. The two vectors are concatenated in one vector, suing the `c()` function.

The second line determines the rank of the 95^th^ percentile in accordance with the Weibull method. 

The last line interpolates between the . If the rank is an integer, than that value is used because the fraction is 0. The `floor()` function removes the decimals from a number.

Q> Use the `nrow` and `ncol` functions to determine the size of the data frame.

The nrow and ncol function list the number of rows and columns for a data frame. The result sis a single number. The dim function shows both results in a vector of two numbers.

{format: r, line-numbers: false}
```
nrow(turbidity)
ncol(turbidity)
dim(turbidity)
```

Q> What is the result of the last sample taken in the turbidity? Hint, use the `nrow()` function.

To find the last element of the data frame, use the `nrow()` function within square brackets.

{format: r, line-numbers: false}
```
turbidity$Results[nrow(turbidity)]
```

Q> How many turbidity results in Bealiba are lower than to 0.5 NTU?

{format: r, line-numbers: false}
```
subset(turbidity, Results < 0.5 & Zone == "Bealiba")
```

Q> Plot the histogram of each of the Laanecoorie water quality zone.

To plot a part of the data, we need to first create a subset.

{format: r, line-numbers: false}
```
l <- subset(turbidity, Zone = "Laanecoorie")
b <- max(l$Result) / 0.1
hist(l$Result, breaks = b)
```

It can be tedious to have to repeat this several times for the same data. A more advanced method is to use a loop. R can also display more than one plot on one screen using the `par()` function. This function modifies various aspects of the plot screen. The `mfrow` option defines how the screen is split. In this case, the screen is divided in two by two plots.

The `for` function lets you loop through a vector, in this case the unique values of the water quality zone. The variable `z` is assigned each of the values of the water quality zones, which are then plotted as above.

{format: r, line-numbers: false} 
```
par(mfrow = c(2, 2))
for (z in unique(turbidity$Zone)) {
    l <- subset(turbidity, Zone = z)
	b <- max(l$Result) / 0.1
	hist(l$Result, breaks = b, main = z)
}
```

Q> What is the mean turbidity value for the samples in Bealiba?

{format: r, line-numbers: false} 
```
mean(turbidity$Result[turbidity$Zone == "Bealiba"])
```

Q> What is the third quartile for the turbidity of sample point 090A01?

{format: r, line-numbers: false} 
```
summary(turbidity$Result[turbidity$Sample_Point == "090A01"])
```

Q> Determine the 95^th^percentile using the Weibull method for all water quality zones in Laanecoorie.

{format: r, line-numbers: false} 
```
quantile(turbidity$Result, 0.95, method = 6) ## Weibull method
```

## Quiz 1: Water Quality Regulations
## Case Study: Customer Perception
Q> How many rows and columns of data does this data have?

The raw data has 691 rows and 57 columns.

{format: r, line-numbers: false}
```
dim(rawdata)
```

Q> How would you remove the unnecessary columns using base R code? columns.

Use the square brackets to indicate the columns you want to retain.

{format: r, line-numbers: false}
```
customer <- customers[, 20:56]
```

Q> Use the pipe construct to exclude the data from Los Angeles from the customer data and only retain the first 11 columns.

In the sequential version you would write:

{format: r, line-numbers: false}
```
la <- filter(customers, city_name == "Los Angeles")
la <- select(la, 1:12)
```

Using the pipe, it looks something like this:

{format: r, line-numbers: false}
```
la <- filter(customers, city_name == "Los Angeles") %>%
    select(1:12)
```




## Quiz: Customer Perception
## Case Study: Smart Meters
## Quiz: Smart Meters
