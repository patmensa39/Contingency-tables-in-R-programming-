#Contingeny table  ###
### loading the library
pacman::p_load(pacman, rio, tidyverse)

### Loading the dataset (Catergorical variables only)
data <- import("StateData.xlsx") %>% as_tibble() %>% 
        select(state_code, region, psychRegions) %>% 
        mutate(psychRegions = as.factor(psychRegions))
view(data)
attach(data)

### Creatinting a contingency table 
cont_table <- table(data$region, data$psychRegions)
cont_table

### By creating them in percentages, you will need magritta to help you 
p_load(magrittr)

### Creating row pecentages 
cont_table %>% prop.table(1) %>%  # 1 is using in creating row pecentages 
  round(2) %>% multiply_by(100)

### Creating row pecentages 
cont_table %>% prop.table(2) %>%  # 2 is using in creating column pecentages 
  round(2) %>% multiply_by(100)

### Total percentages 
cont_table %>% prop.table() %>%  # nothing is using in creating total pecentages 
  round(2) %>% multiply_by(100)

### Chi square test
chisq <- chisq.test(cont_table)
chi_sq

###Additional table
chi_sq$observed # Observed frequencies(same as cont_table)
chi_sq$expected # Expected frequencies
chi_sq$residuals # Pearson's residuals
chi_sq$stdres # Standardized residuals


