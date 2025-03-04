# This is the UI for an interactive map of mackerel egg data

library(shiny)
library(leaflet)
library(gamair) # contains mackerel dataset
library(shinythemes)

# User interface
ui <- fluidPage(
  theme = shinytheme("darkly"),
  titlePanel("Spatial data in leaflet: Mackerel eggs"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "which_var",
        label = "Which environmental variable to show:",
        choiceValues = c("salinity", "flow", "temp.surf"),
        choiceNames = c("Salinity", "Flow", "Surface temperature")
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          "Map",
          leafletOutput("mymap"),
          p()
        ),
        tabPanel(
          "Correlation",
          plotOutput("user_corr")
        ),
        tabPanel(
          "Another map",
          leafletOutput("new_map")
        )
      )
    )
  )
)
