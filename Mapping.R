
library(ggplot2)
library(maps)
library(geosphere)

?geosphere
?map
vignette('geosphere')                   #PDF Describing Geosphere package


hardin1<-read.csv(file.choose(), header=TRUE)
hardin2<-hardin1[ ,1:19]              #Reduces data to the first 19 columns


crcmap1<-read.csv(file.choose(), header=TRUE)  

crcmap2<-crcmap1[ ,-1]                #removes the title column


                      


map("state", regions="virginia",        #If Region isn't specked, "state" projects full US map 
    col="darkolivegreen2",                    #Colors the image  
    fill=TRUE,                          #Fills the image with color   
    bg="white")                          #Background color


#points(crcmap2$Longitude, crcmap2$Latitude,   #Adds latitude and longitude points
#       pch=15, cex=.4, col="blue")


#text(-81,38.53, "CRC Study Locations \n and \n Population Density", font=2, col="red", cex=1.4)


#data(us.cities)           #Reads in US City location data


map.cities(us.cities, country="VA", pch=1, cex=sqrt(us.cities$pop)*.01)       #Maps US cities in size circles

points(hardin2$Longitude, hardin2$Latitude,   
       pch=ifelse(hardin2$CORRECT.DIAGNOSIS=="YES",3,2),              #?ifelse(condition, if true, if false)
       cex=.2, 
       col=ifelse(hardin2$CORRECT.DIAGNOSIS=="YES",1,2))

legend(-82.9,38.6,  				#Coordinates of top left
       c("Correct Diagnosis","Incorrect Diagnosis"),			#Titles 
       col=c(1,2),	#Colors to use
       pch=c(3,2)				#Characters to use
        )

points(hardin2$Longitude, hardin2$Latitude,   
       pch=ifelse(hardin2$CORRECT.DIAGNOSIS=="YES",3,2),              #?ifelse(condition, if true, if false)
       cex=hardin2$pcp_statements*.005, 
       col=ifelse(hardin2$CORRECT.DIAGNOSIS=="YES",1,2))


