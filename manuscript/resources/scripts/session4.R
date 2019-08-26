## Visualisations for sssion 4

## Load data
library(tidyverse)
gormsey <- read_csv("casestudy1/gormsey.csv")
str(gormsey)

## Basics
ggplot(gormsey, aes(Measure)) + 
    geom_bar()
ggsave("manuscript/resources/session4/gormsey_measures.png", width = 8, height = 6)

## Add colour
ggplot(gormsey, aes(Measure)) + 
    geom_bar(fill = "chocolate4")
ggsave("manuscript/resources/session4/gormsey_measures_col.png", width = 8, height = 6)

# Aesthethics
ggplot(gormsey, aes(Measure, fill = Zone)) + 
    geom_bar()
ggsave("manuscript/resources/session4/gormsey_measures_zones.png", width = 8, height = 6)

# Coords flipped
ggplot(gormsey, aes(Zone, fill = Measure)) + 
    geom_bar() + 
    coord_flip()
ggsave("manuscript/resources/session4/gormsey_zones.png", width = 8, height = 6)

## Columns
turbidity_merton <- subset(gormsey, Zone == "Merton" & Measure == "Turbidity")
samples <- as.data.frame(table(turbidity_merton$Sample_Point))
names(samples) <- c("Sample_Point", "Samples")
samples <- subset(samples, Samples != 0)
                  
ggplot(samples, aes(Sample_Point, Samples)) +
    geom_col() 
ggsave("manuscript/resources/session4/gormsey_turbidity_merton.png", width = 8, height = 6)

## Recreate this chart using the bar geom.
ggplot(turbidity_merton, aes(Sample_Point)) + geom_bar()

## Use the aggregate and length functions to create a data frame that count the number of samples for each analyte (measure) and visualise it with a bar chart
measures <- aggregate(list(Samples = gormsey$Sample_No), 
                      list(Measure = gormsey$Measure), length)
ggplot(measures, aes(Measure, Samples)) + 
    geom_col()



## Time series
class(gormsey$Date_Sampled)
gormsey$Date_Sampled <- as.Date(gormsey$Date_Sampled)
class(gormsey$Date_Sampled)

thm <- subset(gormsey, Measure == "THMs")

## abline
mx <- which(thm$Result >= 0.25)

ggplot(thm, aes(Date_Sampled, Result)) +
    geom_line() + 
    geom_hline(yintercept = .25, col = "red") + 
    geom_vline(xintercept = thm$Date_Sampled[mx], col = "blue") + 
    geom_vline(xintercept = as.Date("2018-03-01"), col = "green")
ggsave("manuscript/resources/session4/gormsey_thm_time_series.png", width = 8, height = 6)

## Add the trend line the THM timeseries. Experiment with the two different methods.
ggplot(subset(gormsey, Measure == "THMs"), aes(Date_Sampled, Result)) +
    geom_line() +
    geom_hline(yintercept = .25, col = "red") +
    geom_smooth(method = lm) +
    geom_smooth(method = loess, col = "green") 

ggsave("manuscript/resources/session4/gormsey_thm_trend.png", width = 8, height = 6)



ggplot(gormsey, aes(Zone, Result)) + geom_boxplot() + coord_flip()

## boxplot
turbidity <- subset(gormsey, Measure == "Turbidity" & Zone == "Merton" | Zone == "Southwold")


ggplot(turbidity, aes(Zone, Result)) + 
    geom_boxplot()

ggplot(thm, aes(Zone, Result)) + 
    geom_boxplot() + 
    coord_flip() + 
    geom_hline(yintercept = 0.25, col = "red")
ggsave("manuscript/resources/session4/gormsey_thm_zone.png", width = 8, height = 6)


## Facets
ggplot(gormsey, aes(Date_Sampled, Result, col = Measure)) + 
    geom_line() + 
    facet_wrap(~Measure, scales = "free_y")


ggsave("manuscript/resources/session4/gormsey_thm_turbidity.png", width = 8, height = 6)

## Themes
library(gridExtra)
p <- ggplot(gormsey, aes(Measure)) + geom_bar()
a <- p + theme_classic(base_size = 22)+ ggtitle("theme_clasic()")
b <- a + theme_bw(base_size = 22) + ggtitle("theme_bw()")
c <- a + theme_dark(base_size = 22) + ggtitle("theme_dark()")
d <- a + theme_void(base_size = 22) + ggtitle("theme_void()")

png("manuscript/resources/session4/themes.png", width = 1024, height = 1024)
grid.arrange(a, b, c, d)
dev.off()
