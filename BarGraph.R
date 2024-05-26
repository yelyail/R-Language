setwd("C:/Users/Acer/OneDrive/Documents/AssignmentsActivities Files/mth/Rstudio Examples")
getwd()
data <- read.csv("mth_1.csv")
data
summary(data)
str(data)
library(ggplot2)
data <- na.omit(data)
program_levels <- c("Information Technology", "Computer Science", "Information System", "Multimedia Arts")

# Convert 'Program' column to factor with specified levels
data$Program <- factor(data$Program, levels = program_levels)

p <- ggplot(data, aes(x = Program, fill = Program)) + 
  geom_bar(color = "gray") +  
  xlab("Program") + 
  ylab("Count of Respondents") + 
  scale_y_continuous(breaks = seq(0, 30, by = 3), limits = c(0, 30)) +
  scale_fill_manual(values = c("Information Technology" = "lightpink", 
                               "Computer Science" = "darkblue", 
                               "Information System" = "lightgreen", 
                               "Multimedia Arts" = "darkgreen"),labels = program_levels)

# Print the plot
print(p)