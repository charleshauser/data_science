##PROGASSG3
#Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
#outcome name. The function reads the outcome-of-care-measures.csv and returns a character vector
#with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specifed outcome
#in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
#be one of heart attack, heart failure, or pneumonia. Hospitals that do not have data on a particular
#outcome should be excluded from the set of hospitals when deciding the rankings.


setwd("/Users/chelseyrae/Desktop/Coursera")
hospital_data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(hospital_data)
hospital_data[, 11] <- as.numeric(hospital_data[, 11])
hist(hospital_data[, 11])



#best function 
best <- function(state, outcome) {
  
  #read file in
  hospital_data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = c("NA", "Not Available"))
  
  #store in arguments
  x = state %in% hospital_data$State
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  y = outcome %in% outcomes
  
  #check that they are valid inputs
  if (x == FALSE)
  {
    stop("Invalid State")
  }
  if (y == FALSE)
  {
    stop("Invalid Outcome")
  }
  
  #heart attack outcome
  if(outcome == "heart attack"){
    #store data
    #$ Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  }
  
  #heart failure outcome
  if(outcome == 'heart failure'){
    #Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  }
  
  #pneumonia outcome
  if(outcome == 'pneumonia'){
    # $ Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  
  #create a dataframe with state, hospital name, and outcomes
  hospital_frame <- data.frame(hospital_data$State, hospital_data$Hospital.Name, as.numeric(outcomeData))
  
  #subset data by given state 
  states <- subset(hospital_frame, hospital_data$State == state)
  #print(states)
  #for loop to iterate all outcomes in desired state to find minimum val
  for(i in 1:length(states)){
    min_data <- states[i] == min((states[,3]), na.rm = TRUE)
  }
  
  # store minimum hospital name and outcome val in new dataframe
  result <- data.frame(states[,2], min_data)
  #print(result)
  #subset hospital names and find where outcome is min_data
  subresult <- subset(result, result[,2] == TRUE)
  #print(subresult)
  ordered_result <- subresult[order(subresult$states...2.),] #Alphabetize results dataframe
  #print(ordered_result)
  #Get hospital name with the lowest 30-day mortality rate.
  print(ordered_result[1,1])

}


#worst function 
worst <- function(state, outcome) {
  
  #read file in
  hospital_data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = c("NA", "Not Available"))
  
  #store in arguments
  x = state %in% hospital_data$State
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  y = outcome %in% outcomes
  
  #check that they are valid inputs
  if (x == FALSE)
  {
    stop("Invalid State")
  }
  if (y == FALSE)
  {
    stop("Invalid Outcome")
  }
  
  #heart attack outcome
  if(outcome == "heart attack"){
    #store data
    #$ Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  }
  
  #heart failure outcome
  if(outcome == 'heart failure'){
    #Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  }
  
  #pneumonia outcome
  if(outcome == 'pneumonia'){
    # $ Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  
  #create a dataframe with state, hospital name, and outcomes
  hospital_frame <- data.frame(hospital_data$State, hospital_data$Hospital.Name, as.numeric(outcomeData))
  
  #subset data by given state 
  states <- subset(hospital_frame, hospital_data$State == state)
  #print(states)
  #for loop to iterate all outcomes in desired state to find maximum val
  for(i in 1:length(states)){
    max_data <- states[i] == max((states[,3]), na.rm = TRUE)
  }
  
  # store minimum hospital name and outcome val in new dataframe
  result <- data.frame(states[,2], max_data)
  #print(result)
  #subset hospital names and find where outcome is max_data
  subresult <- subset(result, result[,2] == TRUE)
  #print(subresult)
  ordered_result <- subresult[order(subresult$states...2.),] #Alphabetize results dataframe
  #Get hospital name with the lowest 30-day mortality rate.
  print(ordered_result[1,1])
  
}


rankhospital <- function(state, outcome, num = "best"){
  #read file in
  hospital_data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = c("NA", "Not Available"))
  
  #store in arguments
  x = state %in% hospital_data$State
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  y = outcome %in% outcomes
  
  #check that they are valid inputs
  if (x == FALSE)
  {
    stop("Invalid State")
  }
  if (y == FALSE)
  {
    stop("Invalid Outcome")
  }
  
  
  #heart attack outcome
  if(outcome == "heart attack"){
    #store data
    #$ Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  }
  
  #heart failure outcome
  if(outcome == 'heart failure'){
    #Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  }
  
  #pneumonia outcome
  if(outcome == 'pneumonia'){
    # $ Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  
  #create a dataframe with state, hospital name, and outcomes
  hospital_frame <- data.frame(hospital_data$State, hospital_data$Hospital.Name, as.numeric(outcomeData))
  
  #subset data by given state 
  states <- subset(hospital_frame, hospital_data$State == state)
  #print(states)
  if(num == "best"){
    for(i in 1:length(states)){
      min_data <- states[i] == min((states[,3]), na.rm = TRUE)
    }
    
    # store minimum hospital name and outcome val in new dataframe
    result <- data.frame(states[,2], min_data)
    #print(result)
    #subset hospital names and find where outcome is min_data
    subresult <- subset(result, result[,2] == TRUE)
    #print(subresult)
    ordered_result <- subresult[order(subresult$states...2.),] #Alphabetize results dataframe
    #print(ordered_result)
    #Get hospital name with the lowest 30-day mortality rate.
    print(ordered_result[1,1])
  }
  
  if(num == "worst"){
    #for loop to iterate all outcomes in desired state to find maximum val
    for(i in 1:length(states)){
      max_data <- states[i] == max((states[,3]), na.rm = TRUE)
    }
    
    # store minimum hospital name and outcome val in new dataframe
    result <- data.frame(states[,2], max_data)
    #print(result)
    #subset hospital names and find where outcome is max_data
    subresult <- subset(result, result[,2] == TRUE)
    #print(subresult)
    ordered_result <- subresult[order(subresult$states...2.),] #Alphabetize results dataframe
    #Get hospital name with the lowest 30-day mortality rate.
    print(ordered_result[1,1])
  }
  
  if ((num == "best" | num == "worst") == FALSE){
    if (as.numeric(num) > nrow(states)){ 
      return(NA)
    }
    if(is.numeric(num) & num < nrow(states)){
      alphabetical_states <- states[order(states[,2]),]
      ranked_states <- alphabetical_states[order(as.numeric(alphabetical_states[,3])),]
      ranked_indiv <- ranked_states[num,2]
      
      print(ranked_indiv)
    }
  }
}

  
rankall <- function(outcome, num = "best"){
  #read file in
  hospital_data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings = c("NA", "Not Available"))
  
  #store in arguments
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  y = outcome %in% outcomes
  
  #check that they are valid inputs
  if (y == FALSE)
  {
    stop("Invalid Outcome")
  }
  
  #heart attack outcome
  if(outcome == "heart attack"){
    #store data
    #$ Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  }
  
  #heart failure outcome
  if(outcome == 'heart failure'){
    #Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure  
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  }
  
  #pneumonia outcome
  if(outcome == 'pneumonia'){
    # $ Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    outcomeData = hospital_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  }
  #create a dataframe with state, hospital name, and outcomes
  hospital_frame <- data.frame(hospital_data$State, hospital_data$Hospital.Name, as.numeric(outcomeData))
  
  states <- unique(hospital_data$State)
  states <- states[order(states)]
  #order  by outcome data
  ordered_states <- hospital_frame[order(hospital_frame$as.numeric.outcomeData),]
  
  #trying to remove NA values
  #ordered_states <- na.omit(ordered_states)
  ordered_states <- subset(ordered_states, ordered_states$as.numeric.outcomeData != "NA")
  
  #split data into outcomes for each state
  split_states <- split(ordered_states$as.numeric.outcomeData, ordered_states$hospital_data.State)
  
  #with best
  if(num == "best"){
    num = 1
  }
  
  #with worst
  if(num == "worst"){
    rank <- c()
    result <- c()
    for(i in 1:length(split_states)){
      rank <- subset(ordered_states, ordered_states$hospital_data.State == states[i])
      #dealing with ties
      rank <- rank[order(rank$hospital_data.Hospital.Name),]      
      rank <- rank[order(rank$as.numeric.outcomeData.),]
      result[i] <- c(as.list(rank[length(rank),2]))
    }
  } else {
    #num = integer value
    rank <- c()
    result <- c()
    for(i in 1:length(split_states)){
      rank <- subset(ordered_states, ordered_states$hospital_data.State == states[i])
      rank <- rank[order(rank$hospital_data.Hospital.Name),]      
      rank <- rank[order(rank$as.numeric.outcomeData.),]
      result[i] <- c(as.list(rank[as.numeric(num),2]))
    }
    
  }
  #return lists
  answer <- data.frame(unlist(result), states)
  colnames(answer) <- c("Hospital", "State")
  head(answer, num)
}

