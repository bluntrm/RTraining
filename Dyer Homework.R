
#CHAPTER 2



#The function ls() provides you a list of all variables 
#that you have defined

#rm(variableName) will remove a variable name

#update.package(ask=FALSE) to update





#CHAPTER 3

#rpois creates a random number generation for the poisson
#distribution. 

#rpois(numbers to create, lambda=centraility parameter)

rpois(400, lambda=3)

#Below, the random Poisson distribution is turned into a
#density object and then plotted.
plot(density(rpois(10,lambda=4)), 
    xlab="Marge",
    ylab="Homer",
    col="blue",
     lwd=2,
      main="Question 3: \n The Simpsons \n Poisson Density Functions"
)

     
legend(4,.17, c("The Simpsons")) 				

#Chi Square distribution with random numbers
#rchisq(n numbers, degreed of freedom, centrality)

hist(rchisq(20,1,7),
     main="",
    xlab="Size of things(m)",
     ylab="Frequency of things",
     col=rainbow(2))



y1 <- rnorm(20, mean=40.2, sd=3.89)
y2 <- rnorm(20, mean=40.2, sd=3.89)



Treatments <- rep( c("Baja", "Sonora'), each=10)
CactusHeight <- c( rnorm(10,mean=3), rnorm(10,mean=2.5))



y1<-c(32,56,58)
names(y1) <-c("Christy", "Debbie", "Kevin")
barplot(y1, 
       xlab="Immediate Family", 
       ylab="Age in Years",
        main="Question 8")
 






#Chapter 5

install.packages("moments")
library(moments)



Q1
The data from the command x <- rf(1000,1,10) is leptokurtic.
True/False


x22 <- rf(1000,1,10)
kurtosis(x23)-3    #Measures "Peakedness" of a distribution
 
x23 <- runif(10000)



Question 2
     
What are the critical values of the ??2 distribution with df=8 
and alpha<-[0.2,0.1,0.01,0.001]?

#Where p= 1 - alpha.  This gives the 

qchisq(1-.1, 8)
 

Answerc. 	11.03009, 13.36157, 20.09024, 26.12448




Question 3

     
For the probabilities p <- seq(0.1,0.9,by=.1) create a 
graph that has a red line representing the quantile function 
for the Poisson distribution (qpois() with lambda = 1) and a 
blue one representing the quantile function for the 
??2 distribution (df=1). Make sure to have your axes labeled 
and drawn properly. Upload the image as a png or jpeg or tiff
    

p5 <- seq(0.1,0.9,by=.1)

plot(qpois(p5, lambda=1), type = "l", col= "red", 
main= "Question 3 \n Quantile functions of Poisson and X^2",
xlab = "Frequency", 
ylab= "Lambda/DF")

lines(qchisq(p5, 1, lower.tail=TRUE, log.p=FALSE), col="blue", type="l")

legend(1,1.8,      		#Coordinates of top left
       c("qpois","qchisq"),			#Titles 
       col=c("red","blue"),	#Colors to use
       pch=c(15,15)				#Characters to use
        )



p5 <- seq(0.1,0.9,by=.1)

plot(density(qpois(1-p5, lambda=1)), col= "red", 
main= "Question 3 \n Quantile functions of Poisson and X^2")

lines(density(qchisq(1-p5, 1)), col="blue")

legend(2.5,.4,    			#Coordinates of top left
       c("qpois","qchisq"),			#Titles 
       col=c("red","blue"),	#Colors to use
       pch=c(15,15)				#Characters to use
        )

?qchisq





Question 5

     
R comes with some data sets already included. This question 
will use the cars data.frame. Load the data frame into memory using 
the command data(cars) and take a look at it (summary(cars)). This data 
set has two variables, speed and dist. Are these variables significantly
correlated and if so, how can you tell?

text editor

cor.test(cars$speed, cars$dist, alternative="two.sided", 
        conf.level=.98)

#cor()
cor(cars) 

#To create r^2 [for row 1, column 2] 
cor(cars)^2




Question 7

     
    What is the 25%-quartile of the data x5 <- rnorm(2000,3)?
    Answer

rnorm(2000,3)
summary(x5)
quantile(x5)



Question 8

     
The object that is returned from the cor.test() function 
is a class. R knows this because of what particular 
feature of that object?

c. It is a list with a key of "class" that can be retrieved 
   from the names() function.

a.   It is a data frame with an attributed named "class"
b. 	It is a list with an attribute named "class"
d. 	Its magic.





Question 9

Create a histogram of 1000 random numbers drawn from the 

F-distribution with 
parameters df1=1 & df2=10. 

On this plot, 
overlay the density. 
Label the axes appropriately and 
upload the file as an image file.




hist(rf(1000,1,10), prob=TRUE,
  xlab="Degrees of Freedom",
  main="Histogram of F-Distro Probabilities \n with Density Overlay")

lines( density(rf(1000,1,10)), col= "red")

    
                   
                   

hist(f22, main= "Question 9")

plot(f23, ylim = c(0, 1), 
xlim = c(0, 20), xlab = "Value",
ylab = "Density", bty = "n", 
type = "l", lwd = 2, col = "red")

?density

norm <- density(rnorm(1000))
exp <- density(rexp(1000))
pois <- rpois(1000, lambda = 1)
par(mfrow = c(3, 1))
plot(norm, col = "red", lwd = 2, bty = "n")
plot(exp, col = "green", lwd = 2, bty = "n")
hist(pois, col = "#D1E5F0", border = "#2166AC")

                     
                     
                     
                     
                     
                     

Question 10
    
The range of possible values for ??, 
the Pearson Product-Moment Correlation can be range 
from a low of -1 to 1.  


                     
                     

#Chapter 6
                     
Question 1

Create a function named cor.summary() that allows you 
to pass an object returned by the cor.test() function 
that returns a numeric vector of the correlation, lower 
and upper confidence intervals. For readability, make 
sure to label the names of each element in the returned vector.

cor.summary<-function()
  { 
  Cars1<-cor.test(cars$speed, cars$dist, alternative="two.sided", 
           conf.level=.98)
   }
                     
cor.summary                     
                     
hello<-function() cat("Hello, world!\n") 
                     
                     
                     
                     
                     
                    
                     
                     
                     
                     
                     
                     
                     
Question 3
                                    
Explain scope and how it pertains to the values 
assigned to variables.
 
                 
Question 4
  
Lets assume you are making the 
following function.
                     
                     
my.text.func <- function( x ) {}
                                     
                     
What code would you put in the beginning to:
Make sure x is a string of characters.
Warn the user that they passed the wrong class of 
data in x if it is not a character string
Return NULL if x is not a character string
       
 
my.text.func() <- function( x ) {                   
if (!as.character(x))
stop("The my.text.func only works on character strings")}     

                     

                     
Question 6

Create a function named your.are.my.density()
that takes a single vector of numeric values 
and creates a plot of the density of the 
data as a red line.

       
                     

Question 8
     
Create a function that takes a random number and 
prints out "positive" or "negative" if it is 
greater or less than zero.
        

                     
plusorminus <- function()
  {
  #This line assigns a random number from the uni distro to a variable
  x1<-runif(1, min=-10000000000,max=10000000000)
  
  #This line generates a random number from the uni distro
  x1
  
  #This line determines whether it's greater or less than zero for the return
  ifelse(x1 > 0 ,"positive", "negative")
  }                     
                     

                     

Question 9
                   
                     When a variable is passed as an argument to a 
                     function, you need to be very careful because 
                     if you change the value of that variable within 
                     the function it will be changed outside the 
                     function as well.
                     
                     Answer TrueFalse
                     
#########################################################################
#########################################################################
 
                     
                     
   
                     
                    
                     

                     
  
                     
                     
   
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     

                                      
                     
                     
                     