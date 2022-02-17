# a function that creates a list of summary statistics from the data set
sleep_data <- read.csv("../data/sleepdata.csv")
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

