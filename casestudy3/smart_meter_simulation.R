## Digital Metering Simulation

## Libraries
library(tidyverse)

## Boundary conditions
n <- 100 # Number of simulated meters
d <- 366 # Number of days to simulate
s <- as.POSIXct("2069-12-09", tz = "UTC") # Start of simulation

set.seed(1969) # Seed random number generator for reproducibility
rtu <- paste0("RTU", sample(1E6:2E6, n, replace = FALSE)) # 6-digit id
offset <- sample(0:3599, n, replace = TRUE) # Unique Random offset for each RTU

## Generic Diurnal Curve
diurnal <- tibble(TimeADT = 0:23,
                  Flow = round(c(1.36, 1.085, 0.98, 1.05, 1.58, 3.87,
                                 9.37, 13.3, 12.1, 10.3, 8.44, 7.04,
                                 6.11, 5.68, 5.58, 6.67, 8.32, 10.0,
                                 9.37, 7.73, 6.59, 5.18, 3.55, 2.11)) - 1)

ggplot(diurnal, aes(TimeADT, Flow)) + 
    geom_line(col = "dodgerblue2") +
    scale_x_continuous(breaks = 0:23) + ylab("Flow [L/h/p]") + 
    ggtitle("Model diurnal curve for per person")
ggsave("manuscript/resources/model-diurnal.png", dpi = 300)

## Occupants
set.seed(123)
occupants <- rpois(n, 1.5) + 1 # Number of occupants per connection
as.tibble(occupants) %>%
  ggplot(aes(occupants)) + geom_bar(fill = "dodgerblue2", alpha = 0.5) + 
  xlab("Occupants") + ylab("Properties") + ggtitle("Occupants per connection")
ggsave("manuscript/resources/occupants.png", dpi = 300)

# Leak simulation
set.seed(456)
leaks <- rbinom(n, 1, prob = .1) * sample(10:50, n, replace = TRUE)
tibble(DevEUI = rtu, Leak = leaks) %>%
    filter(Leak > 0)

# Digital metering data simulation
sim <- matrix(ncol = 3, nrow = 24 * n * d)
colnames(sim) <- c("DevEUI", "TimeStampAST", "Count")

for (i in 1:n) {
    r <- ((i - 1) * 24 * d + 1):(i * 24 * d)
    sim[r, 1] <- rep(rtu[i], each = (24 * d))
    sim[r, 2] <- seq.POSIXt(s, by = "hour", length.out = 24 * d) + offset[i]
    sim[r, 3] <- round(cumsum((rep(diurnal$Flow * occupants[i], d) + leaks[i]) *
                                      runif(24 * d, 0.9, 1.1) / 5))
} 

meter_reads <- as.tibble(meter_reads) %>% 
    mutate(TimeStampAST = as.numeric(TimeStampAST),
        TimeStampAST = as.POSIXct(TimeStampAST, origin = "1970-01-01", tz ="UTC"))

## MISSING DATA POINTS

## Initialise temp variable
meter_reads <- mutate(meter_reads, remove = 0)

## Define faulty RTUs (2% of fleet)
set.seed(123)
faulty <- rtu[rbinom(n, 1, prob = 0.02) == 1]
meter_reads$remove[meter_reads$DevEUI %in% faulty] <- rbinom(sum(meter_reads$DevEUI %in% faulty), 1, prob = .95)

## Data loss
missing <- sample(1:(nrow(meter_reads) - 5), 0.01 * nrow(meter_reads))
for (m in missing){
  meter_reads[m:(m + sample(1:5, 1)), "remove"] <- 1
}

## Remove data points
meter_reads <- filter(meter_reads, remove == 0) %>%
  select(-remove)

## Store data
write.csv(meter_reads, "Hydroinformatics/DigitalMetering/meter_reads.csv", row.names = FALSE)

## Visualise
filter(meter_reads, DevEUI %in% rtu[2]) %>%
  mutate(TimeStampAEST = as.POSIXct(format(TimeStampUTC, 
                                           tz = "Australia/Melbourne"))) %>%
  filter(TimeStampAEST >= as.POSIXct("2020-02-06") & 
         TimeStampAEST <= as.POSIXct("2020-02-08")) %>%
  arrange(DevEUI, TimeStampAEST) %>% 
  ggplot(aes(x = TimeStampAEST, y = Count, colour = factor(DevEUI)))  + 
    geom_line() + geom_point() 

ggsave("Hydroinformatics/DigitalMetering/consumption.png", dpi = 300)



