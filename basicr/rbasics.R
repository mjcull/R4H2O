## R Basics

## Introduction
3 - 3 * 6 + 2

x <- -10:10
y <- x^2

sum(x)

plot(x, y, type = "l")

a <- c(12, 3, -23, 45, 2, 99, 1, 0)
mean(a)

a * 2

## Apply functions to vector
abs(a)

exp(a)

factorial(a)

log(a, base = 10)

sqrt(a)

sum(a)

prod(a)

min(a)

max(a)

## Plot parabola
a <- -1 
b <- -2
c <- 3

x1 <- (-b + sqrt(b^2 - 4 * a * c)) / (2 * a)
x2 <- (-b - sqrt(b^2 - 4 * a * c)) / (2 * a)

x <- seq((x1 - 2), (x2 + 2), .1)
y <- -(a * x)^2 + b * x + c
plot(x, y, type = "l")

abline(h = 0, col = "grey")
abline(v = 0, col = "grey")
points(c(x1, x2), c(0, 0), col = "red", pch = 19)


