data<-read.csv("./spaceship-titanic/train.csv")

# Display the summary statistics of numerical columns
summary(data)

# Perform specific analyses based on your goals
# For example, you can calculate the average age for transported and non-transported passengers
aggregate(Age ~ Transported, data = data, FUN = mean)

# You can create visualizations using packages like ggplot2
# For example, a boxplot of Age based on VIP status
library(ggplot2)
ggplot(data, aes(x = VIP, y = Age, fill = VIP)) +
  geom_boxplot() +
  labs(title = "Boxplot of Age based on VIP status", x = "VIP", y = "Age")

# Calculate the percentage of transported vs. non-transported passengers
prop.table(table(data$Transported)) * 100
# Calculate the average age of VIP and non-VIP passengers
aggregate(Age ~ VIP, data = data, FUN = mean)
# Create a contingency table to analyze the relationship between VIP status and room service usage
table(data$VIP, data$RoomService)

# Calculate the total shopping mall spending for transported passengers
total_shopping_spending <- sum(data$ShoppingMall[data$Transported])
total_shopping_spending

# Calculate the correlation matrix for numerical variables
cor_matrix <- cor(data[, c("Age", "RoomService", "FoodCourt", "ShoppingMall", "Spa", "VRDeck")])
cor_matrix

print("DONE!")

