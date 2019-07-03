## Caste Study 2: Customer Perception

## Load the Tdyverse
library(tidyverse)

## Load the data
rawdata <- read_csv("casestudy2/Customer_Perception_USA.csv")
rawdata

## How many rows and columns of data does this data have?
dim(rawdata)

## Clean the data
customers <- rawdata[-1, ]
customers <- type_convert(customers)
str(customers)

table(rawdata$term)

rawdata$term

is.na(customers$term)

customers <- filter(customers, is.na(term))
customers <- select(customers, c(1, 20:56))

## How do you remove the unnecessary rows and columns using base R code?
customers_base <- rawdata[-1, ]
customers_base <- customers_base[is.na(customers_base$term), c(1, 20:56)]

names(customers) == names(customers_base)
nrow(customers) == nrow(customers_base)

## Join cities
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
    rename(id = V1, City = city_name) %>%
    select(-city)

## Use the three approaches to exclude the data from Los Angeles and only retain the first 11 columns.
la <- filter(customers, City == "Los Angeles")
la <- select(la, 1:11)

la <- select(filter(customers, City == "Los Angeles"), 1:11)

la <- filter(customers, City == "Los Angeles") %>%
    select(1:11)

## Join coordinates to Gormsey data
sample_points <- read_csv("casestudy1/sample_points.csv")
gormsey <- read_csv("casestudy1/gormsey.csv")
gormsey <- left_join(gormsey, sample_points)

## Visualise the sample points
ggplot(gormsey, aes(x, y, col = Zone)) + 
    geom_point(size = 3) + 
    labs(title = "Gormsey Sample Points")
ggsave("manuscript/resources/session5/gormsey_sample_points.png", width = 8, height = 6)

# Variables with 0 or 1
select(customers, contains("0"), contains("1"))

## Isolate involvement data
pii <- select(customers, id, City, starts_with("p", ignore.case = FALSE))
pii[, c(1, 2, 7, 8, 9, 10) + 2] <- 8 - pii[, c(1, 2, 7, 8, 9, 10) + 2]

## Tidy data
pii <- gather(pii, "Item", "Score", -id, -City)

## Service quality data
sq <- select(customers, id, City, starts_with("t0", ignore.case = FALSE), starts_with("f", ignore.case = FALSE))
sq <- gather(sq, "Item", "Score", -id, -City)

## Visualise PII
ggplot(pii, aes(Item, Score)) +
    geom_boxplot(fill = "dodgerblue", col = "dodgerblue4") +
    labs(title = "Personal Involvement Index for Tap Water",
         subtitle = "Item Scores") + 
    theme_minimal()
ggsave("manuscript/resources/session5/pii_boxplot.png", width = 8, height = 6)


 
