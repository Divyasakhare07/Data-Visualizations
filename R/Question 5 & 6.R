install.packages("readxl")
install.packages("ggplot2")
library(readxl)
library(ggplot2)
install.packages("dplyr") 
library(dplyr)

library(readxl)
data_part1 <- read_excel("C:/Users/divya/OneDrive/Desktop/DV/Python/2020 Cases only.xlsx")
data_part2 <- read_excel("C:/Users/divya/OneDrive/Desktop/DV/Python/2021 Cases only.xlsx")

head(data_part1)
head(data_part2)

data <- bind_rows(data_part1, data_part2)
head(data)


filtered_data <- daily_cases %>%
  filter(County %in% c("Polk", "Charlotte", "Flagler", "Jefferson")) %>%
  mutate(County = factor(County, levels = c("Polk", "Charlotte", "Flagler", "Jefferson")))

plot <- ggplot(filtered_data, aes(x = EventDate, y = Daily_Cases)) +
  geom_line(color = "blue") +  # Set the color for all lines
  facet_wrap(~ County, ncol = 2) +
  labs(title = "Daily Cases by County",
       x = "Date",
       y = "Daily Cases") +
  theme_minimal()


print(plot)
