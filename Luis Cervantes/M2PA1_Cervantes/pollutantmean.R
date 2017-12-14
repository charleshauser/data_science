pollutantmean <- function(directory,pollutant,id_range = 1:332){
  
  ##Define path for directory with all data files
  allfilespath <- paste(getwd(),"/",directory,sep="")
  
  ##Make list of all files within the directory specified
  allfiles <- list.files(path=allfilespath)
  
  ##Create empty vector to be filled with all indexed datapoints for specified pollutant
 datapoints <- c()
 
 ##For loop filling in empty vector with datapoints for specified pollutant
  for(i in id_range){
    ifile <- allfiles[i] ##Subset ith file name from all files
    
    ifilepath <- paste(getwd(),"/",directory,"/",ifile,sep="")  ##Define path for ith file using ith file name
    
    x <- read.csv(ifilepath, header = T) ##Read ith file into R using ith file path
    
    y <- x[,pollutant] ##Subset column of specified pollutant
    
    datapoints <- c(datapoints, y) ##Extend empty vector with itself and with ith file's specified pollutant data
  }
 mean(datapoints,na.rm = T) ##Take mean of extended vector containing all indexed datapoints for specified pollutant
}

