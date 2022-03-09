# a function that creates a list of summary statistics from the data set
library(dplyr)
sleep_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-noah-rarick/main/data/sleepdata.csv")
library("dplyr")
summary_info <- list()
summary_info$average_sleep_quality <- mean(sleep_data$KSQ_SleepQualityIndex)
summary_info$below_average_sleep_depression <- sleep_data %>%
  filter(KSQ_SleepQualityIndex < summary_info$average_sleep_quality) %>%
  summarize(mean(HADS_Depression))
summary_info$below_average_sleep_depression <- pull(summary_info$below_average_sleep_depression)
summary_info$above_average_sleep_depression <- sleep_data %>%
  filter(KSQ_SleepQualityIndex > summary_info$average_sleep_quality) %>%
  summarize(mean(HADS_Depression))
summary_info$above_average_sleep_depression <- pull(summary_info$above_average_sleep_depression)
summary_info$below_average_sleep_anxiety <- sleep_data %>%
  filter(KSQ_SleepQualityIndex < summary_info$average_sleep_quality) %>%
  summarize(mean(HADS_Anxiety))
summary_info$below_average_sleep_anxiety <- pull(summary_info$below_average_sleep_anxiety)
summary_info$above_average_sleep_anxiety <- sleep_data %>%
  filter(KSQ_SleepQualityIndex > summary_info$average_sleep_quality) %>%
  summarize(mean(HADS_Anxiety))
summary_info$above_average_sleep_anxiety <- pull(summary_info$above_average_sleep_anxiety)
summary_info$young_depression <- sleep_data %>% 
  filter(AgeGroup == "Young") %>%
  summarize(mean(HADS_Depression))
summary_info$young_depression <- pull(summary_info$young_depression)
summary_info$old_depression <- sleep_data %>%
  filter(AgeGroup == "Old") %>%
  summarize(mean(HADS_Depression))
summary_info$old_depression <- pull(summary_info$old_depression)
names(summary_info) <- c("Average Sleep Quality", "Below Average Sleep Depression", "Above Average Sleep Depression","Above Average Sleep Anxiety",  "Below Average Sleep Anxiety", "Young Depression", "Old Depression")

summary_info
