#To ensure work reproducibility
set.seed(9)

diabetes<- read.csv('~/Downloads/diabetes.csv')

sample_data <- diabetes[sample(nrow(diabetes), 25), ]

View(sample_data)

mean_value_sample <- mean(sample_data$Glucose)
highest_value_sample <- max(sample_data$Glucose)
mean_value_diabetes <- mean(diabetes$Glucose)
highest_value_diabetes <- max(diabetes$Glucose)


df <- data.frame(Max_Mean=rep(c('Mean', 'Max'), each=2),
                 position=rep(c('Sample', 'Diabetes'), times=2),
                 Glucose_Values=c(mean_value_sample,mean_value_diabetes,highest_value_sample,highest_value_diabetes))

#view data frame
df

library(ggplot2)

#plotting the chart
ggplot(df, aes(fill=position, y=Glucose_Values, x=Max_Mean)) + 
  geom_bar(position='dodge', stat='identity')
