library(shiny)
devtools::install_cran("plotly") # plotly not yet on UW dataviz
devtools::install_cran("markdown") # markdown not yet on UW dataviz
devtools::install_cran("cowplot") # patchwork not yet on UW dataviz
devtools::install_cran("patchwork") # patchwork not yet on UW dataviz
devtools::install_github("byandell/foundr")
library(foundr)

traitData <- readRDS("traitData.rds")
traitStats <- readRDS("traitStats.rds")
traitSignal <- readRDS("traitSignal.rds")
customSettings <- list(
  help = "help.md",
  dataset = c(
    calcium = "Calcium traits",
    protein = "Liver proteins",
    basal = "Basal measurements",
    uploaded = "Uploaded"))

################################################################

ui <- foundr::foundrUI("Islet Calcium Study")

server <- function(input, output, session) {
  
  foundr::foundrServer(input, output, session,
                       traitData, traitStats, traitSignal,
                       customSettings)
  
  # Allow reconnect with Shiny Server.
  session$allowReconnect(TRUE)
}

shiny::shinyApp(ui = ui, server = server)
