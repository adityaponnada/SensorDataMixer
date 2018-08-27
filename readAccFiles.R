library(psych)
library(dplyr)
library(reshape2)
library(plyr)
options(digits.secs=3)

firstFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_AMB/MasterSynced/2017/11/15/20/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150141-AccelerationCalibrated.2017-11-15-20-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

head(firstFile)

secondFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_SLEEP_4/MasterSynced/2018/01/25/01/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150058-AccelerationCalibrated.2018-01-25-01-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

head(secondFile)

thirdFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_NONWEAR/MasterSynced/2017/11/14/17/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150023-AccelerationCalibrated.2017-11-14-17-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

head(thirdFile)

keep <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")

firstFile <- firstFile[, keep]
secondFile <- secondFile[, keep]
thirdFile <- thirdFile[, keep]


