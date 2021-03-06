
firstFileRowCounter = 1
looperOne = 0
looperTwo = 0
secondFileRowCounter = 1

jumbleDataFrame <- data.frame()

RollDie = function(n) sample(24000:72000,n,replace=T)

# thresholdOne = 12000 ##Make them a random number
# thresholdTwo = 12000 ## Make them random numbers
thresholdOne = RollDie(1) ##Make them a random number
thresholdTwo = RollDie(1) ## Make them random numbers

j = 1
k = 1

testOne <- head(firstFile, 5120)
testTwo <- head(secondFile, 5120)

for (indexOne in j:nrow(firstFile)){
  
  print(paste0("First file at: ", indexOne, " first file counter is: ", firstFileRowCounter))
  
  thresholdOne = RollDie(1)
  
  if (firstFileRowCounter <= thresholdOne){
    
    fileOneRow <- firstFile[indexOne,]
    #fileOneRow$FROM[indexOne] <- "One"
    jumbleDataFrame <- rbind(jumbleDataFrame, fileOneRow)
    firstFileRowCounter = firstFileRowCounter + 1
  } else {
    
    print("IN SECOND FILE")
    
    firstFileRowCounter = 1
    looperOne = looperOne + 1
    j = indexOne
    
    ### When n rows are done go to the next file
    thresholdTwo = RollDie(1)
    
      for (indexTwo in k:nrow(secondFile)){
        print(paste0("Second file at: ", indexTwo, " second file counter is: ", secondFileRowCounter))
        if (secondFileRowCounter <= thresholdTwo){
          fileTwoRow <- secondFile[indexTwo,]
          #fileTwoRow$FROM[indexTwo] <- "Two"
          jumbleDataFrame <- rbind(jumbleDataFrame, fileTwoRow)
          secondFileRowCounter = secondFileRowCounter + 1
          
        } else {
          
          k = indexTwo
          secondFileRowCounter = 1
          looperTwo = looperTwo + 1
          print("BREAKING AWAY FROM THE SECOND FILE")
          break
        }
       
    }
    
    }
  }
  

newStartTime <- as.POSIXct("2017-11-15 14:00:00.000")

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




new_df_jumbled <- head(new_df_jumbled, 235200)

write.csv(file = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/AMBULATION_SEDENTARY/AMBULATION_SED_v3.csv", x = new_df_jumbled, quote = FALSE, row.names = FALSE, col.names = TRUE, sep = ",")
 


saveFinalPlot = "C:/Users/Dharam/Downloads/MDCAS Files/SIMULATED_DATA/AMBULATION_SEDENTARY/AMBULATION_SED_v2.html"

htmlwidgets::saveWidget(tempPlor, saveFinalPlot, selfcontained = FALSE)
