library(ggplot2)
library(dplyr)
library(tidyr)

here <- getwd()
setwd(here)
fitbit_data <- read.csv("../data/Fitbit Experiment.csv")
fitbit_ds1 <- fitbit_data[1:28,]
fitbit_ds2 <- fitbit_data[36:64, 1:9]
names(fitbit_ds2) <- fitbit_ds2[1,]
fitbit_ds2 <- fitbit_ds2[-1, 1:9]
fitbit_ds2 <- fitbit_ds2 %>%
  mutate(calories.burned = fitbit_ds1$Calories.Burned) %>%
  filter(`Minutes Deep Sleep` != "N/A")
fitbit_ds2$`Minutes Deep Sleep` <- as.numeric(fitbit_ds2$`Minutes Deep Sleep`)
fitbit_ds2$`Minutes Asleep` <- as.numeric(fitbit_ds2$`Minutes Asleep`)
fitbit_ds2$`Minutes Awake` <- as.numeric(fitbit_ds2$`Minutes Awake`)
fitbit_ds2$`Number of Awakenings` <- as.numeric(fitbit_ds2$`Number of Awakenings`)
fitbit_ds2$`Time in Bed` <- as.numeric(fitbit_ds2$`Time in Bed`)




g1 <- ggplot() + 
  ggtitle("Relationship between Exercises and Sleep Quality") +
  geom_line(aes(x = calories.burned, y = `Minutes Deep Sleep`, color = "Minutes Deep Sleep"), size=1.5, 
            data = fitbit_ds2, group = 1) +
  geom_line(aes(x = calories.burned, y = `Minutes Asleep`, color = "Minutes Asleep"), size=1.5, 
            data = fitbit_ds2, group = 1) +
  scale_y_continuous(breaks = seq(0,480,20)) +
  labs(x="Calories Burned (calories)", y="Minutes (mins)") +
  scale_color_manual(name="Legend", values = c("Minutes Deep Sleep" = "pink",
                                               "Minutes Asleep" = "darkblue"))
g1

