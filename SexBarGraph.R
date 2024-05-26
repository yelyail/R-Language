library(ggplot2)
library(dplyr)
library(reshape2)

setwd("C:/Users/Acer/OneDrive/Documents/AssignmentsActivities Files/mth/Rstudio Examples")
df_engine_types <- read.csv("mth_1.csv", header = TRUE, sep = ",")

temp <- select(df_engine_types, matches("Other"))
new_engineTypes <- melt(temp, id.vars = "asses1")

areaChart <- ggplot(new_engineTypes, aes(x = asses1, y = value, fill = variable)) +
  geom_area() +
  scale_fill_manual(values = c("#ef2026")) + 
  labs(title = "Area Chart for Assessment 1",
       x = "Assessment",
       y = "Value")

print(areaChart)
