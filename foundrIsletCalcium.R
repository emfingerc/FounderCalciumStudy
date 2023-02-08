userDatasets <- function() {
  list(
    "There are three conditions for calcium measurements (8G, 8G/QLA, 8G/QLA/GIP)",
    "but no conditions for protein mRNA measurements in liver.",
    "This instance conjoins the calcium conditions and trait as in 8G:freq_8_1.",
    "Mice for calcium and protein are different (32 for each).",
    tags$ul(
      tags$li("calcium: calcium trace measures & spectral density on 3 conditions"),
      tags$li("protein: mRNA expression on liver")),
    "See also",
    shiny::a("Attie Lab Diabetes Database", href = "http://diabetes.wisc.edu/"),
    "and",
    "GigHub:", shiny::a("byandell/FounderCalciumStudy",
                        href = "https://github.com/byandell/FounderCalciumStudy"))
}