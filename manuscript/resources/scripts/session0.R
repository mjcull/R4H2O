## Create illustrations for course summary of book

library(tidyverse)

## Turbidity
turbidity <- read_csv("casestudy1/turbidity_laanecoorie.csv")

ggplot(turbidity, aes(Result, fill = Zone)) +
    geom_histogram(binwidth = .1) +
    facet_wrap(~Zone) +
    labs(title = "Laanecoorie drinking water system customer tap turbidity",
         subtitle = "2017\U2012 2018") +
    theme_minimal()

ggsave("manuscript/resources/session0/turbidity.png", width = 6, height = 4)

## Consumers
rawdata <- read_csv("casestudy2/Customer_Perception_USA.csv")

pii <- rawdata[-1, ] %>%
    type_convert() %>%
    filter(is.na(term)) %>%
    select(22:31) 

pii[,c(1,2,7,8,9,10)] <-8 - pii[,c(1,2,7,8,9,10)]

gather(pii, "Item", "Score") %>%
    ggplot(aes(Item, Score)) +
    geom_boxplot(fill = "dodgerblue") +
    labs(title = "Personal Involvement Index for Tap Water",
         subtitle = "Item Scores") + 
    theme_minimal()

ggsave("manuscript/resources/session0/involvement.png", width = 4, height = 4)

## Digital Meters
