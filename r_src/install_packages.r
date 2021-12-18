##########################################################
##                                                      ##
## This file install necessary packages for the project ##
##                                                      ##
##########################################################



## Install packages from CRAN ####
## `shiny` - Package for the shiny app
## `shinyWidgets` - Package for additional widgets for the app
## `plotly` - Package for interactive plotting
## `here` - Easy file referencing

cran_packages <- c("shiny",
                   "shinyWidgets",
                   "plotly",
                   "here")
if (length(missing_pkgs <- setdiff(cran_packages, rownames(installed.packages()))) > 0) {
  message("Installing missing package(s): ", 
          paste(missing_pkgs, collapse = ", "))
  install.packages(missing_pkgs, 
                   repos = "https://cloud.r-project.org")
} else {
  message("All CRAN packages already installed!")
}
rm(cran_packages, missing_pkgs)