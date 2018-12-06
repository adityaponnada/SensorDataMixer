library(MASS)
library(plyr)
library(dplyr)
options(digits=2)

## This is the path to your input file. Change it to the path on your local system
inputFilePath <- "C:/Users/Dharam/Downloads/Diego_CAMSPADES/CamSpades_12_SimulatedFreeLiving_Recall_Annotations_08_27_2018.csv"


## Insert the data of the data collection here in YYYY-MM-DD format
fileDate = "2018-08-27"

inputFile <- read.csv(inputFilePath, sep = ",", header = FALSE)

names(inputFile) <- c("HEADER_START_TIME", "START_TIME", "END_TIME", "LABEL")

inputFile$DATE <- fileDate



getNumAsTime <- function(timeValue){
  
  hours = floor(timeValue/3600)
  timeValue = timeValue - (hours*3600)
  mins = floor(timeValue/60)
  seconds = timeValue - (mins*60)
  sprintf('%02d:%02d:%06.3f', hours, mins, seconds)
  
}



inputFile$HEADER_START_TIME <- getNumAsTime(inputFile$HEADER_START_TIME)
inputFile$START_TIME <- getNumAsTime(inputFile$START_TIME)
inputFile$END_TIME <- getNumAsTime(inputFile$END_TIME)

arrangedDataFrame <- inputFile %>%
  select(DATE, everything())

#### Use this to set the local path and file name for the procesed file
outputFilePath = "C:/Users/Dharam/Downloads/Diego_CAMSPADES/WithTimeStamps/CamSpades_12_SimulatedFreeLiving_Recall_Annotations_08_27_2018.csv"

write.csv(file = outputFilePath, x = arrangedDataFrame, quote = FALSE, row.names = FALSE, col.names = TRUE, sep = ",")

