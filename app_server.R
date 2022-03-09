library("plotly")
library("dplyr")
library("tidyverse")
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(lintr)
library(styler)
library(ggplot2)
#fitbit_data <-read.csv("https://www.kaggle.com/feraco/sleep-deprivation?select=demdata_160225_pseudonymized.csv")
fitbit_data <- read.csv("~/_Code/final-project-starter-noah-rarick/data/Fitbit Experiment.csv")
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


render_sleep_quality <- function(input, output) {
  renderPlot(
  ggplot() +
      ggtitle("Relationship between Exercise (Calories Burnt) and Sleep Quality") +
      geom_line(aes(x = calories.burned, y = fitbit_ds2[, input$values], color = "Sleep"), size=1.5, 
                data = fitbit_ds2, group = 1) +
      geom_line(aes(x = calories.burned, y = `Time in Bed`, color = "Time in Bed"), size=1.5,
                data = fitbit_ds2, group = 1) +
      scale_y_continuous(breaks = seq(0,480,20)) +
      labs(x="Calories Burned (calories)", y="Minutes (mins)", title = "Minutes of Sleep Compared to Daily Calories Burnt") +
      scale_color_manual(name="Legend", values = c("Sleep" = "pink",
                                                   "Time in Bed" = "darkblue")),
  
  )
}



                                
server <- function(input, output) {
  
  output$bar_chart <- renderPlotly({
    # wrangle our data according to the widget
    plot_data <- data %>%
      drop_na(KSQ_SleepQualityIndex,HADS_Anxiety,AgeGroup)%>%
      summarise(KSQ_SleepQualityIndex,HADS_Anxiety,AgeGroup)%>%
      filter(KSQ_SleepQualityIndex <= input$sleep_quality[2],
             KSQ_SleepQualityIndex >= input$sleep_quality[1])
    
    fig <- plot_ly(plot_data, x = ~KSQ_SleepQualityIndex, y = ~HADS_Anxiety, color = ~AgeGroup, type = "bar") %>% 
      layout(boxmode = "group",title = 'The relation between sleep quality affected and anxiety level', xaxis = list(title = 'sleep quality of people'), 
             yaxis = list(title = 'anxiety level of people'), legend = list(title=list(text='<b> Overall sleep quality of people </b>')))
    return(fig)
  })
  output$sleep_quality <- render_sleep_quality(input, output)
      
  
  output$plot_text <- renderText("This graph is showing the relation between the self-reported anxiety level of people and their sleep quality. I have grouped the data by people's age group. The graph is a histogram that shows the range and spread of the data.   From the graph, we should be able to find how anxiety level and sleep quality affect each other and the difference between different age groups.  In the graph, we can see that both age group is having the sleep quality and anxiety level spread out. For old groups, they are having a smaller range of anxiety levels which we can see that all their anxiety level is maxed at 5. But for the young group, their self-reported anxiety level is more spread out and has a much larger anxiety level which the max has reached 11. So young is facing more pressure and reporting larger anxiety. Both age groups is having median sleep quality")
  output$plot_text_2 <- renderText("The implementation of the line chart data visualization is trying to prove the relationship between the amount of exercises and sleep quality. From the chart, we can see that when the daily calories start to increase, the minutes this person spent in deep sleep or regular sleep will be unstable. From my case, I don't see direct effects to sleep quality from increasing volume of doing exercises. But the minutes of deep sleep and minutes of staying asleep is proportional. From the side of this person, we can get a conclusion that the amount of exercises won't affect the person's sleep quality.
")
}




