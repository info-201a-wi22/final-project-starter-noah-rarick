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
              
  ))

