################################
####Graphics in R

#Pulling in dataset for Cherry Trees 
Cherry1 <- read.csv(file.choose(),header=TRUE)  
Cherry1




##Histograms

#hist() Histogram command. Add details inside of the ()

hist(Cherry1$Volume,
	main ="Histogram of Cherry Trees",  ## main = "title"
	xlab="Volume", 				## xlab= "x axis label", ylab= "y axis lable"
	col=26)					##col = "color or color number"





####Boxplots

#boxplot(data1,attributes)

boxplot(Cherry1$Diam,
	main="Diameter", 				#title			
	ylab= "Diameters", 			#y label
	col=45)#color				#Color

#commas between each attribute

Heart1 <-read.csv(file.choose(),header=TRUE)
Heart1

boxplot(Heart1$Before,					#Select column to plot
	main="before",					#Give it a title
	ylab="Heart Rate Taken Before X activity",#Lable the y axis
	col=85						#Choose a color	
	)


###Boxplots can be done side by side

### Two Boxplots, side by side
boxplot(Heart1$Before, Heart1$After,			#Select the columns to plot
	main="Plots of Heart Rates, Before and After",	#Add title
	ylab="Measured Heart Rate",				#Lable the y-axis
	names=c("Before Activity", "After Activity"), 	#Name the individual Boxplots  
	col=c("red","blue")					#Color of each plot (names or nyumbers)
	)

#Plots and attributes are edited in the order they're entered, 	

Heart2 <-read.csv(file.choose(),header=TRUE)
Heart2


### Four Boxplots, side by side
boxplot(Heart2$BeforeA, Heart2$AfterA,Heart2$BeforeB, Heart2$AfterB,
	main="Plots of Heart Rates, A vs. B",
	ylab="Measured Heart Rate, Before and After, of Groups A and B",
	names=c("Before A", "After A", "Before B", "After B"),
	col=c("28","55","28","55")			
	)



####Scatterplots

PCB1 <-read.csv(file.choose(),header=TRUE)
PCB1

#plot(x-variable, y-variable)  #Command for scatterplots

plot(PCB1$Age,PCB1$PCB,		#(x,y) format
	main="PCB vs. Age",
	xlab="Age",
	ylab="PCB",
	col="blue",
	pch=18)   			##This changes the points 
	



###Regression Line 

abline(lm(PCB1$PCB~PCB1$Age), #Regression Line (y,x) format
	col="blue",			#Line Color
	lty=4)    			#Line Type 





#####################################
#Example 2
Skier1 <-read.csv(file.choose(),header=TRUE)
Skier1

##For these examples, pay attention to the (x,y) as coded below, they're backwards  

##CPK vs. Age
plot(Skier1$CPK,Skier1$Age,		#(x,y) format
	main="CPK vs. Age",
	xlab="Age",
	ylab="CPK",
	col="blue",
	pch=18)   

abline(lm(Skier1$Age~Skier1$CPK), #Regression Line (y,x) format
	col="blue",			#Line Color
	lty=4)    			#Line Type 


##CPK vs. Weight
plot(Skier1$CPK,Skier1$Weight,		#(x,y) format
	main="CPK vs. Weight",
	xlab="Weight",
	ylab="CPK",
	col="blue",
	pch=18)   

abline(lm(Skier1$Weight~Skier1$CPK), #Regression Line (y,x) format
	col="blue",			#Line Color
	lty=56)    			#Line Type 


############################################



####Creating Subsets

Baby1 <-read.csv(file.choose(),header=TRUE)
Baby1

babies3 <-Baby1[Baby1$Age==3, ]	#This is creating subplots of the
babies12 <-Baby1[Baby1$Age==12, ]	# equal to 12
babies24 <-Baby1[Baby1$Age==24, ]	# equal to 24


plot(babies3$x1,babies3$x2,
	main="x1 vs. x2",
	xlab="x1",
	ylab="x2",
	col="red",
	pch=1
	)  

##These points are off the chart, R uses the original plot to mark range

points(babies12$x1,babies12$x2,	#This adds other points to the plot
	pch=2,
	col="blue"
	)



###Setting Plot Domain, Range

Minx1 <- min(Baby1$x1)		#This sets a command for minimum of x1
Maxx1 <- max(Baby1$x1)		#This sets a command for Maximum of x1
Minx2 <- min(Baby1$x2)
Maxx2 <- max(Baby1$x2)


plot(babies3$x1, babies3$x2,
	xlab="x1", ylab="x2", main="x1 vs x2",
	col="red", pch=1,
	xlim=c(Minx1, Maxx1), 	#This sets the limits at the defined commands
	ylim=c(Minx2, Maxx2)	#This is the 
	)


points(babies12$x1,babies12$x2,	#This adds other points to the plot
	pch=2,
	col="blue"
	)
points(babies24$x1,babies24$x2,	#This adds other points to the plot
	pch=3,
	col="Sea Green"
	)



###Adding a Legend

legend(0.25, 400, 					#This is the x,y coordinates (top left) within the plot for the legend's placement
	c("3 Months", "12 Months", "24 Months"), 	#These are labels, in order of code
	col=c("red","blue","Sea Green"),		#These are colors, in order of code
	pch=c(1,2,3),					#These are points, in order of code
	)




###Adding Several Plots in the Same Window

#par(mfrow=c(2,1)) This says "make two rows and one column"
#adding the statement 'horizontal=TRUE' will turn a plot on it's side if necessary


par(mfrow=c(2,1))				##This code is used before the plot code

###Plot 1
plot(Cherry1$Diam, Cherry1$Height,
	xlab="Diameter", ylab="Height", main="Diameter v. Height",
	col="red", pch=1,
	)

abline(lm(Cherry1$Height~Cherry1$Diam), #Regression Line (y,x) format
	col="blue",			#Line Color
	lty=56)    			#Line Type 

###Plot 2
plot(Cherry1$Diam, Cherry1$Volume,
	xlab="Diameter", ylab="Volume", main="Diameter v. Volume",
	col="blue", pch=1,
	)

abline(lm(Cherry1$Volume~Cherry1$Diam), #Regression Line (y,x) format
	col="red",			#Line Color
	lty=56)    			#Line Type 

