
library(readr)
library(dplyr)
library(ggplot2)

# filter the dataset for the total number of checkouts by different checkout tyoes.
chart3_data <- X2017_2023_Data %>% 
  group_by(CheckoutType) %>% 
  summarize(sum_checkout = sum(Checkouts))

# Create a pie chart to compare the proportion of different checkout types.
c3 <- ggplot(chart3_data, aes(x="",
                              y = sum_checkout,
                              fill = CheckoutType)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "Proportion of Different Checkout Types", 
       x = "CheckoutType", 
       y = "sum_checkout", 
       color = "CheckoutType") +
  theme(plot.title = element_text(face = "bold", size = 18, hjust = 0.5))
