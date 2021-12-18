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
  
)


# Define server logic ####
server <- function(input, output) {
  
}


## Run the app ####
shinyApp(ui = ui, 
         server = server)