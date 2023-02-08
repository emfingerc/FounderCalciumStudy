library(shiny)
devtools::install_github("byandell/foundr")
library(foundr)
devtools::install_cran("patchwork")

traitData <- readRDS("traitCondData.rds")
traitPvalue <- readRDS("traitCondPvalue.rds")
condition <- "sex"

#traitData <- readRDS("traitData.rds")
#traitPvalue <- readRDS("traitPvalue.rds")
#condition <- "sex_condition"
source("foundrIsletCalcium.R") # set up app Intro material

################################################################

ui <- foundr::foundrUI("Islet Calcium Study")

server <- function(input, output, session) {
  
  foundr::foundrServer(input, output, session,
                       traitData, traitPvalue, condition)
  
  # This runs, but it ignores facet for sex in distplot.
  # And does not facet by multiple traits.
  
  # Pairs plot seems to work sometime, and is faceting by sex.

  # Want to include traitsignal in place of foundrMean
  #                       readRDS("traitsignal.rds"))
  
  # Allow reconnect with Shiny Server.
  session$allowReconnect(TRUE)
}

shiny::shinyApp(ui = ui, server = server)
