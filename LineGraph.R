setwd("C:/Users/Acer/OneDrive/Documents/AssignmentsActivities Files/mth/Rstudio Examples")
getwd()
data <- read.csv("mth_1.csv")
data
summary(data)
library(ggplot2)
ggplot(data, aes(x = `Ave.Grd`, y = `Respondent.No.`)) + 
  geom_line()+
  xlab("Average Grade") + 
  ylab("Respondent Number") + 
  scale_y_continuous(breaks = seq(0, 30, by = 3))