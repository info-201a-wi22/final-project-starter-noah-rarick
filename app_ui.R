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
  includeHTML("introduction.html"),
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

data <- read.csv("~/_Code/final-project-starter-noah-rarick/data/sleepdata.csv")

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
  includeHTML("summary.html")
)
index_page <- tabPanel(
  "Report",
  includeHTML(knitr::knit2html("~/_Code/final-project-starter-noah-rarick/docs/index.rmd", fragment.only = TRUE))
)


# UI
ui <- fluidPage('CO2 Consumption Worlwide', tabsetPanel(
              type = "tabs",
              introduction_page,
              visualization_page,
              visualization_page_two,
              summary_page,
              index_page,
  ))

