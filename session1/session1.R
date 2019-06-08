#########################################################
##                                                     ##
##  Writing Data Science Code for Water Professionals  ##
##                                                     ##
##                    Dr Peter Prevos                  ##
##                                                     ##
##               Session 1: Introduction to R          ##
##                Water Quality Regulations            ##
##                                                     ##
##  https://github.com/pprevos/RforWaterProfessionals  ##
##                                                     ##
#########################################################

# Load data
turbidity <- read.csv("session1/turbidity_laanecoorie.csv")

# Inspect data
turbidity
dim(turbidity)

head(turbidity)
tail(turbidity)
View(turbidity)

str(turbidity)

names(turbidity)
turbidity$Result

# Convert data
turbidity$Date_Sampled <- as.Date(turbidity$Date_Sampled)

# Explore data
table(turbidity$Zone)
max(turbidity$Result)
range(turbidity$Result)
summary(turbidity$Result)
unique(turbidity$Zone)

# Subset data
turbidity[1:10, 4:5]
names(turbidity)[4:5]
turbidity[1:10, c("Zone", "Result")]

turbidity$Zone == "Laanecoorie"

harcourt <- turbidity[turbidity$Zone == "Laanecoorie", ]
harcourt <- subset(turbidity, Zone == "Laanecoorie")
summary(harcourt$Result)

summary(harcourt$Result)

# Add data
turbidity$Comply <- turbidity$Result <= 5
turbidity$Comply

# Anlyse data
quantile(turbidity$Result, probs = 0.95, type = 5)

sapply(1:9, function(m) quantile(turbidity$Result, 0.95, type = m))

tapply(turbidity$Result, turbidity$Zone,
       function(x) sapply(1:9, function(m) quantile(x, 0.95, type = m)))

tapply(turbidity, turbidity$Zone, mean)

## Visualise data
boxplot(turbidity$Result)
hist(turbidity$Result)

boxplot(turbidity$Result ~ turbidity$Zone)
