
library(readr)
library(dplyr)
library(ggplot2)
library(scales)

# download the dataset
X2017_2023_Data <- read_csv("2017-2023 Data.csv")
X2017_2023_Data

# create a new column "date" and update the sataset
X2017_2023_Data <- X2017_2023_Data %>% 
  mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))
X2017_2023_Data$date <- as.Date(X2017_2023_Data$date, format = "%Y-%m-%d")

# Filter the data for books and eBooks.
book_ebook_data <- X2017_2023_Data %>%
  filter(MaterialType %in% c("EBOOK", "BOOK"))

# Compute the total checkouts by year and material type.
total_checkouts <- book_ebook_data %>%
  group_by(MaterialType, year = as.numeric(format(date, "%Y"))) %>%
  summarize(total_checkouts = sum(Checkouts))

# Create the bar chart to compare the differences and trends of these two types of item by year.
c1 <- ggplot(total_checkouts, 
             aes(x = year,
                 y = total_checkouts,
                 fill = MaterialType)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Total Checkouts of Books and E-Books by Year",
       x = "Year",
       y = "The Number of Checkouts") +
  scale_y_continuous(labels = label_number_si()) +
  scale_fill_manual(values = c("red", "blue")) +
  theme(plot.title = element_text(face = "bold", size = 17, hjust = 0.5))
