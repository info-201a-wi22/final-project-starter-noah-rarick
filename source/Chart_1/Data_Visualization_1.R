library("ggplot2")
library("dplyr")
library("tidyr")
library("plotly")
setwd("~/Documents/_Code/final-project-starter-noah-rarick/source/Chart_1")
sleep_data <- read.csv("../../data/sleepdata.csv")
View(sleep_data)
 
 getwd()
  
  sleep_depression_age <- sleep_data %>% 
  select(id, AgeGroup, HADS_Depression, KSQ_SleepQualityIndex) 
  


sleep_depression_age_plot <- ggplot(sleep_depression_age) +
  geom_col(mapping = aes(x = KSQ_SleepQualityIndex, y = HADS_Depression, fill = AgeGroup), position = "dodge") + 
  
  labs(
    title = "Sleep Quality versus Depression Levels Based on Age", 
    x = "Sleep Quality of Individual",
    y = "Depression Level of Individual",
    color = "Urbanity"
  )

ggplotly(sleep_depression_age_plot)



