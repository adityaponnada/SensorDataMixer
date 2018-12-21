library(plotly)

tempPlor <- plot_ly(readJumbled1, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')


readSigAligner <- read.csv("C:/Users/Dharam/Downloads/SigAligner/labels/labels_0600_SLEEP.csv", sep = ",", header = TRUE)

head(readSigAligner)

startTime <- readJumbled$HEADER_TIME_STAMP[1]

readSigAligner$HEADER_TIME_STAMP <- startTime

for (i in 1:nrow(readSigAligner)){
  
  print(paste0("i is: ", i))
  readSigAligner$HEADER_TIME_STAMP[i] = startTime
  startTime = startTime + 0.0125
  
}

tempPlor <- plot_ly(readJumbled, x = ~HEADER_TIME_STAMP, y = ~X_ACCELERATION_METERS_PER_SECOND_SQUARED,
                    name = 'X_acc', type = 'scatter', legendgroup = "RAW", mode = 'lines') %>%
  add_trace(y = ~Y_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Y_acc', mode = 'lines') %>%
  add_trace(y = ~Z_ACCELERATION_METERS_PER_SECOND_SQUARED, name = 'Z_acc', mode = 'lines')