## Caste Study 2: Customer Perception

## Load the Tdyverse
library(tidyverse)

## Load the data
rawdata <- read_csv("casestudy2/Customer_Perception_USA.csv")
names(rawdata)
dim(rawdata)

## Clean the data
customers <- rawdata[-1, ]
customers <- type_convert(customers)
str(customers)

table(rawdata$term)

rawdata[is.na(rawdata$term), ]
customers <- filter(customers, is.na(term))

customer <- customers[, c(1, 20:56)]
customers <- select(customers, c(1, 20:56))

cities <- tibble(city = 1:3,
                 city_name = c("Los Angeles", "Denver", "Boston"))
customers <- left_join(customers, cities)


## Excell style
left_join(select(filter(type_convert(rawdata[-1, ]), is.na(term)), c(1, 20:56)), cities)

## The data pipe
customers <- rawdata[-1, ] %>%
    type_convert() %>%
    filter(is.na(term)) %>%
    select(c(1, 20:56)) %>%
    left_join(cities) %>%
    rename(id = V1)

la <- filter(customers, city_name == "Los Angeles")
la <- select(la, 1:12)

la <- customers %>%
    filter(city_name == "Los Angeles") %>%
    select(1:12)

## Isolate involvement data
pii <- select(customers, id, City = city_name, starts_with("p", ignore.case = FALSE))
pii[, c(1, 2, 7, 8, 9, 10) + 2] <- 8 - pii[, c(1, 2, 7, 8, 9, 10) + 2]
pii

## Tidy data
pii <- gather(pii, "Item", "Score", -id, -City)

## Explore the data
ggplot(pii, aes(City)) + geom_bar()
ggsave("manuscript/resources/session5/cities.png")

ggplot(pii, aes(City)) + geom_bar(fill = "dodgerblue")

ggplot(pii, aes(Score)) +
    geom_histogram(binwidth = 1) +
    labs(title="Personal Involvement Index")

ggplot(pii, aes(Score, fill = City)) +
    geom_histogram(binwidth = 1) +
    facet_grid(Item ~ City) + 
    labs(title = "Personal Involvement Index",  
         subtitle = "United Stated of America, 2014")
ggsave("manuscript/resources/session5/pii_overview.png")

## Lab data
read_csv("casestudy1/turbidity_laanecoorie.csv") %>%
    ggplot(aes(Result, fill = Zone)) +
    geom_histogram(binwith = 0.1) +
    facet_wrap(~Zone) + 
    labs(title = "Laanecoorie network turbidity data",
        subtitle = "2018")



 
