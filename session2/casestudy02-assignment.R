## R for Water Professionals
## Assignment: case study 2

## Question 1
turbidity <- read.csv("session2/turbidity_gormsey.csv")
turbidity$Date_Sampled <- as.Date(turbidity$Date_Sampled)

turbidity_2018 <- turbidity[turbidity$Date_Sampled >= as.Date("2018-01-01") & 
                            turbidity$Date_Sampled <= as.Date("2018-12-31"), ]

nrow(turbidity_2018)

## Question 5
quantile(turbidity_2018$Result[turbidity_2018$Zone == "Bellmoral"], 0.95, type = 6)
quantile(turbidity_2018$Result[turbidity_2018$Zone == "Merton"], 0.95, type = 6)
quantile(turbidity_2018$Result[turbidity_2018$Zone == "Pontybridge"], 0.95, type = 6)
quantile(turbidity_2018$Result[turbidity_2018$Zone == "Southwold"], 0.95, type = 6)
quantile(turbidity_2018$Result[turbidity_2018$Zone == "Swadlincote"], 0.95, type = 6)
quantile(turbidity_2018$Result[turbidity_2018$Zone == "Wakefield"], 0.95, type = 6)
