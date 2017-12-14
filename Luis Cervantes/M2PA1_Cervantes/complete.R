complete <- function(directory, id = 1:332) {
  ##Define path for directory with all data files
  allfilespath <- paste(getwd(),"/",directory,sep="")
  
  ##Make list of all files within the directory specified
  allfiles <- list.files(path=allfilespath)
  
  ##Create empty data frame to be filled with all indexed data points with respective file names
  dataframe <- data.frame()
  
  ##For loop filling in empty data frame
  for(i in id){
    ifile <- allfiles[i] ##Subset ith file name from all files
    
    ifilepath <- paste(getwd(),"/",directory,"/",ifile,sep="")  ##Define path for ith file using ith file name
    
    x <- read.csv(ifilepath, header = T) ##Read ith file into R using ith file path
    
    good <- complete.cases(x) ##Stores complete cases (rows)
    
    ccases <- x[good,]
    
    nobs <- nrow(ccases)
    
   dataframe <- rbind(dataframe,cbind(i, nobs)) ##Fill in empty data frame
  }
 return(dataframe)
}

