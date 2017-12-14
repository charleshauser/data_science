rankhospital <- function(state,outcome, num = "best"){
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
  
  dataframe <- as.data.frame(cbind(x[,2],x[,7],x[,outcomecol]),stringsAsFactors = FALSE)
  
  if(num == "best"){
    true <- dataframe[,2] == state
    statedata <- dataframe[true,]  ##filter state
    def <- as.numeric(statedata[,3])
    leastdeaths <- min(def,na.rm=TRUE)  ##determine 
    hospitals <- statedata[,3] == leastdeaths
    hospitalslist <- statedata[hospitals,]
    df <- hospitalslist[order(hospitalslist[,1])]
    
    besth <- df[1,1]
    
    return(besth)
  }
  
  if(num == "worst"){
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
  
  if((num == "best"|num == "worst")==FALSE){
    dataframe <- as.data.frame(cbind(x[,2],x[,7],as.numeric(x[,outcomecol])),stringsAsFactors = FALSE)
    true <- dataframe[,2] == state
    statedata <- dataframe[true,] ##filter state
    
    alph <- statedata[order(statedata[,1]),]
    rank <- alph[order(as.numeric(alph[,3])),]
    rankh <- rank[num,1]
    
    return(rankh)
  }
}
