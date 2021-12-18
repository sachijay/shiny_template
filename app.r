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


## Themes ####
dark_theme <- bslib::bs_theme(bootswatch = "cyborg")
light_theme <- bslib::bs_theme(bootswatch = "simplex")
thematic::thematic_shiny(font = "auto")


## Define the UI ####
ui <- fluidPage(
  
  ## Set the theme
  theme = dark_theme,
  
  ## Horizontal rule
  hr(),
  
  ## App header 
  fluidRow(
    
    ## App title
    column(width = 8,
           titlePanel(title = tail(strsplit(here::here(), split = "/")[[1]], n = 1))
    ),
    
    ## Dark mode toggle
    column(width = 1, 
           offset = 3,
           div(
             style = "display: inline-block",
             materialSwitch(
               inputId = "dark_toggle",
               label = icon("moon"), 
               value = TRUE,
               status = "default")
           )
    )
  ),
  
  ## Horizontal rule
  hr(),
  
  ## Main panel
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
  )
)


# Define server logic ####
server <- function(input, output, session) {
  
  ## Test table
  output$table <- DT::renderDT({
    iris
  })
  
  ## Dynamically set the theme
  observeEvent(input$dark_toggle, {
    session$setCurrentTheme(
      if(input$dark_toggle){
        dark_theme
      } else{
        light_theme
      }
    )
  })
}


## Run the app ####
shinyApp(ui = ui, 
         server = server)