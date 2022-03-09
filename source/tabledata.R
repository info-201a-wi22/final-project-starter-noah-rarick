sleep_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-noah-rarick/main/data/sleepdata.csv")
View(sleep_data)
library("dplyr")
sleep_table <- sleep_data %>%
               select(AgeGroup, Sex, BMI1, HADS_Anxiety, HADS_Depression, KSQ_SleepQualityIndex) %>%
               group_by(AgeGroup, Sex) %>%
               summarize(avg_depression = mean(HADS_Depression),
               avg_sleep_quality = mean(KSQ_SleepQualityIndex),
               avg_anxiety = mean(HADS_Anxiety))
sleep_table = sleep_table[-5,]
               
names(sleep_table) <- c("Age Group", "Sex", "Average Depression", "Average Sleep Quality", "Average Anxiety")
                                                                                                                           

