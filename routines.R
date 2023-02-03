overallfit <- function(traitdata, condition = TRUE) {
  if(condition) {
    formful <- formula(value ~ Strain * Sex * Condition)
    formred <- formula(value ~ Sex * Condition)
  } else {
    formful <- formula(value ~ Strain * Sex)
    formred <- formula(value ~ Sex)
  }
  fitful <- stats::lm(formful, traitdata)
  fitred <- stats::lm(formred, traitdata)
  ((broom::tidy(stats::anova(fitred, fitful)) %>%
      select(p.value))[2,])$p.value
}

broomit <- function(traitsdata, condition = TRUE) {
  map(
    split(traitsdata, traitsdata$trait),
    function(traitdata) {
      if(condition) {
        ct <- distinct(traitdata, Strain, Sex, Condition)
        ct <- count(ct, Sex, Condition)
      } else {
        ct <- distinct(traitdata, Strain, Sex)
        ct <- count(ct, Sex)
      }
      if(nrow(ct) < 4 | min(ct$n) < 2) {
        # Do nothing if any combination of Sex, Condition is empty.
        return(NULL)
      }
      if(condition)
        form <- formula(value ~ Strain * Sex * Condition)
      else
        form <- formula(value ~ Strain * Sex)
      fit <- stats::lm(form, traitdata)
      as_tibble(data.frame(
        overall = overallfit(traitdata, condition = condition),
        broom::tidy(stats::drop1(fit, fit, test = "F")) %>%
          filter(grepl("Strain", term)) %>%
          select(term, p.value) %>%
          pivot_wider(names_from = "term",
                      values_from = "p.value")))
    }) %>%
    bind_rows(.id = "trait")
}
