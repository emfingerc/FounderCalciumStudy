userDatasets <- function() {
  list(
    "There are three conditions for calcium measurements (8G, 8G/QLA, 8G/QLA/GIP)",
    "but no conditions for protein mRNA measurements in liver.",
    "Conditions and trait are combined for calcium (such as 8G:freq_8_1) or separate for calcium8G.",
    "Distinct mice were assayed for calcium and protein (4 for strain and sex).",
    tags$ul(
      tags$li("calcium: calcium traces & spectral density with condition"),
      tags$li("protein: islet protein expression"),
      tags$li("calcium8G: calcium traces & spectral density by condition")),
    "See also",
    shiny::a("Attie Lab Diabetes Database", href = "http://diabetes.wisc.edu/"),
    "and",
    "GigHub:", shiny::a("byandell/FounderCalciumStudy",
                        href = "https://github.com/byandell/FounderCalciumStudy"))
}
