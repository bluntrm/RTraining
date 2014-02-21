if (!require("plotrix")) {
  install.packages("plotrix")
  library(plotrix)
}

windowsFonts(
     A=windowsFont("Algerian"),
     B=windowsFont("Bookman Old Style"),
     C=windowsFont("Comic Sans MS"),
     D=windowsFont("Castellar")
)




Callthe8<- "Oh Magic 8 Ball tell us of\nOur Quandries for the Future..."
eight1<-"It is certain"
eight2<-"It is decidedly so"
eight3<-"Without a doubt"
eight4<-"Yes definitely"
eight5<-"You may rely on it"
eight6<-"As I see it yes"
eight7<-"Most likely"
eight8<-"Outlook good"
eight9<-"Yes"
eight10<-"Signs point to yes"
eight11<-"Reply hazy try again"
eight12<-"Ask again later"
eight13<-"Better to not tell you now"
eight14<-"Cannot predict now"
eight15<-"Concentrate and ask again"
eight16<-"Don't count on it"
eight17<-"My reply is no"
eight18<-"My sources say no"
eight19<-"Outlook not so good"
eight20<-"Very doubtful"


magic<-as.integer(runif(1,1,20))

youranswer<- ifelse (magic == 1,eight1, 
               (ifelse (magic == 2,eight2,
               (ifelse (magic == 3,eight3,      
               (ifelse (magic == 4,eight4,
               (ifelse (magic == 5,eight5,
               (ifelse (magic == 6,eight6,
                (ifelse (magic == 7,eight7,
                (ifelse (magic == 8,eight8,
                (ifelse (magic == 9,eight9,
              (ifelse (magic == 10,eight10,
             (ifelse (magic == 11,eight11,
             (ifelse (magic == 12,eight12,
              (ifelse (magic == 13,eight13,
               (ifelse (magic == 14,eight14,
              (ifelse (magic == 15,eight15,
               (ifelse (magic == 16,eight16,
                (ifelse (magic == 17,eight17,
                (ifelse (magic == 18,eight18,
                (ifelse (magic == 19,eight19,eight20)
              
                ))))))))))))))))))))))))))))))))))))
                                                                                      

par(bg = "dark grey")
plot(1:2, type='n', 
     asp=2, 
     main = Callthe8, 
     col.main="red",
     xlab=" ", 
     ylab = " ", 
     family = "D", 
     bty= "n", 
    xaxt="n",
    yaxt="n")


stars<- matrix(runif(200,0,2.5), ncol=2)
points(stars,pch = 8, col=rainbow(20))
draw.circle(1.5,1.5, .75, col="black")
draw.circle(1.5,1.5, .25, col="white")
triangle1 <- matrix(c(.5,1.5,2.5,.5,    1.1,2,1.1,1.1),ncol=2)
triangle2 <- matrix(c(.45,1.45,2.45,.45,    1.1,2,1.1,1.1),ncol=2)
triangle3 <- matrix(c(.55,1.55,2.55,.55,    1.1,2,1.1,1.1),ncol=2)

lines(triangle1, col="blue", lwd=2)
lines(triangle2, col="purple", lwd=2)
lines(triangle3, col="yellow", lwd=2)

text(1.5,1.5, "8", cex = 4)
text(1.5,1.25, youranswer, family = "C", col="green", cex=2)


par(bg = "transparent")

                        
                        
                        
                        
                        
          