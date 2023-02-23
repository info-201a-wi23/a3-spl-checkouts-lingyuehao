 
library(dplyr)
library(ggplot2)
library(scales)

# calculate the average checkouts for these four Material Types by year
avg_checkouts <- X2017_2023_Data %>%
  filter(MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "AUDIOBOOK" | MaterialType == "VIDEODISC") %>% 
  group_by(MaterialType, year = as.numeric(format(date, "%Y"))) %>%
  summarize(avg_checkouts = mean(Checkouts))

# create a line plot to display the trend over time
c2 <- ggplot(avg_checkouts,
             aes(x = year,
                 y = avg_checkouts,
                 color = MaterialType)) +
  geom_line() +
  labs(title = " Average Checkouts of Different Material Types ",
       x = "Year",
       y = "The number of Average Checkouts") +
  scale_color_manual(values = c("green", "blue", "red", "orange")) +
  theme(plot.title = element_text(face = "bold", size = 17, hjust = 0.6))

