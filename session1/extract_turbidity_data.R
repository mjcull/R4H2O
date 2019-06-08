# Data extracted from Coliban Water data warehouse for session 1 case study
# See session.R for analysis

library(RODBC)

dwh <- odbcDriverConnect("driver={SQL Server};server=DWH;DATABASE=CW_DataWarehouse;trusted_connection=true")
turbidity <- sqlQuery(dwh, "SELECT Date_Sampled, Sample_No, Subsite_Code, Zone, Result, Units  
                                FROM WSL_retic_Sample_results 
                                WHERE Subsite_Type='Customer Tap' AND
                                    Measure='Turbidity' AND
                                    Date_sampled>='2017-01-01' AND 
                                    System='Laanecoorie'")
odbcCloseAll()

write.csv(turbidity, "CaseStudies/turbidity_laanecoorie.csv", row.names = FALSE)

