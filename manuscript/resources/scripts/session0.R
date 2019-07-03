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



## Digital Meters
