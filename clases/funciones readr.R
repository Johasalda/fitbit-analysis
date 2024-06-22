library(tidyverse)
data("diamonds")
View(diamonds)

as_tibble(diamonds)
data()
data(mtcars)

readr_example()
read_csv(readr_example("mtcars.csv"))
library(readxl)

readxl_example()