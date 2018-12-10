
firstFileRowCounter = 1
looperOne = 0
looperTwo = 0
secondFileRowCounter = 1

jumbleDataFrame <- data.frame()

RollDie = function(n) sample(144000:144000,n,replace=T)

# thresholdOne = 12000 ##Make them a random number
# thresholdTwo = 12000 ## Make them random numbers
thresholdOne = RollDie(1) ##Make them a random number
thresholdTwo = RollDie(1) ## Make them random numbers

j = 1
k = 1
i = 1

testOne <- head(firstFile, 5120)
testTwo <- head(secondFile, 5120)


while(i<nrow(firstFile)){
  
  print(paste0("i is ", i))
  
  endPoint = i + thresholdOne
    
    tempFileOne <- firstFile[i:endPoint,]
    i = endPoint + 1
  
    while (j<nrow(secondFile)) {
      print(paste0("j is ", j))
      endPoint2 = j + thresholdTwo
        
        tempFileTwo <- secondFile[j:endPoint2,]
        jumbleDataFrame <- rbind(jumbleDataFrame, tempFileOne, tempFileTwo)
        j = endPoint2 + 1
    
      
      break
  
    }
}

jumbleDataFrame <- na.omit(jumbleDataFrame)

jumbleDataFrame <- head(jumbleDataFrame, 288000)

newStartTime <- as.POSIXct("2017-11-10 08:00:00.000")

jumbleDataFrame$HEADER_TIME_STAMP <- newStartTime

#### Assign time stamps
for (index in 1:nrow(jumbleDataFrame)){
  
  print(paste0("i is: ", index))
  jumbleDataFrame$HEADER_TIME_STAMP[index] = newStartTime
  newStartTime = newStartTime + 0.0125
  
}


new_df_jumbled <- jumbleDataFrame %>%
  select(HEADER_TIME_STAMP, everything())

library(plotly)

tempPlor <- plot_ly(new_df_jumbled, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')




new_df_jumbled <- head(new_df_jumbled, 285587)

write.csv(file = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/AMBULATION_SEDENTARY/0800_AMBULATION_SED.csv", x = new_df_jumbled, quote = FALSE, row.names = FALSE, col.names = TRUE, sep = ",")



saveFinalPlot = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/AMBULATION_SEDENTARY/AMBULATION_SED_0900.html"

htmlwidgets::saveWidget(tempPlor, saveFinalPlot, selfcontained = FALSE)


