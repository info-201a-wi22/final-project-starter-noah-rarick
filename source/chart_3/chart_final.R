library("ggplot2")
library("dplyr")

data <-read.csv("sleepdata.csv")

a <- ggplot(data, aes(x = KSQ_SleepQualityIndex, y = HADS_Anxiety, colour=AgeGroup),position = "dodge")+
  geom_boxplot()+
  ggtitle("the relationship between sleep quality and anxiety that on different agegroup") +
  xlab("KSQ_SleepQualityIndex") + ylab("HADS_Anxiety")
a
