#This set of questions is based upon modeling a population of anadromous fish, say salmon. 
#Using what you have learned in the chapter on life history analysis, 
#I want you to create an R script that is based upon the following scenario.

#Suppose a species of salmon that has the following life history characteristics:
  
#The species lives for only 4 years 
#represented by the stages Egg, Smolt, Adult, & Spawning
#During this time, the probability of survival from one stage to the next is 

#Egg->Smolt = 2%, 
#Smolt->Adult = 7%, and 
#Adult->Spawning = 15%.

#Spawning females return to their natal streams and leave behind 5000 eggs. No other stage reproduces.

#I want you to create an R script that takes these data and does the following:
  
#1. Create a transition matrix A
#2. Assume you are stocking a river with 4000 individuals, evenly divided among the four life history stages.

#3. Create plots of:
#-Total Number of individuals in the river through time for 20 time steps
#-Proportion of individual in each stage through 20 time steps
#-Estimation of growth rates using eigen functions

#4. Be prepared to discuss the dynamics of this system.

#I will run this script to see if it works (lack of working means less points).



#Question 1
#Upload the source code here.


#Question 2
#Upload the figure that shows the number of individuals in each stage across 20 generations. 
#Make sure the plot has axes properly labeled and a legend is present that indicates how you 
#differentiate among stages.=.



#Question 3
#Upload an image file of the plot showing the relative fraction of individuals in 
#each stage through 20 generations. Make sure this plot is fully documented.


#Question 4
#The estimate growth rate for this population using 
#the eigen approach is:__________  1.012272


#Question 5
#Make a plot of the population size through time for this simulation. 
#What does it look like? 
#Why might it be a bit difficult to interpret using N(t+1)/N(t)?
#Text Answer


#Question 6
#From a management perspective, these models are very important. 
#Consider the case where some development upstream of this population is being 
#considered but the result is more silting in the river bed. As a consequence, 
#the survival from the first year to the second is cut in half. Considering that 
#this is the only change to the model, how does this influence the population? 
#Can it persist? How do you know?
#Text Answer

###################################################


#1. Create a transition matrix A

A <- matrix(0, nrow = 4, ncol = 4)

A[2,1] <- .02
A[3,2] <- .07
A[4,3] <- .15
A[1,4] <- 5000

A

####################################################

#2. Assume you are stocking a river with 4000 individuals, evenly divided among the four life history stages.

Gen1 <-matrix(c(1000,1000,1000,1000))
Gen1


Gen2<- A %*% Gen1
Gen2

###################################################

#3. Create plots of:
#-Total Number of individuals in the river through time for 20 time steps
#-Proportion of individual in each stage through 20 time steps
#-Estimation of growth rates using eigen functions


#20 Time Steps

Gen20<- matrix(0, nrow =4, ncol = 20)  
Gen20[,1] <-Gen1
Gen20

t<-1
Gen20 [, (t+1)] <- A %*% Gen20 [,t]

t<- t+1

for (t in 2:20) {
  Gen20[,t] <-A %*% Gen20[, (t-1)]
}

Gen20


#Question 2
#Upload the figure that shows the number of individuals in each stage across 20 generations. 
#Make sure the plot has axes properly labeled and a legend is present that indicates how you 
#differentiate among stages.=.

colors <- c("red", "blue", "green", "orange")
stageNames <- c("Seed", "Seedling", "Juvenile", "Adult")
plot(1:20, Gen20[1, ], xlab = "t", ylab = "Number of Individuals", bty = "n",
     col = colors[1], ylim = c(0, 10000), type = "l", lwd = 2)
lines(1:20, Gen20[2, ], col = colors[2], lwd = 2)
lines(1:20, Gen20[3, ], col = colors[3], lwd = 2)
lines(1:20, Gen20[4, ], col = colors[4], lwd = 2)
legend(15, 10000, stageNames, col = colors, lwd = 2, bty = "n")



#Question 3
#Upload an image file of the plot showing the relative fraction of individuals in 
#each stage through 20 generations. Make sure this plot is fully documented.

#Question 5
#Make a plot of the population size through time for this simulation. 
#What does it look like? 

#Why might it be a bit difficult to interpret using N(t+1)/N(t)?
#Text Answer

################################################



#Population at 20 years
sum(Gen20[,20])

#Stage proportion at 20 years
e1<- as.matrix( Re( eigen(A)$vectors[,20]) )

eigen(Gen20[,20])

sum(e1)
ssd<-e1/sum(e1)
sum(ssd)
ssd



#Estimation of Eigen Growth Rate
eigen1<- eigen(A)
lambda1 <- eigen1$values[1] 
Re(lambda1)
Im(lambda1) == 0

