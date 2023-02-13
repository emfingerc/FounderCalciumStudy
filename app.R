library(shiny)
devtools::install_cran("plotly") # plotly not yet on UW dataviz
devtools::install_cran("patchwork") # patchwork not yet on UW dataviz
devtools::install_github("byandell/foundr")
library(foundr)

traitData <- readRDS("traitData.rds")
traitStats <- readRDS("traitStats.rds")
traitSignal <- readRDS("traitSignal.rds")

source("foundrIsletCalcium.R") # set up app Intro material

################################################################

ui <- foundr::foundrUI("Islet Calcium Study")

server <- function(input, output, session) {
  
  foundr::foundrServer(input, output, session,
                       traitData, traitStats, traitSignal)
  
  # Allow reconnect with Shiny Server.
  session$allowReconnect(TRUE)
}

shiny::shinyApp(ui = ui, server = server)
