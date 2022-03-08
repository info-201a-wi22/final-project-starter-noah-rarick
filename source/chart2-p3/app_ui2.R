Sleep_quality_chart <- tabPanel(
  "The sleep quality regarding to exercises",
  fluidPage(
    titlePanel("The sleep quality regarding to exercises"),
    p(
      "The chart below shows how Sleep quality is related to Exercises level"
    ),
   
    selectInput(
      inputId = "values",
      label = "Choose a factor to see the sleep quality",
      choices = c(
        "Minutes Deep Sleep",
        "Minutes Asleep"
      )
    ),
    
    
    plotlyOutput(outputId = "sleep_quality")
  )
)

ui <- navbarPage(
  "Sleep quality",
  Sleep_quality_chart
)