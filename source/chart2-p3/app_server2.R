fitbit_data <- read.csv("Fitbit Experiment.csv")
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
  return(renderPlotly(ggplotly(
      ggplot() +
      ggtitle("Relationship between Exercises and Sleep Quality") +
      geom_line(aes(x = calories.burned, y = fitbit_ds2[, input$values], color = "Sleep"), size=1.5, 
                data = fitbit_ds2, group = 1) +
      geom_line(aes(x = calories.burned, y = `Time in Bed`, color = "Time in Bed"), size=1.5,
                data = fitbit_ds2, group = 1) +
      scale_y_continuous(breaks = seq(0,480,20)) +
      labs(x="Calories Burned (calories)", y="Minutes (mins)") +
      scale_color_manual(name="Legend", values = c("Sleep" = "pink",
                                                   "Time in Bed" = "darkblue"))
  )))
}
server <- function(input, output) {
  output$sleep_quality <- render_sleep_quality(input, output)}




