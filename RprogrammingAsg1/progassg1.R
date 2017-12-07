pollutantmean <- function(directory = "/Users/chelseyrae/Desktop/Coursera/specdata", pollutant, id_range = 1:332){
  data = numeric()
  for (i in id_range) {
    read_data = read.csv(paste(formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    data = c(data, read_data[[pollutant]])
  }
  return(mean(data, na.rm = TRUE))
}

complete <- function(directory = "/Users/chelseyrae/Desktop/Coursera/specdata", id_range = 1:332){
  nobs = numeric()
  for(i in id_range){
    read_data = read.csv(paste(formatC(i, width = 3, flag = "0"), ".csv", sep = ""))
    nobs = c(nobs, sum(complete.cases(read_data)))
  }
  return(data.frame(id_range, nobs))
}
