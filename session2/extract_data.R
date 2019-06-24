## Data extracted from Coliban Water data warehouse for session 2 case study

library(RODBC) ## Connect to SQL databases
library(tidyverse)

dwh <- odbcDriverConnect("driver={SQL Server};server=DWH;DATABASE=CW_DataWarehouse;trusted_connection=true")
turbidity <- sqlQuery(dwh, "SELECT Date_Sampled, Sample_No, System, Zone, Subsite_Code AS Sample_Point, Result, Units  
                                FROM WSL_retic_Sample_results 
                                WHERE Subsite_Type='Customer Tap' AND
                                    Measure IN ('Turbidity', 'THM') AND
                                    Date_sampled>='2017-01-01' AND 
                                    System IN ('Laanecoorie', 'Bendigo')")
odbcCloseAll()

## Save laanecoorie data
filter(turbidity, System == "Laanecoorie" & Measure == "Turbidity") %>%
    write_csv("session2/turbidity_laanecoorie.csv")

## Create fake data
zones <- filter(turbidity, System == "Bendigo") %>%
    distinct(Zone)

gormsey_zones <- tibble(Zone = zones$Zone,
                        Zone2 = c("Southwold",
                                "Wakefield",
                                "Tarnstead",
                                "Blancathey",
                                "Swadlincote",
                                "Merton",
                                "Snake's Canyon",
                                "Bellmoral",
                                "Paethsmouth",
                                "Pontybridge",
                                "Strathmore"))

gormsey <- right_join(turbidity, gormsey_zones) %>%
    select(Date_Sampled, Sample_No, Sample_Point, Zone = Zone2, Result, Units)

n <- 100
set.seed(1969)
gormsey[sample(1:nrow(gormsey), n), "Result"] <- runif(n, 4, 6)
gormsey$Date_Sampled <- as.Date(gormsey$Date_Sampled)

tapply(gormsey$Result, gormsey$Zone, 
       function(x) quantile(x, 0.95, type = 6))

write_csv(gormsey, "session2/turbidity_gormsey.csv")
