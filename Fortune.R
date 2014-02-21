library(jpeg)

Velcome<- "Run Script\nand\nSeek Thyne Fortune"

card<- as.integer(runif(1,0,21))

pizza <- readJPEG(paste("C:\\Users\\bluntrm\\Desktop\\Tarot\\major\\",card,".jpg",sep=""), native=TRUE)

source("C:\\Users\\bluntrm\\Desktop\\Tarot\\majortext.r")


windowsFonts(
     A=windowsFont("Algerian"),
     B=windowsFont("Bookman Old Style"),
     C=windowsFont("Comic Sans MS"),
     D=windowsFont("Castellar")
)



Fortune <- ifelse(card == 0,card0, 
                 (ifelse (card == 1, card1, 
                 (ifelse (card == 2, card2,
                 (ifelse (card == 3, card3,      
                 (ifelse (card == 4, card4,
                 (ifelse (card == 5, card5,
                 (ifelse (card == 6, card6,
                 (ifelse (card == 7, card7,
                 (ifelse (card == 8, card8,
                 (ifelse (card == 9, card9,
                 (ifelse (card == 10, card10,
                 (ifelse (card == 11, card11,
                 (ifelse (card == 12, card12,
                 (ifelse (card == 13, card13,
                 (ifelse (card == 14, card14,
                 (ifelse (card == 15, card15,
                 (ifelse (card == 16, card16,
                 (ifelse (card == 17, card17,
                 (ifelse (card == 18, card18,
                 (ifelse (card == 19, card19,
                 (ifelse (card == 20, card20, card21)
                 ))))))))))))))))))))))))))))))))))))))))
                      
                      

par(bg = "black")
plot(1:2, type='n', 
     asp=2, 
     main = Velcome, 
     col.main="red",
     xlab=" ", 
     ylab = " ", 
     family = "D", 
     bty= "n", 
     xaxt="n",
     yaxt="n")

stars<- matrix(runif(200,0,2.5), ncol=2)
points(stars,pch = 8, col=rainbow(20))

text(1.5,1.2, Fortune, family = "C", col="orange")


rasterImage(pizza, 1.2, 1.27, 1.8, 1.73)

par(bg = "transparent")










