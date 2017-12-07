library(plyr)
library(dplyr)
library(xtable)
library(stringr)
library(ggplot2)

stormData <- read.csv("repdata-data-StormData.csv")

len <- length(stormData[, 1])
events <- unique(stormData[, "EVTYPE"])
numevents <- length(events)
mres <- matrix(0, nrow = 5, ncol = numevents)

for (i in 1:len){
  ev <- stormData[i, 8] #events
  ie <- match(ev, events)
  mres[1, ie] = mres[1, ie] + stormData[i, "FATALITIES"]
  mres[2, ie] = mres[2, ie] + stormData[i, "INJURIES"]
  mres[3, ie] = mres[3, ie] + 1
  
  val <- stormData[i, "PROPDMG"]
  mex <- stormData[i, "PROPDMGEXP"]
  vexp <- 1
  if (mex == "K") 
    vexp <- 1000
  if (mex == "k") 
    vexp <- 1000
  if (mex == "M") 
    vexp <- 1e+06
  if (mex == "m") 
    vexp <- 1e+06
  if (mex == "b") 
    vexp <- 1e+09
  if (mex == "B") 
    vexp <- 1e+09
  mres[4, ie] = mres[4, ie] + vexp * val
  
  val <- stormData[i, "CROPDMG"]
  mex <- stormData[i, "CROPDMGEXP"]
  vexp <- 1
  if (mex == "K") 
    vexp <- 1000
  if (mex == "k") 
    vexp <- 1000
  if (mex == "M") 
    vexp <- 1e+06
  if (mex == "m") 
    vexp <- 1e+06
  if (mex == "b") 
    vexp <- 1e+09
  if (mex == "B") 
    vexp <- 1e+09
  mres[5, ie] = mres[5, ie] + vexp * val
  # print(i)
}

k <- 10
# order by number of fatalities
fat <- cbind(mres[1, ], c(1:numevents))
fato <- fat[order(fat[, 1], decreasing = TRUE), ]
x <- barplot(fato[1:k, 1], xaxt = "n", main = "Most harmful events ", ylab = "Fatalities")
labs <- events[fato[1:k, 2]]
text(cex = 0.5, x = x - 0.25, y = -531, labs, xpd = TRUE, srt = 45)

# order by number of injuries
fat <- cbind(mres[2, ], c(1:numevents))
fato <- fat[order(fat[, 1], decreasing = TRUE), ]
# barplot(fato[1:k,1], main='Most harmful type of events ',cex.names=0.5,
# xlab='Injuries',names.arg=(events[fato[1:k,2]]))
x <- barplot(fato[1:k, 1], xaxt = "n", main = "Most harmful events ", ylab = "Injured")
labs <- events[fato[1:k, 2]]
labs[9] = "THUNDERSTORM"
text(cex = 0.5, x = x - 0.25, y = -8531, labs, xpd = TRUE, srt = 45)

# order by cost
fat <- cbind((mres[4, ] + mres[5, ])/1e+09, c(1:numevents))
fato <- fat[order(fat[, 1], decreasing = TRUE), ]
# barplot(fato[1:k,1], main='Most harmful type of events ',cex.names=0.5,
# xlab='Injuries',names.arg=(events[fato[1:k,2]]))
x <- barplot(fato[1:k, 1], xaxt = "n", main = "Most harmful events ", ylab = "Billions of dolars")
labs <- events[fato[1:k, 2]]
# labs[2]= 'HURRICANE'
text(cex = 0.5, x = x - 0.25, y = -19, labs, xpd = TRUE, srt = 45)

