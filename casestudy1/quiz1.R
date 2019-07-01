## Quiz 1

## Correct answer key
## This code randomly generates the order of correct answers
set.seed(1)
sample(LETTERS[1:4], 10, replace = TRUE)

## Read data
gormsey <- read.csv("session2/gormsey.csv")

## Question 1: How many results does the Gormsey data contain?
dim(gormsey)
nrow(gormsey)

## Question2: How many E Coli results were recorded?
sum(gormsey$Measure == "E Coli")

## Question 3: What is the data type of the Zone field?
str(gormsey)

## Question 4: How many E Coli results breached the regulations?
nrow(gormsey[gormsey$Measure == "E Coli" & gormsey$Result > 0, ])

## Question 5: What is the median THM value for the Gormsey system?
median(gormsey$Result[gormsey$Measure == "THMs"])

## Question 6: Which zone has breached the Victorian regulations for THM?
boxplot(Result ~ Zone, data = subset(gormsey, Measure == "THMs"))
abline(h = 0.25, col = "red")
subset(gormsey, Measure == "THMs" & Result > 0.25)

## Question 7: How many sample points have been used in the Pontybridge zone?
length(unique(gormsey$Sample_Point[gormsey$Zone == "Pontybridge"]))

## Question 8: Which zone shows the highest level of turbidity?
turbidity <- subset(gormsey, Measure == "Turbidity")
boxplot(Result ~ Zone, data = turbidity)
turbidity[turbidity$Result == max(turbidity$Result), ]

## Question 9: What is the lowest level of turbidity measured in teh system?
min(turbidity$Result)

## Question 10: What is the 95^th^ percentile of the turbidity for each zone in the Gormsey system, using the Weibull method?
aggregate(turbidity$Result, list(turbidity$Zone), quantile, 0.95, method = 6)
