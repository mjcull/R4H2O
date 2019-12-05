## Channel flow

## Measurements
b <- 0.6

## Constant
Cd <- 0.6 # approximation

## Question 1
h <- 0.1
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)  # m3 / s
q * 3600 * 24 / 1E3  # ML / day

## Question 2
h <- c(.15, .136, .075) # Heights in meters
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
mean(q) * 1000

## Question 3
h <- (50:500) / 1000
q <- (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
q

plot(h, q, type = "l")

## Fancy version using a function
kindsvater_carter <- function(b, h, Cd = 0.6) {
    (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
}

kindsvater_carter(0.6, 0.1)
