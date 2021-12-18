##++++++++++++++++++++++++++++++++++++++++++##
##                                          ##
## This file is the main source for the app ##
##                                          ##
##++++++++++++++++++++++++++++++++++++++++++##


## Install packages ####
# source("r_src/install_packages.r")


## Load libraries ####
library(shiny)
library(shinyWidgets)


## Define the UI ####
ui <- fluidPage(
  
  ## Horizontal rule
  hr(),
  
  ## App header 
  fluidRow(
    
    ## App title
    column(10,
           titlePanel(title = tail(strsplit(here::here(), split = "/")[[1]], n = 1))
    ),
    
    ## Dark mode toggle
    column(2,
           panel(
             materialSwitch(
               inputId = "dark_toggle",
               label = icon("moon"), 
               value = TRUE,
               status = "default"
             )
           )
    )
    
  ),
  
  ## Horizontal rule
  hr(),
  
  # theme = shinythemes::shinytheme("darkly"),
  mainPanel(
    tabsetPanel(
      type = "tabs",
      tabPanel(
        title = "Table",
        icon = icon("table"),
        tags$br(),
        DT::DTOutput("table")
      )
    )
    # checkboxInput(
    #   inputId = "themeToggle",
    #   label = icon("sun")
    # )
  )
)


# Define server logic ####
server <- function(input, output) {
  output$table <- DT::renderDT({
    iris
  })
}


## Run the app ####
shinyApp(ui = ui, 
         server = server)