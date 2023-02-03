library(shiny)
devtools::install_github("byandell/foundr")
library(foundr)

traitData <- readRDS("traitData.rds")
traitPvalue <- readRDS("traitPvalue.rds")
condition <- "sex"

userDatasets <- function() {
  c(calcium = "calcium trace measures & spectral density on 3 conditions",
    protein = "mRNA expression on liver (different mice)")
}

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
