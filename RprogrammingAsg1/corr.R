corr <- function(directory= "/Users/chelseyrae/Desktop/Coursera/specdata", threshold = 0){
  data_frame = complete(directory) #initiate the dataframe 
  
  id_range = data_frame[data_frame["nobs"] > threshold, ]$id_range  #grabs values that are above threshold
  
  corrr = numeric() #initiate the numeric vector that will be returned 
  
  for(i in id_range){
    #read the data 
    read_data = read.csv(paste(formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    
    #gets the number of completely observed observations (on all variables)
    dff = read_data[complete.cases(read_data), ]  
    
    #the numeric vector of correlations
    corrr = c(corrr, cor(dff$sulfate, dff$nitrate)) 
  }
  return(corrr)
}
