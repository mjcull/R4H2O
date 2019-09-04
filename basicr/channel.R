## Channel flow

## Measurements
b <- 0.3 
h <- c(.125, .1, .05) # Heights in meters

## Constant
Cd <- 0.6 # approximation

## Kindsvater-Carter
q = (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)

q * 3600 * 2400 / 1E6


h <- (0:300/1000)
flow = (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2) * 3600 * 24 / 1E6

plot(h, flow, type = "l", main = "Channel flow (b = 300, Cd = 0.6)")

## Fancy version
kindsvater_carter <- function(b, h, Cd = 0.6) {
    (2/3) * Cd * sqrt(2 * 9.81) * b * h^(3/2)
}

kindsvater_carter(0.3, 0.1)


