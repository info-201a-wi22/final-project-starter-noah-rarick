library("ggplot2")
library("dplyr")
library("plotly")
library("tidyr")

here <- getwd()
setwd(here)
data <-read.csv("../data/sleepdata.csv")
data <- data %>%
  drop_na(KSQ_SleepQualityIndex,HADS_Anxiety,AgeGroup)%>%
  summarise(KSQ_SleepQualityIndex,HADS_Anxiety,AgeGroup)
  
hist <- plot_ly(data, x = ~KSQ_SleepQualityIndex, y = ~HADS_Anxiety, color = ~AgeGroup, type = "box") %>% 
  layout(boxmode = "group",title = 'The relation between sleep quality affected and anxiety level', xaxis = list(title = 'sleep quality of people'), 
         yaxis = list(title = 'anxiety level of people'), legend = list(title=list(text='<b> Overall sleep quality of people </b>')))

