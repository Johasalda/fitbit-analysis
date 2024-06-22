rename(diamonds, carat_new = carat)
summarize(diamonds, mean_carat = mean(carat))
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point()
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point()
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  facet_wrap(~cut)
installed.packages()
library(class)
browseVignettes("ggplot2")
