complete <- function(directory = "/Users/chelseyrae/Desktop/Coursera/specdata", id_range = 1:332){
  nobs = numeric() #initate numeric data type
  
  for(i in id_range){
    #read the data
    read_data = read.csv(paste(formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    
    #put the data of the sum of complete cases
    nobs = c(nobs, sum(complete.cases(read_data)))
  }
  return(data.frame(id_range, nobs)) #make it into a data frame and return
}

