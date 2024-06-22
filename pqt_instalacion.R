install.packages("here")

print(employee)

separate(employee, name, into=c("first_name", "last_name"), sep = " ")

install.packages("Tmisc")
data("quartet")
View(quartet)

install.packages("datasauRus")

install.packages("SimDesign")

View(penguins)

ggplot(data = penguins) +geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))

library(diamonds)

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut,fill=cut))

ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color=species))+
  facet_wrap(~species)

install.packages("tidyverse")
install.packages("Tmisc")
install.packages("plotly")

install.packages("plotly")

install.packages("palmerpenguins")
library(palmerpenguins)

install.packages("rmarkdown")

install.packages("flexdashboard")

