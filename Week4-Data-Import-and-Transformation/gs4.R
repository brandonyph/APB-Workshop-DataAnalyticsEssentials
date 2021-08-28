setwd("C:/Users/Brandon_yeo/Desktop/GoogleTut")

#install.packages(c("googlesheets4", "googledrive"))

library(googledrive)
drive_auth()
2

library(readr)
Sample_Dataset_raw <- read_csv("Sample Dataset.csv")
Sample_Dataset <- Sample_Dataset_raw[1:100,]

write.csv(Sample_Dataset,file="sample.csv") 

#################################################
#- UPloading a CSV to Googl Drive as spreadsheet
#################################################
td <- drive_get("https://drive.google.com/drive/folders/1ZBBNomGMas7jP8tRYomtSz0PvAESjOae")
drive_upload("sample.csv",name = "Sample1",type = "spreadsheet",path=as_id(td))

#################################################
#- Updating a CSV to Googl Drive as spreadsheet
#################################################
td <- drive_get("https://drive.google.com/drive/folders/1ZBBNomGMas7jP8tRYomtSz0PvAESjOae")
drive_put("sample.csv",name = "Sample1",type = "spreadsheet",path=as_id(td))

#################################################
#- Downloading a spreadsheet file as a csv 
#################################################
target <- drive_get("https://docs.google.com/spreadsheets/d/1HnnzUpdOk6amB-BSnHaFhFadwEMsmL_tpKSis5ulnhE")
drive_download(target,type= "csv",path = "Sample_downloaded.csv")

#################################################
#- GoogleSheet4
#################################################
#install.packages("devtools")
#library(devtools)
#devtools::install_github("tidyverse/googlesheets4")
library(googlesheets4)
gs4_auth()
2

#################################################
#- Create a new spreadsheet in drive call "Funny"
#################################################
gs4_create("funny")

#################################################
#- Write to an existing Spreadsheet
#################################################
ss <- gs4_get("https://docs.google.com/spreadsheets/d/1CIF4jO4EUEWy-W2QnmLl08tMqbuLTelaZjmlEp4eW8s")
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

data_to_write <- read_sheet("https://docs.google.com/spreadsheets/d/1CIF4jO4EUEWy-W2QnmLl08tMqbuLTelaZjmlEp4eW8s")
data_to_write$NormrlizedT <- scale(data_to_write$`T (degC)`)

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

sheet_append(
  ss, 
  data_to_write
)



