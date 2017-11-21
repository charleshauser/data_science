## R-Programming Week 4 Assignment
##  Plot the 30-day mortality rates for heart attack

setwd("~/Dropbox/courses/R_coursera/Rprogramming")
####### Clear workspace ########
rm(list=ls())
####### Session Info #######
sessionInfo()


outcome <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
ncol(outcome)
colnames(outcome)

#To make a simple histogram of the 30-day death rates from heart attack 
#(column 11 in the outcome dataset),
#convert column to numeric since we read it in as character:colClasses = "character"
#You may get a warning about NAs being introduced; that is okay
outcome[, 11] <- as.numeric(outcome[, 11])
#http://rstudio-pubs-static.s3.amazonaws.com/2056_f7e31337ebe64911b83eb0017a9d1626.html
png("heart_attack_DR.png")
hist(outcome[, 11], xlab = "30-day Death Rate", main = "Heart Attack 30-day Death Rate")
dev.off()



#Finding the best hospital in a state
source("best.R")
best("MD", "heart attack")
