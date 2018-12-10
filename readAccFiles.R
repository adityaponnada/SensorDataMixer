library(psych)
library(dplyr)
#library(reshape2)
library(plyr)
options(digits.secs=3)

#firstFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_AMB/MasterSynced/2017/11/15/20/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150141-AccelerationCalibrated.2017-11-15-20-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

#head(firstFile)

#firstFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_AMB/MasterSynced/2017/11/15/20/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150141-AccelerationCalibrated.2017-11-15-20-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

firstFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_SED_2/MasterSynced/2017/11/16/12/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150167-AccelerationCalibrated.2017-11-16-12-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

head(firstFile)

secondFile <- rbind(firstFile, firstFile)

#secondFile <- read.csv("C:/Users/Dharam/Downloads/MDCAS Files/GroundTruthFiles/MDCAS_Ground/ADITYA_SED_2/MasterSynced/2017/11/16/12/ActigraphGT9X-AccelerationCalibrated-NA.TAS1E23150167-AccelerationCalibrated.2017-11-16-12-00-00-000-M0500.sensor.csv", sep = ",", header = TRUE)

head(secondFile)

keep <- c("X_ACCELERATION_METERS_PER_SECOND_SQUARED", "Y_ACCELERATION_METERS_PER_SECOND_SQUARED", "Z_ACCELERATION_METERS_PER_SECOND_SQUARED")

firstFile <- firstFile[, keep]
secondFile <- secondFile[, keep]
#thirdFile <- thirdFile[, keep]


