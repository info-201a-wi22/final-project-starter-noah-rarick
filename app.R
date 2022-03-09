# load packages
library(shiny)
library(ggplot2)
library(tidyverse)
library(lintr)
library(styler)
library(evaluate)

# source both ui and server
source("app_ui.R")
source("app_server.R")
# FIRST WIDGET

# run shiny app
shinyApp(ui = ui, server = server)


# class count range
# min value: min count of a class
# max: max count of a class

