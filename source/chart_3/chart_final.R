library("ggplot2")
library("dplyr")
setwd("~/Documents/INFO201Assign/final-project-starter-noah-rarick/source/chart_3")
data <-read.csv("demdata_160225_pseudonymized.csv")

a <- ggplot(data, aes(x = KSQ_SleepQualityIndex, y = HADS_Anxiety, colour=AgeGroup),position = "dodge")+
  geom_boxplot()+
  ggtitle("the relationship between sleep quality and anxiety that on different agegroup") +
  xlab("KSQ_SleepQualityIndex") + ylab("HADS_Anxiety")
a
