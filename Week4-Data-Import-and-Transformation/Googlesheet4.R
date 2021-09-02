library(readr)
cars <- read_csv("C:/Users/harpa/Desktop/cars.csv")

#install.packages(c("googlesheets4", "googledrive"))

library(googledrive)
drive_auth()

library(readr)
Sample_Dataset_raw <- read_csv("C:/Users/harpa/Desktop/cars.csv")
Sample_Dataset <- Sample_Dataset_raw[1:100,]
# dataframe[rowno,colno]

write.csv(cars,file="sample.csv") 

#################################################
#- UPloading a CSV to Google Drive as Spreadsheet
#################################################
td <- drive_get("https://drive.google.com/drive/folders/1Ls-wUbYQ7unUq1u-CWj5GoTWPwZz8OV7")
drive_upload("sample.csv",name = "Sample1",type = "spreadsheet",path=as_id(td))

#################################################
#- Updating a CSV to Google Drive as spreadsheet
#################################################
td <- drive_get("https://drive.google.com/drive/folders/1ZBBNomGMas7jP8tRYomtSz0PvAESjOae")
drive_put("sample.csv",name = "Sample1",type = "spreadsheet",path=as_id(td))

#################################################
#- Downloading a spreadsheet file as a csv 
#################################################
target <- drive_get("https://docs.google.com/spreadsheets/d/1Bj3qMcI2jgN2eGlIIDq49dCAIt36OMRz2S7VccQw7wQ/edit?usp=drive_web&ouid=111497227689404746830")
drive_download(target,type= "csv",path = "Sample_downloaded.csv")

#################################################
#- GoogleSheet4
#################################################
#install.packages("devtools")
#library(devtools)
#devtools::install_github("tidyverse/googlesheets4")
library(googlesheets4)

gs4_auth()


#################################################
#- Create a new spreadsheet in drive call "Funny"
#################################################
gs4_create("funny")

#################################################
#- Write to an existing Spreadsheet
#################################################
ss <- gs4_get("https://docs.google.com/spreadsheets/d/1Bj3qMcI2jgN2eGlIIDq49dCAIt36OMRz2S7VccQw7wQ/edit#gid=527876009")
data_to_write <- Sample_Dataset

range_write(
  ss,
  data_to_write,
  sheet = NULL,
  range = NULL,
  col_names = TRUE,
  reformat = TRUE
)

#################################################
#- Read an existing Spreadsheet and update data
#- after processing
#################################################

range_write(
  ss,
  data_to_write,
  sheet = 1,
  range = NULL,
  col_names = TRUE,
  reformat = TRUE
)

#################################################
#- Append Data into existing Spreadsheet
#################################################

sheet_append(ss,
  data_to_write
)



