library(ggplot2)
library(dplyr)
library(tidyr)
library(readxl)
MTH <- read_excel("AssignmentsActivities Files/mth/Rstudio Examples/MTH.xlsx")
View(MTH)
Gender <-c(MTH$Gender)
Question_one <-c(MTH$Q1)
Question_two<-c(MTH$Q2)
Question_three<-c(MTH$Q3)
subset_MTH <- MTH %>%
  select(Gender, Question_one, Question_two, Question_three)

avg_MTH <- subset_MTH %>%
  group_by(Gender) %>%
  summarize(Question_One = mean(Question_one, na.rm = TRUE),
            Question_Two = mean(Question_two, na.rm = TRUE),
            Question_Three = mean(Question_three, na.rm = TRUE))

avg_MTH_long <- avg_MTH %>%
  pivot_longer(cols = starts_with("Question"), names_to = "Question", values_to = "Average")

avg_MTH_long$Gender <- factor(avg_MTH_long$Gender, labels = c("1", "2"))

ggplot(avg_MTH_long, aes(x = Gender, y = Average, fill = Question)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Bar Graph - Clustered Questions by Gender",
       x = "Sex",
       y = "Q1,Q2, and Q3 ",
       fill = "Question") +
  theme_minimal() +
  scale_x_discrete(labels = c("1" = "1", "2" = "2")) +
  scale_y_continuous(breaks = seq(1, 5, by = 1), limits = c(0,5))