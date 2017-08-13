corr <- function (myDir = "C:/Users/Alex/Documents/CourseraR/ProgrammingR_lesson2/specdata", threshold=0){
  
  ##getting names of files in a folder to read through
  myFiles <-list.files(path=myDir,full.names = TRUE)
  id <- vector()
  corrResult <- numeric()
  
  ##reading through files
  for(i in 1:length(myFiles)){
    fileContent  <- read.csv(myFiles[i])
    ##selecting only files where complete nobs > threshold input
    counter <- 0
    for(j in 1:nrow(fileContent)){
      if(!(is.na(fileContent[j,2]))){
        if(!(is.na(fileContent[j,3]))){
          counter <- counter+1
        }
      }
    }
    ##updating resulting vector with list of selected files
    if(counter>threshold){
    id <- as.vector(append(id,i))
    
    ##calculating the covariance for single file over threshold
    singleFileCov <- cor(fileContent[,2],fileContent[,3], use = "pairwise.complete.obs")
    ##updating resulting vector with cov result of single selected file
    corrResult <- as.vector(append( corrResult, singleFileCov))
    }
  }

  ##returning result of a function
  summaryOfFiles <- data.frame(id,corrResult)
  ##debugger return(summaryOfFiles)
  return(corrResult)
  
}
