install.packages("readxl")
install.packages("ggplot2")

library(readxl)
library(ggplot2)




data <- read_excel("C:/Users/divya/OneDrive/Desktop/DV/Python/Combined.xlsx", sheet = "Pasco")
print(colnames(data))

colnames(data) <- c("Date", "Daily_Cases", "Moving_Average")
data$Date <- as.Date(data$Date, format = "%d-%b-%y")

ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Daily_Cases, color = "Daily Cases"), linewidth = 1) +
  geom_line(aes(y = Moving_Average, color = "Moving Average"), linewidth = 1, linetype = "dashed") +
  scale_color_manual(values = c("Daily Cases" = "green", "Moving Average" = "blue")) +
  labs(title = "Daily Cases and Moving Average in Pasco County",
       x = "Date",
       y = "Number of Cases",
       color = "Legend") +
  theme_minimal()



data_hillsborough <- read_excel("C:/Users/divya/OneDrive/Desktop/DV/Python/Combined.xlsx", sheet = "Hillsborough")
colnames(data_hillsborough) <- c("Date", "Daily_Cases", "Moving_Average")

data_hillsborough$Date <- as.Date(data_hillsborough$Date, format = "%B %d, %Y")

ggplot(data_hillsborough, aes(x = Date)) +
  geom_col(aes(y = Moving_Average), fill = "maroon", color = "red", alpha = 0.6) +  
  geom_line(aes(y = Daily_Cases), color = "darkblue", linewidth = 1) +                
  labs(title = "Daily Cases and Moving Average in Hillsborough County",
       x = "Date",
       y = "Number of Cases") +
  theme_minimal()
