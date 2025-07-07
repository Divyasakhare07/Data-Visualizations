install.packages("readxl")
install.packages("ggplot2")
library(readxl)
library(ggplot2)

data <- read_excel("C:/Users/divya/OneDrive/Desktop/DV/Python/Car Sales.xlsx")

filtered_data <- data[data$CountryName %in% c("United Kingdom", "Germany", "France"), ]

total_sales <- aggregate(SalePrice ~ Make + CountryName, data = filtered_data, FUN = sum)

ggplot(total_sales, aes(x = Make, y = SalePrice, fill = CountryName)) +
  geom_col(position = "dodge") +
  labs(title = "Total Sales by Make for  United Kingdom,Germany, and France",
       x = "Make",
       y = "Total Sale Price (USD)",
       fill = "Country") +
  theme_minimal()
