install.packages("ggplot2")
library(ggplot2)

install.packages("readxl")
library(readxl)
data <- read_excel("C:/Users/akshata/Desktop/DV/2018_Data.xlsx")

print(colnames(data))

ggplot(data, aes(x = `Median Family Income`, 
                 y = `Perc with health Insurance`, 
                 size = `Unemployment Rate`)) +
  geom_point(color = "blue", shape = 3) + 
  scale_size_continuous(range = c(1, 10)) +  
  labs(title = "Income VS Health Insurance Coverage",
       x = "Median Family Income",
       y = "Health Insurance Coverage",
       size = "Unemployment Rate") +
  theme_minimal()
