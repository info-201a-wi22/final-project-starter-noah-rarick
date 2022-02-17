sleep_data <- read.csv("data/sleepdata.csv")
View(sleep_data)
library("dplyr")
sleep_table <- sleep_data %>%
               select(AgeGroup, Sex, BMI1, HADS_Anxiety, HADS_Depression, KSQ_SleepQualityIndex) %>%
               group_by(AgeGroup, Sex) %>%
               summarize(avg_depression = mean(HADS_Depression),
               avg_sleep_quality = mean(KSQ_SleepQualityIndex),
               avg_anxiety = mean(HADS_Anxiety))
               
               
View(sleep_table)
                                                                                                                           

