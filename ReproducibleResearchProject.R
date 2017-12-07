setwd('/Users/chelseyrae/Desktop/Coursera')
activityData <- read.csv("activity.csv", header = T, sep = ",", stringsAsFactors = F)

activityData$date <- as.Date(activityData$date, "%Y-%m-%d")

#What is the mean total number of steps taken per day?
library (dplyr)
AvgDay <- activityData %>% group_by(date) %>%
  summarize(total.steps = sum(steps, na.rm = T), 
            mean.steps = mean(steps, na.rm = T))

head(AvgDay)
summary(AvgDay$total.steps)
summary(AvgDay$mean.steps)



#construct histogram
library(ggplot2)
g <- ggplot(AvgDay, aes(x=total.steps))
g + geom_histogram(binwidth = 2500) + theme(axis.text = element_text(size = 12),  
                                            axis.title = element_text(size = 14)) + labs(y = "Frequency") + labs(x = "Total steps/day")
#What is the daily activity pattern?
library(ggplot2)
meanStepsByInt <- aggregate(steps ~ interval, activityData, mean)
ggplot(data = meanStepsByInt, aes(x = interval, y = steps)) +
  geom_line() +
  ggtitle("Average Daily Activity Pattern") +
  xlab("5-minute Interval") +
  ylab("Average Number of Steps") +
  theme(plot.title = element_text(hjust = 0.5))

#The maximum average number of steps is: 206 and occurs in time interval #835

# Imputing missing values
newData <- activityData
for (i in 1:nrow(newData)) {
  if (is.na(newData$steps[i])) {
    index <- newData$interval[i]
    value <- subset(AvgInterval, interval==index)
    newData$steps[i] <- value$mean.steps
  }
}
head(newData, n = 20)


#without NA calculations
newAvg <- newData %>% group_by(date) %>%
  summarize(total.steps = sum(steps, na.rm = T))

#construct new histogram
g <- ggplot(newAvg, aes(x=total.steps))
g + geom_histogram(binwidth = 2500) + theme(axis.text = element_text(size = 12),
                                            axis.title = element_text(size = 14)) + labs(y = "Frequency") + labs(x = "Total steps/day")

summary (AvgDay$total.steps)
sd(AvgDay$total.steps, na.rm=T)
summary (newAvg$total.steps)
sd(newAvg$total.steps, na.rm=T)



#Are there differences in activity patterns between weekdays and weekends?

#create a new column in newData containing the values weekend or weekday
#newData$day <- ifelse(weekdays(newData$date) %in% c("Saturday", "Sunday"), "weekend", "weekday")

#create a function for weekdays and weekend (this is just for practice)
DayType <- function(date) {
  day <- weekdays(date)
  if (day %in% c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'))
    return ("weekeday")
  else if (day %in% c('Saturday', 'Sunday'))
    return ("weekend")
  else
    stop ("Invalid Date Format.")
}
newData$date <- as.Date(newData$date)
newData$day <- sapply(newData$date, FUN = DayType)

# Make a panel plot containnig a time-series plot of the 5-minute interval
# and the average number of steps taken across all weekdays or weekends
meanStepsByDay <- aggregate(steps ~ interval + day, newData, mean)
ggplot(data = meanStepsByDay, aes(x = interval, y = steps)) + 
  geom_line() +
  facet_grid(day ~ .) +
  ggtitle("Average Daily Activity Pattern") +
  xlab("5-minute Interval") +
  ylab("Average Number of Steps") +
  theme(plot.title = element_text(hjust = 0.5))

