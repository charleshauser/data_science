rankall <- function(outcome,num){
  x <- read.csv("E:/R Working Directory/outcome-of-care-measures.csv",colClasses = "character")
  
  if(outcome == "heart attack"){
    outcomecol <- 11
  }
  if(outcome == "heart failure"){
    outcomecol <- 17
  }
  if(outcome == "pneumonia"){
    outcomecol <- 23
  }
  
  dataframe <- as.data.frame(cbind(x[,2],x[,7],as.numeric(x[,outcomecol])),stringsAsFactors = FALSE)
  
  statedatalist <- split(dataframe,dataframe[,2])
  
  rankedhospitals <- data.frame()
  
  
  for(i in 1:length(statedatalist)){
  ithstatedata <- statedatalist[[i]]
  
  alph <- ithstatedata[order(ithstatedata[,1]),]
  rank <- alph[order(as.numeric(alph[,3])),]
  Hospital <- rank[num,1]

  rankedhospitals <- rbind(rankedhospitals,cbind(Hospital,names(statedatalist[i])))
  }
  return(rankedhospitals)
}
