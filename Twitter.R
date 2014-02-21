if (!require("twitteR")) {
  install.packages("twitteR")
  library(twitteR)
}



download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")


cred <- OAuthFactory$new(consumerKey='3jsQQoHoaUd59rShU6A6rg',
                         consumerSecret='ZIxjVEvBOsB7OlKE1JzH53CkYzRMeD4Xu8dL2R80',
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='http://api.twitter.com/oauth/authorize')

cred$handshake(cainfo="cacert.pem")
8212391

save(cred, file="twitter authentication.Rdata")
registerTwitterOAuth(cred)




jan<-searchTwitter("Heart Disease", geocode='37.538227,-77.436319,20mi', 
                   n=5000, 
                   retryOnRateLimit=1,
                   since='2013-01-01',
                   until='2013-12-31')


feb<-searchTwitter("heart disease", geocode='37.538227,-77.436319,20mi', 
                   n=5000, 
                   retryOnRateLimit=1,
                   since='2014-02-01')
                  #until='2014-07-12'

pdf(file="coach.pdf",11, 8.5)
print(feb)
dev.off()


grid.table(feb)

NROW(feb)