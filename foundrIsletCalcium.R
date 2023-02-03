userDatasets <- function() {
  c(calcium = "calcium trace measures & spectral density on 3 conditions",
    protein = "mRNA expression on liver (different mice)")
}

userScatplot <- function(trait, traitdata, pair) {
  # Return empty plot if traits in pair are not in trait vector
  traits <- unique(unlist(stringr::str_split(pair, " ON ")))
  if(!all(traits %in% trait)) {
    return(ggplot2::ggplot())
  }
  datatypes <- dplyr::distinct(traitdata, datatype, trait)

  dat <- 
    purrr::map(
      pair,
      function(x) {
        # Split trait pair by colon
        x <- stringr::str_split(x, " ON ")[[1]][2:1]
        
        # If x's are from different datatypes for this experiment, need to reduce to means.
        difsets <- unique(dplyr::filter(datatypes, trait %in% x)$datatype)
        if(length(difsets) > 1) {
          # reduce to means
          dataf <- 
            dplyr::ungroup(
              dplyr::summarize(
                dplyr::group_by(
                  traitdata,
                  datatype, trait, strain, sex),
                value = mean(value, na.rm = TRUE)))
        } else {
          dataf <- traitdata
        }
        # Remove datatype
        dataf <- dplyr::select(dataf, -datatype)
        # reorganize data
        dataf <- 
          dplyr::filter(
            tidyr::pivot_wider(
              dplyr::filter(
                dataf,
                trait %in% c(x[1],x[2])),
              names_from = "trait", values_from = "value"),
            # Make sure x and y columns have no missing data.
            !(is.na(.data[[x[1]]]) | is.na(.data[[x[2]]])))
        
        # create plot
        foundr::scatplot(dataf, x[1], x[2], shape_sex = TRUE) +
          ggplot2::facet_grid(. ~ sex)
      })
  
  # Patch plots together by rows
  patchwork::wrap_plots(dat, nrow = length(dat))
}

userData <- function(datatraits, trait) {
  ltrait <- length(trait)
  dplyr::mutate(
    datatraits,
    trait = abbreviate(trait, ceiling(60 / ltrait)))
}

# foundrMean is replaced by traitsignal object. Need to rethink.

userMean <- function(datatraits) {
  dplyr::arrange(
    tidyr::pivot_wider(
      dplyr::mutate(
        dplyr::ungroup(
          dplyr::summarize(
            dplyr::group_by(datatraits, strain, sex, trait),
            value = mean(value, na.rm = TRUE), .groups = "drop")),
        value = signif(value, 4)),
      names_from = "strain", values_from = "value"),
    trait, sex)
}
