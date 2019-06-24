## Create illustrations for course summary of book
## used in manuscript/manuscript/session0.md

library(tidyverse)

## Turbidity
turbidity <- read_csv("session2/turbidity_laanecoorie.csv")

ggplot(turbidity, aes(Result, fill = Zone)) +
    geom_histogram(binwidth = .1) +
    facet_wrap(~Zone) +
    labs(title = "Laanecoorie customer tap turbidity",
         subtitle = "2017\U2012 2018") +
    theme_minimal()

ggsave("manuscript/resources/introduction/turbidity.png", width = 6, height = 4)

## Consumers
rawdata <- read_csv("session3/Customer_Perception_USA.csv")

pii <- rawdata[-1, ] %>%
    type_convert() %>%
    filter(is.na(term)) %>%
    select(22:31)
pii[,c(1,2,7,8,9,10)] <-8 - pii[,c(1,2,7,8,9,10)]

pii_cor <- cor(pii, use = "complete.obs") %>%
    as_tibble() %>%
    mutate(Item1 = names(pii)) %>%
    gather("Item2", "Correlation", -Item1)

ggplot(pii_cor, aes(Item1, Item2, fill = Correlation)) +
    geom_tile() +
    scale_fill_gradient2(low = "red", high = "blue", mid = "white", 
                         midpoint = 0, limit = c(-1,1), space = "Lab", 
                         name="Pearson\nCorrelation") +
    labs(title = "Personal Involvement Index",
         subtitle = "Item intercorrelation") + 
    theme_minimal()

ggsave("manuscript/resources/introduction/involvement.png", width = 4, height = 4)

## Digital Meters
