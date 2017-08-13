pollutantmean <- function (myDir = "C:/Users/Alex/Documents/CourseraR/ProgrammingR_lesson2/specdata", pollutant, id = 1:332
                           ){
  
  ##getting data from files
  ##myDir = "C:/Users/Alex/Documents/CourseraR/ProgrammingR_lesson2/specdata"
  myFiles <-list.files(path=myDir,full.names = TRUE)
  summaryOfFiles <- vector()
  columnFromFile <- vector()

  for(i in id[1]:id[length(id)]){
    columnFromFile <- NULL
    fileContent  <- read.csv(myFiles[i])
    columnFromFile <- as.vector(fileContent[[pollutant]])
    summaryOfFiles <- as.vector(append(summaryOfFiles, columnFromFile))
  }
  meanOfPollutant <- mean(summaryOfFiles, na.rm = TRUE)
  return(meanOfPollutant)
  
  ##directory is a character vector of length 1 indicating location of csv files
  
  ##pollutant is a character vector of length 1 indicating the name of pollutant
  ##for calculation of mean; either "sulfate" or "nitrate"
  
  ##id is an integer indicating the monitor ID numbers to be uses
  
  ##Return the mean of of the pollutant acrross all monitors list
  ##in the 'id' vector, ignoring NA values
  ##result is not rounded

  
  
}

