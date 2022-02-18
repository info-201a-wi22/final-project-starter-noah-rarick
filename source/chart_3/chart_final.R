library("ggplot2")
library("dplyr")
library("plotly")


data <-read.csv("../data/sleepdata.csv")

scatter <- ggplot(data, aes(x = KSQ_SleepQualityIndex, y = HADS_Anxiety, colour=AgeGroup),position = "dodge")+
  geom_point()+
  ggtitle("the relationship between sleep quality and anxiety that on different agegroup") +
  xlab("KSQ_SleepQualityIndex") + ylab("HADS_Anxiety")
scatter
ggplotly(scatter)
