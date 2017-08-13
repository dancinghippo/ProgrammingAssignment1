complete <- function (myDir = "C:/Users/Alex/Documents/CourseraR/ProgrammingR_lesson2/specdata", num){
  
  myFiles <-list.files(path=myDir,full.names = TRUE)
  id <- vector()
  nomb <- vector()
  
  for(i in num){
    fileContent  <- read.csv(myFiles[i])
    counter <- 0
    for(j in 1:nrow(fileContent)){
      if(!(is.na(fileContent[j,2]))){
        if(!(is.na(fileContent[j,3]))){
          counter <- counter+1
        }
      }
    }
    id <- as.vector(append(id,i))
    nomb <- as.vector(append(nomb, counter))
  }
  summaryOfFiles <- data.frame(id, nomb)
  return(summaryOfFiles)
  
}
  