## Session 1 assignments

## Tidyverse
library(tidyverse)
turbidity <- read_csv("session1/turbidity_laanecoorie.csv")

ggplot(turbidity, aes(Result, fill = Zone)) +
    geom_histogram(binwidth = 0.1) +
    facet_wrap(~Zone) +
    labs(title = "Castlemaine System",
         subtitle = "2018")
ggsave("manuscript/images/turbidity-distribution.png")
