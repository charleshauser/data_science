worst <- function(state,outcome){
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
  if((outcome == "heart attack"|outcome == "heart failure"|outcome== "pneumonia") == FALSE){
    stop(print("invalid outcome"))
  }
  if((state %in% x$State)== FALSE){
    stop(print("invalid state"))
  }
  
dataframe <- as.data.frame(cbind(x[,2],x[,7],x[,outcomecol]),stringsAsFactors = FALSE)

  true <- dataframe[,2] == state
  statedata <- dataframe[true,]  ##filter state
  def <- as.numeric(statedata[,3])
  mostdeaths <- max(def,na.rm=TRUE)  ##determine 
  hospitals <- statedata[,3] == mostdeaths
  hospitalslist <- statedata[hospitals,]
  df <- hospitalslist[order(hospitalslist[,1])]
  
  worsth <- df[1,1]
  
  return(worsth)
  }
  


