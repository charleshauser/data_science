corr <- function(directory, treshold = 0){
  ##Define path for directory with all data files
  allfilespath <- paste(getwd(),"/",directory,sep="")
  
  ##Make list of all files within the directory specified
  allfiles <- list.files(path=allfilespath)
  
  ##Create empty data frame to be filled with all indexed data points with respective file names
  dataframe <- data.frame()
  
  ##For loop filling in empty data frame
  for(i in 1:332){
    ifile <- allfiles[i] ##Subset ith file name from all files
    
    ifilepath <- paste(getwd(),"/",directory,"/",ifile,sep="")  ##Define path for ith file using ith file name
    
    x <- read.csv(ifilepath, header = T) ##Read ith file into R using ith file path
    
    good <- complete.cases(x) ##Stores complete cases (rows)
    
    ccases <- x[good,]
    
    nobs <- nrow(ccases)
    
    dataframe <- rbind(dataframe,cbind(i, nobs)) ##Fill in empty data frame
  }
  
  datafiles <- dataframe[dataframe$nobs>=treshold,]
  isequence <- as.vector(datafiles$i)
  v <- vector()
  
  for(i in isequence){
    ifile <- allfiles[i] ##Subset ith file name from all files
    
    ifilepath <- paste(getwd(),"/",directory,"/",ifile,sep="")  ##Define path for ith file using ith file name
    
    x <- read.csv(ifilepath, header = T) ##Read ith file into R using ith file path
    
    good <- complete.cases(x) ##Stores complete cases (rows)
    
    ccases <- x[good,]
    
    correl <- cor(ccases[,2],ccases[,3])
   v1 <- c(v,correl)
  }
 return(v1)
}
