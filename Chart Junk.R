plot(pexp(10:1, rate=.2),
     xlab="Time",
     ylab= "Fucks I Give",
     yaxt="n",
     xaxt="n")

abline(xpd=F, h= c(.55), col="grey40")
text(5.5, .57, "Point of No Return" )


bplayer<- c("Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center") 
court_location<- c(2,5,3,4,1)


barplot(t(as.data.frame(court_location, row.names=bplayer)),
     ylab="Points Per Game",
     yaxt="n")

points( c(0,6), c(5, 1), type="l", col="orange",lwd=2)

points( c(0,2.5,2.5,5,5,6), c(5,5,3,3,1,1), type="l", col="red", lwd=2)


points( c(0,6), c(1, 5), type="l", col="blue",lwd=2)


Balla<-c("Distance to Basket", "Possession of Ball", "Height") 
legend(0,4,Balla, 
       ncol=1, 
       pch= 15, 
       col=c("red", "orange", "blue"), 
       cex=1, 
       box.lwd = 0,
        bty = "n")





CWRU<-read.csv(file.choose(), header=TRUE)



radi<-sqrt(CWRU$Visits/pi)


symbols(CWRU$Clinics, CWRU$Physicians, circles=radi,
      inches=0.35, fg="white", bg="blue")


windowsFonts(
     A=windowsFont("Cambria"),
     B=windowsFont("Bookman Old Style"),
     C=windowsFont("Comic Sans MS"),
     D=windowsFont("Castellar")
)







health <- read.csv(file.choose(), header=TRUE)
health2<-health
health <- health[health$Visits>=6,]





##################################
radi<-sqrt(health$pcp_open/pi)

symbols(health$sum_rapport, health$sum_confirmation, circles=radi,
      inches=0.5, fg="white", bg="red", 
     xlab="Sum of Rapport Building Statements", 
     ylab="Sum of Confirming Statements",
     main= "Bon Secours")

abline(v=c(4.5, 9,15))


vradi<-sqrt(28/pi)

symbols(63.5,50, circles=vradi, add=T,inches=0.5)


text(59,52,"Open Ended Questions", cex=1, pos=1, font=2)

text(63.4,52.5,"10", cex=2, pos=1, font=2)



text( c(18,18,18), c(3.9,2.75,1.6) ,c(50,25,5),cex=.8, pos=1, font=1)
     
#(15,9,9, 4.5,4.5,4.5,-1.5,-1.5,-1.5,-1.5,-1.5,-1.5), 
text(c(20.5,15,15, 9,9,9,4.5,4.5,4.5,4.5,4.5,4.5), 
     c(20,20,19,20,19,18,20,19, 18,17,16,15), 
     c("Bon Secours",
"Henrico Doctors",
"CVHS",
"Sentara",
"Virginia Physicians",
"Riverside",
"Commonwealth Primary Care",
"UVA",
"TPMG",
"Fairfax Family Practice Center",
"Carillion",
"Front Royal Family Practice"
           )
, cex=.8, pos=2, font=2)















