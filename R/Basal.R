BasalHarmony <- function(dataset, links, ...) {
  filename <- linkpath(dataset, links)
  
  # Data are in sheet 2 starting on line 1.
  # Matlab by animal (sheet 2)
  read_excel(filename, sheet = 2) %>%
    
    # Put key columns in front.
    select(Strain, Sex, Animal, condition, everything()) %>%
    
    # Rename to harmonize.
    rename(strain = "Strain",
           sex = "Sex",
           animal = "Animal") %>%
    
    # Pivot traits, which now begin after `condition`.
    pivot_longer(-(strain:condition),
                 names_to = "trait", values_to = "value") %>%
    
    # Filter out Basal, which will be in separate dataset.
    filter(condition == "Basal") %>%
    select(-condition) %>%
    
    # Normal scores by trait
    group_by(trait) %>%
    mutate(value = foundr::nqrank(value, jitter = TRUE)) %>%
    ungroup() %>%
  
    # Filter out missing and NaN values.
    filter(!is.na(value)) %>%
    filter(!is.nan(value))
}