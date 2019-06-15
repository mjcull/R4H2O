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
rawdata <- read_csv("session2/Customer_Perception_USA.csv")
dim(rawdata)
names(rawdata)
str(rawdata)

rawdata
View(rawdata)

## Clean the data
customers <- rawdata[-1, ]
customers <- type_convert(customers)
str(customers)

table(rawdata$term, useNA ="always")
customers <- filter(customers, is.na(term))
customers <- select(customers, 20:56)
dim(customers)

cities <- tibble(city = 1:3,
                 city_name = c("Los Angeles", "Denver", "Boston"))
customers <- left_join(customers, cities)


## Excell style
left_join(select(filter(type_convert(rawdata[-1, ]), is.na(term)), 20:56), cities)

## The data pipe
customers <- rawdata[-1, ] %>%
    type_convert() %>%
    filter(is.na(term)) %>%
    select(20:56) %>%
    left_join(cities)

## Isolate involvement data
pii <- select(customers, City = city_name, starts_with("p", ignore.case = FALSE))
write_csv(pii, "session2/personal_involvement_index.csv")

## Explore the data
ggplot(pii, aes(City)) + geom_bar()
ggsave("manuscript/images/cities.png")

ggplot(pii, aes(City)) + geom_bar(fill = "dodgerblue")

ggplot(pii, aes(p1)) +
    geom_histogram(binwidth = 1) +
    labs(title="Personal Involvement Index")

## Lab data
read_csv("session1/turbidity_laanecoorie.csv") %>%
    filter(Zone == "Laanecoorie") %>%
    ggplot(aes(Result)) +
    geom_histogram(binwith = 0.1) +
    labs(title = "Laanecoorie turbidity data",
        subtitle = "2018")



gather(pii, "item", "value", -city) %>%
    ggplot(aes(value, fill = city)) +
    geom_histogram(binwidth = 1) +
    facet_grid(item~city)

ggplot(ntu, aes(Result)) + geom_histogram(binwidth = 0.1) + facet_wrap(~Zone)
