#########################################################
##                                                     ##
##  Writing Data Science Code for Water Professionals  ##
##                                                     ##
##                    Dr Peter Prevos                  ##
##                                                     ##
##               Session 2: The Tidyverse              ##
##             Cleaning and Exploring Data             ##
##                                                     ##
##  https://github.com/pprevos/RforWaterProfessionals  ##
##                                                     ##
#########################################################
                                             
## Load the Tdyverse
library(tidyverse)

## Load the data
rawdata <- read_csv("CaseStudies/Customer_Perception_USA.csv")
dim(rawdata)
names(rawdata)
rawdata
rawdata[ ,20:54]
t(rawdata[1, ])
View(rawdata)

## Clean the data
customers <- rawdata[-1, ]

rawdata$term
table(rawdata$term)
customers <- filter(customers, is.na(term))

cities <- tibble(city = 1:3,
                 city_name = c("Los Angeles", "Denver", "Boston"))
customers <- left_join(customers, cities)

customers <- select(customers, 20:56)
customers <- type_convert(customers)

# Excell style
left_join(type_convert(select(filter(rawdata[-1, ], is.na(term)), 20:56)), cities)

## The data pipe
customers <- rawdata[-1, ] %>%
    filter(is.na(term)) %>%
    select(20:56) %>%
    type_convert() %>%
    left_join(cities)

## Isolate involvement data
pii <- select(customers, city = city_name, starts_with("p", ignore.case = FALSE))
write_csv(pii, "personal_involvement_index.csv")

## Explore the data
ggplot(pii, aes(city)) + geom_bar()

ggplot(pii, aes(p1)) +
    geom_histogram(binwidth = 1)

gather(pii, "item", "value", -city) %>%
    ggplot(aes(value, fill = city)) +
    geom_histogram(binwidth = 1) +
    facet_grid(item~city)
