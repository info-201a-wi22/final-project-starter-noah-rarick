# first widget: class types
# second widget: count how many rows are there in each class type
library("shiny")
library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)
library(lintr)
library(styler)
# class types

# class count range
# min value: min count of a class
# max: max count of a class

# FIRST WIDGET
introduction_page <- tabPanel(
  "Introduction",
  h2("Introduction"),
  p("_Sleep_Project_ is aiming to calculate trends between sleep quality and depression/anxiety.
     Sleep is incredibly important for an individual's wellbeing, however, is often overlooked as a driving factor in depression, anxiety and panic levels.
     This project will focus on data reported on individuals regarding depression, anxiety, panic, BMI and age and see how these factors are related to sleep quality.
     By analyzing these trends, hopefully it will become apparent what correlating factors either promote or reduce sleep quality. Our data sets come from two separate sources,
     one being from a Swedish study with hundreds of participants from all ages and backgrounds, this study collected hundreds of unique observations to summarize each participant.
     Our other data set comes from a single individual's fitbit data, we included this data as we wanted to have a more controlled data set when compared to our larger
        Swedish data set. As the data is only coming from one individual we can more closely examine the relationship between sleep and anxiety."),
  img(src="01-sleep-anxiety-cycle.png", height="50%", width="50%", align="middle")
)
country_input <- selectInput(
  inputId = "country",
  label = "Choose your country",
  choices = list("United States", "China", "Denmark", "Russia", "Sweden", "South Korea", "Canada")
)
co2_input <- selectInput(
  inputId = "yaxis",
  label = "Choose the Y Axis",
  choices = c("co2_per_capita", "oil_co2_per_capita", "cement_co2_per_capita", "coal_co2_per_capita"),
  multiple = FALSE
  
)

data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-noah-rarick/main/data/sleepdata.csv")

sleep_group <- data %>%
  drop_na(HADS_Anxiety,KSQ_SleepQualityIndex,AgeGroup)%>%
  summarise(HADS_Anxiety,KSQ_SleepQualityIndex,AgeGroup)


sleep_range <- range(sleep_group$KSQ_SleepQualityIndex)

anxiety_slider <- sliderInput(inputId = 'sleep_quality',
                              label = 'Range of sleep quality of people',
                              min = sleep_range[1],
                              max = sleep_range[2],
                              value = sleep_range,
                              step = 0.5)


visualization_page <- tabPanel(
  "Anxiety Levels and Sleep Quality",
  titlePanel("Anxiety Level Versus Sleep Quality"),
  sidebarLayout(
    sidebarPanel(anxiety_slider),
  mainPanel(
    h3("Anxiety Level Versus Sleep Quality"),
    plotlyOutput("bar_chart"),
    textOutput("plot_text")
)))
visualization_page_two <- tabPanel(
  "The Effects of Exercise on Sleep Quality",
  sidebarLayout(
    sidebarPanel(
    selectInput(
      inputId = "values",
      label = "Choose a factor to see the sleep quality",
      choices = c(
        "Minutes Deep Sleep",
        "Minutes Asleep"))),
  mainPanel(
    plotOutput("sleep_quality"),
    textOutput("plot_text_2")
  )))
summary_page <- tabPanel(
  "Summary",
  h2("Project Takeaways"),
p("Our intention in the beginning of the project was to find relationships between sleep quality and other factors such as a anxiety, depression, and daily habits such as exercise. However, what we found did not necessarily line up with our expectations. In the first data visualization, participants who had a reported sleep quality of ~5 had the highest anxiety scores. Participants with high sleep quality had similar anxiety levels to those with lower sleep quality. This throws off our original assumption that lower sleep quality is a driving factor in anxiety/depression. However, one pattern you can see from the first data visualization is that the young demographic had much higher anxiety scores at almost all sleep quality scores. With the second data visualization we were hoping to prove that exercise helped with deep sleep and sleep quality overall. However what we found is that when calorie expenditure increased, sleep minutes varied increasingly. Therefore, we cannot draw a relationship between minutes slept and calories burnt. Additionally, this data set was created from fitbit data for one individual, compared to the first data viz which used a large number of participants. So while burning more calories did not improve the sleep of this individual, it may for other individuals which could lead to a future research project to branch off from this one."),
)

report_page <- tabPanel(
  "Report Page",
  h2("Sleep Project"),
  h4("Author: "),
  h5("Noah Rarick noah.rarick@gmail.com"),
  h5("Qiyuan Pan qiyuap@uw.edu"),
  h5("Wenyu Jiao wenyuj2@uw.edu"),
  
  h3("Affiliation"),
  h5("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  h3("Date"),
  h5("3/8/2022"),
  
  h3("Abstract"),
  h6("How does an individual’s sleep quality effect their mental wellbeing regarding anxiety and depression levels? To address the question, we will compare the reported levels of anxiety and depression to reported sleep quality to see if there is a correlation between these factors. This is important because sleep is often overlooked by students as a possible factor in the depression and anxiety that students are facing at increasing levels."),
  h4("Keyword"),
  h6("Human physiology, Sleep quality, Depression and anxiety"),
  
  h3("Introduction"),
  h6("Sleep Project is aiming to calculate trends between sleep quality and depression/anxiety. Sleep is incredibly important for an individual’s wellbeing, however, is often overlooked as a driving factor in depression, anxiety and panic levels. This project will focus on data reported on individuals regarding depression, anxiety, panic, BMI and age and see how these factors are related to sleep quality. By analyzing these trends, hopefully it will become apparent what correlating factors either promote or reduce sleep quality. "),
  
  h3("Design situation"),
  h6("Sleep Project is hoping to provide insight to students on how sleep can positively or negatively affect mental wellbeing. In general, our goal is to provide statistical evidence that can influence student behavior to improve overall student body health. "),
  
  h3("Research questions"),
  h6("- How does sleep quality change through the different age ranges?"),
  h6("-Finding average sleep quality of the different age ranges and comparing the mean sleep quality."),
  h6("- What relationship does sleep quality have with anxiety? "),
  h6("-What are the levels of anxiety when sleep quality is low? Is the mean anxiety/depression score different among participants with above or below average sleep quality?"),
  h6("- How do reported levels of depression change as sleep quality decreases? "),
  h6("-Comparing the HADS depression scores across participants in relation to low, medium, and high sleep quality. "),
  
  h3("Dataset"),
  h6("Our data set is from Kaggle, produced from a Swedish study that unfortunately we cannot find the origin/publishers of. The data set has 106 columns for 91 participants and the elements that are researched range from HADS anxiety scores to sleep quality metrics to BMI and even participant info such as education level. 
The second data set is from data.world. It is a monthly experiment based on
a person's daily exercises. And the outcome is the daily sleep quality of this 
person. We used this dataset for figuring out how will exercise affect people's
sleep quality."),
  
  h3("Finding"),
  h6("Based on the dataset and analysis we did in the second part. We simply choose the most important factors that might affect sleep quality are the age range and sex. The first research question we are trying to resolve is the relationship between anxiety and sleep quality. And from the data we searched, we found that the group of old males had the highest sleep quality, they also had the highest depression scores. Additionally, while old females had the lowest sleep quality, they had the lowest depression scores. Both young males and females had the highest anxiety scores, much higher than that of old females who had worse sleep quality.
And for the relationship between HADS depression scores and low, medium, and high sleep quality. We found that Participants with below-average sleep quality had a HADS depression score of approximately 1.49, however, participants with above-average sleep quality had a HADS depression score of approximately .95. The same relationship can be seen in the HADS anxiety scores. Participants with below-average sleep quality had a HADS anxiety score of 2.91, however, participants with above-average sleep quality had a HADS anxiety score of 1.90. From this data, we can see that participants that had below-average sleep quality also suffered from depression and anxiety at higher scores. The final two statistics I calculated were depression between the age ranges. I calculated the mean depression scores for those classified as young, coming out to 1.15. However, participants classified as old had a very similar average depression score of 1.17. From these statistics, it seems as though sleep quality affects depression/anxiety much more than age.
On the first and third charts we made, we are trying to find how sleep quality changes through the different age ranges? 
We can see that as sleep quality diminishes, young individuals are more prone to experiencing higher levels of depression, while depression levels remain fairly consistent across different sleep quality values for old individuals. They also revealed that young people are more likely to be affected by anxiety levels since they will have a larger range and spread out in the graph. Young people are more likely to appear at a high level of anxiety and high sleep quality index while old people are more likely to appear at a low level for both levels.
The final research question we figure out is the relationship between exercise and sleep quality. In the second chart, we use the implementation of the line chart data visualization to see the relationship between the amount of exercise and sleep quality. From the chart, we can see that when the daily calories start to increase, the minutes this person spends in deep sleep or regular sleep will be unstable. From my case, I don’t see direct effects to sleep quality from the increasing volume of doing exercises. But the minutes of deep sleep and minutes of staying asleep are proportional. From the side of this person, we can get the conclusion that the number of exercises won’t affect the person’s sleep quality."),
  h3("Discussion"),
  h6("Sleep quality is very important. Because sleep heals and repairs the body that performs heavy daily functions during the day. Think of your body as a car that runs 16 hours during the day and can't keep running all the time in order to get back to normal. At the same time, sleep can also reduce the risk of disease. Sleep itself is a protective factor against disease. When people get too much or too little sleep, there is an increased risk of various diseases (such as heart disease and diabetes) and premature death. Sleep allows disease-causing cells to repair themselves. Sleep enhances creativity and cognitive function, the latter refers to people's mental abilities to learn, think, reason, remember, solve problems, make decisions and concentrate. Memories are reactivated during sleep, connections between brain cells are strengthened, and short-term memories are converted into long-term memories. Without enough quality sleep, people become forgetful.
Because of this, sleep quality is so important, and people should look for what is affecting sleep quality. Anxiety level and depression level are just a few aspects that people need to pay attention to. Functional connections exist between areas of the brain associated with short-term memory, self-awareness, and negative emotions. This functional connection allows people with depression to indulge in negative thoughts and can lead to poor sleep quality. Depression and sleep problems often go hand in hand. About 75% of people with depression report significant sleep disturbances, such as difficulty falling asleep and not getting enough sleep time (insomnia). People with insomnia have a higher risk of depression and anxiety disorders than people who sleep normally. This shows that depression and insomnia will appear in combination. They are like a vicious cycle that will keep getting worse if not stopped. So this study is to show people what the anxiety level, depression level, and sleep quality of different people are like. This kind of display can intuitively tell people the connection between anxiety, depression, and sleep. I think this also promotes people to pay more attention to their sleep quality after seeing this kind of data. At the same time, people can have a general understanding of their current sleep status by looking for a classification that matches their own, and judging by the general trend of the classification and their actual situation. This awareness helps people spot the problem when it's small and correct it. This way people don't have a vicious cycle of depression and insomnia."),
  
  h3("Conclusion"),
  h6("At the end of the project, we found that when people are experiencing higher levels of depression, they are more likely to have lower sleep quality. And the age range’s effect on sleep quality is not remarkable. The factor that is more likely to affect sleep quality will be the anxiety level which can be presented by HADS anxiety scores. The higher anxiety scores you got, the worse sleep quality you will get. And we had no clue that sleep quality is related to daily calories burned(exercises level). So based on our research, we concluded that anxiety and depression will affect sleep quality. However, this conclusion can only represent a small number of people since the dataset is limited to 90 individuals from Germany and the age range is only from 20-30 and 65 to 75 years old."),
  
  h3("Limitations") ,
  h6("Some limitations that we may encounter derive from the fact that the participant pool is limited to individuals from Germany, this means that the data set would not be a good representation of the public as it doesn't account for other demographics of individuals. Another limitation is the age range involving the participants in the study. By only studying young individuals (20 - 30 years old) and old individuals (65 - 75 years old), the data's representation of analyzing the detriments of sleep quality is again, limited to only a subset of the population. Another limitation derives from the way in which the researchers accounted for an individual's sleep quality. By utilizing self-reports via sleep index and knowing that everyone has a different interpretation of what constitutes the quality of one's sleep, it makes it difficult to fully make sense of the data. The Karolinska Sleepiness Scale (KSS) implemented can vary in results depending on multiple parameters, such as earlier sleeping windows and time across participants, making it difficult to ensure the test-retest reliability. "),
  
  h3("Acknowledgements"),
  h6("Thank you to Christy Brown, who helped Vincent look for research materials on sleep deprivation and its effects on mental wellbeing."),
  
  h3("References"),
  h6("Additional information for this study were extracted from a research project at the Saveh University of Medical Sciences which was supported by Social Determinants of Health Research Center. The funders had no role in study design. “The Association between Internet Addiction, Sleep Quality, and Health-Related Quality of Life among Iranian Medical Students.” Taylor &amp; Francis, https://www.tandfonline.com/doi/full/10.1080/10550887.2020.1762826. 

CyberSightings | Cyberpsychology, Behavior, and Social ... https://www.liebertpub.com/doi/abs/10.1089/cyber.2015.29015.csi. 

“Neurobehavioral Functioning in Obstructive Sleep Apnea: Differential Effects of Sleep Quality, Hypoxemia and Subjective Sleepiness.” Taylor &amp; Francis, https://www.tandfonline.com/doi/abs/10.1076/jcen.26.1.43.23929. 

Woods, Heather Cleland, and Holly Scott. “#Sleepyteens: Social Media Use in Adolescence Is Associated with Poor Sleep Quality, Anxiety, Depression and Low Self-Esteem.” Journal of Adolescence, Academic Press, 10 June 2016, https://www.sciencedirect.com/science/article/pii/S0140197116300343#bib17. 

“Explore Scientific, Technical, and Medical Research on ScienceDirect.” ScienceDirect.com | Science, Health and Medical Journals, Full Text Articles and Books., https://www.sciencedirect.com/. ")
)

# UI")
ui <- fluidPage('CO2 Consumption Worlwide', tags$head(
  # Note the wrapping of the string in HTML()
  tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Yusei+Magic&display=swap');
      body {
        background-color: black;
        color: white;
      }
      h2 {
        font-family: 'Yusei Magic', sans-serif;
      }
      p {
        font-family: 'Times New Roman', Times, serif;
      }
      .shiny-input-container {
        color: #474747;
      }"))
),
tabsetPanel(
              type = "tabs",
              introduction_page,
              visualization_page,
              visualization_page_two,
              summary_page,
              report_page
              
  ))

