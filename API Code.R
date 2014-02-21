library(bitops)
library(Hmisc)
library(xtable)

library(RCurl) 
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))) #fixes SSL certificate conflict

# Set secret token specific to your REDCap project and the API URL
top_secret_token = '5DF78DD525B6E5B420CD4C106F0B9FF3'

api_url = 'https://redcap.vcu.edu/rc/api/'



#Creates a form to request data
http_request <- postForm(api_url ,
   token = top_secret_token,
   content = 'record',
   format = 'csv', 
   type = 'flat')


#Build a dataframe
data_from_redcap <- read.table(file = textConnection(http_request), header = TRUE, sep = ",", na.strings = "",
   stringsAsFactors = FALSE)

#Check that it read in correctly
head(data_from_redcap)
summary(data_from_redcap)


red<-data_from_redcap#[data_from_redcap$valid_audio_data == 1, ]





















