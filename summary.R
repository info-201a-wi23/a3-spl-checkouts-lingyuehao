
library(readr)
library(dplyr)
library(ggplot2)

recent_date <- X2017_2023_Data %>% 
  summarise(max = max(date))
recent_date


ave_ebook <- X2017_2023_Data %>%
  filter(MaterialType == "EBOOK") %>% 
  summarise(ebook_mean = mean(Checkouts))
ave_ebook

ave_book <- X2017_2023_Data %>%
  filter(MaterialType == "BOOK") %>% 
  summarise(book_mean = mean(Checkouts))
ave_book


title_most_checkouts_ebook <- X2017_2023_Data %>% 
  filter(MaterialType == "EBOOK") %>% 
  group_by(Title) %>% 
  summarise(total_checkouts = sum(Checkouts))
title_most_checkouts_ebook$Title[which.max(title_most_checkouts_ebook$total_checkouts)]

title_most_checkouts_book <- X2017_2023_Data %>% 
  filter(MaterialType == "BOOK") %>% 
  group_by(Title) %>% 
  summarise(total_checkouts = sum(Checkouts))
title_most_checkouts_book$Title[which.max(title_most_checkouts_book$total_checkouts)]


ebook_18 <- X2017_2023_Data %>% 
  filter(MaterialType == "EBOOK") %>% 
  summarize(num_18 = sum(date >= "2018-01-01" & date < "2019-01-01"))
pull(ebook_18)

ebook_19 <- X2017_2023_Data %>% 
  filter(MaterialType == "EBOOK") %>% 
  summarize(num_19 = sum(date >= "2019-01-01" & date < "2020-01-01"))
pull(ebook_19)
 
ebook_20 <- X2017_2023_Data %>% 
  filter(MaterialType == "EBOOK") %>% 
  summarize(num_20 = sum(date >= "2020-01-01" & date < "2021-01-01"))
pull(ebook_20)

ebook_21 <- X2017_2023_Data %>% 
  filter(MaterialType == "EBOOK") %>% 
  summarize(num_17 = sum(date >= "2021-01-01" & date < "2022-01-01"))
pull(ebook_21)

  
