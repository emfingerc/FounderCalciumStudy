ProteinHarmony <- function(dataset, links, ...) {
  filename <- linkpath(dataset, links)
  
  # Data are in sheet 3 starting on line 3.
  proteinData <- read_excel(filename, sheet = 3, skip = 2) %>%
    select(ID, Gene.mes, "129.1.F":"WSB.9.F") %>%
    unite(trait, Gene.mes, ID, na.rm = TRUE) %>%
    
    # Pivot traits, which now begin after `trait`.
    pivot_longer(-trait, names_to = "animal", values_to = "value") %>%
    
    # Extract `strain` and `sex` from animal column.
    mutate(strain = str_remove(animal, "\\..*$"),
           sex = str_remove(animal, "^.*\\.")) %>%
    
    # Remove NAs and do log10 transform
    filter(!is.na(value)) %>%
    mutate(value = log10(value)) %>%
    
    # Select harmonized columns in order.
    select(strain, sex, animal, trait, value) %>%
    
    # Normal scores by trait
    group_by(trait) %>%
    mutate(value = foundr::nqrank(value, jitter = TRUE)) %>%
    ungroup()
}