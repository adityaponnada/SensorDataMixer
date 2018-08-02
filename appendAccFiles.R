
options(digits.secs=3)

appendedFile <- rbind(firstFile, secondFile)

#### Only include the first 3600 seconds
n = 3600*80

appendedFile <- head(appendedFile, n)



startTime = as.POSIXct("2017-11-15 18:00:00.001")
#### Append date time stamp column
appendedFile$HEADER_TIME_STAMP <- startTime

#test <- head(appendedFile, 800)



freq = 60*60*80

samplingRate = 80
samples = 1
secondCount = 0

for (i in 1:nrow(appendedFile)){
  
  print(paste0("i is: ", i))
  
  if (samples < samplingRate){
    #### only increment milliseconds
    ### Then incremement the samples
    
    startTime = startTime + 0.001
    
    appendedFile$HEADER_TIME_STAMP[i] = startTime
    samples = samples + 1
    print(paste0("samples: ", samples))
    
  } else if (samples == samplingRate){
    #### Increment only seconds
    #### set samples to 0
    print(paste0("samples reached: ", samples))
    startTime = round(startTime, units = "secs")
    startTime = startTime + 1.001
    
    
    #### Set milliseconds back to 0
    
    
    appendedFile$HEADER_TIME_STAMP[i] = startTime
    samples = 0
    secondCount = secondCount + 1
    
  }else if (samples > samplingRate){
    ### Do nothing
    
    
  }

  
}
