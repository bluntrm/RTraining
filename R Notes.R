################################################################
### Intro to R Workshop 

#Number sign is used for comments; this won't be run
#Ctrl-R is a short cut to run the code
#CSV are preferred file types
# "R Studio" is a recommended console

##data1 <-read.csv(file.choose(),header=TRUE)

#data1 is naming the file
#<- assigns the command to a the name value
#Always add a number to your file name so it doesn't replace a command definition
#Case sensitive
# file.choose() can be replaced with the file path

###Here is how to read in data

PCB1 <- read.csv(file.choose(), header=TRUE)
PCB1

###Grab a column using the $ sign
#Using the $ will refer a specific column

PCB1$Age  ## Example: PCB1$Age will pull the age column (Age is case sensitive!)
PCB1$PCB

#Command: data[row,column] will pull a specific row and column by number
#Leaving one blank will pull all of those values

PCB1[ ,1] #This pulls the entire column
PCB1[1, ] #This pulls the entire row
PCB1[3,2] #This pulls a specific row/column


# Basic Logic operators
# < Less than
# > Greater than
#  == Equal to
#  != Not equal to

PCB1[ PCB1$Age > 3, ]  #Adding the comma blank includes all of the column values

#Using multiple logic statments
# & And
# | Or ("Shift"+"\")
# ! Not
# xor() is the exclusive OR operator - one or the other

PCB1[PCB1$Age >3 & PCB1$PCB <9, ] #Age Greater than 3 and PCB less than 9
PCB1[PCB1$Age >3 | PCB1$PCB1 <9, ] #Age greater than 3 or PCB less than 9

#### Using up or down arrows in the console will scroll through previous commands

##To find missing data use "is.na(variable)", where na is R for missing


####New Example, Using Text Data

Pain1<- read.csv(file.choose(),header=TRUE) ##Pull in the Dataset

Pain1[Pain1$HairColour == "LightBlond", ]  #Put text in Quotes or it won't read the variable
 
N1 <- nrow (PCB1) #This will set a command to draw up the number of rows

N1  #This is the command just created

U1<- runif(N1,0,1) #Generates N1 random numbers

U1

ifelse(U1 > 0.5, 1, 0) #returns a true or false, if > 0.5, 


####Entering data manually

Data1 <- c(1,3,5,7,9)  #Creating a data set with those values
Data1
Data2 <- c(2,4,6,8,10)  #Creating a second data set
Data2


#cbind() #Combines columns together 
#rbind() #Combines rows together
#These must have the same number of rows/columns to combine

cbind(Data1,Data2)
rbind(Data1,Data2)

Data3<-rbind(Data1,Data2) #Create a new data set with the combined rows

#To add column names #colnames(Data3) <-c("a","b","c","d","e")

colnames(Data3)<-c("a","b","c","d","e") #Add names to the new dataset

Data3

##Editing the new data set
Data4 <-edit(Data3) #Brings up a data editor


###Help function, brings up an R google search
#two ways to call help: help() or ?item

?mean
help(mean)


####Using Math

#Standard Math functions apply +,-,*,/,^

Data1+Data2 #Adds these values together

#sum() of all elements
#mean()
#sd() Standard Deviation
#min() Minimum
#max() Maximum

mean(PCB1$PCB)
max(PCB1$PCB)
min(PCB1$PCB)
sd(PCB1$PCB)
median(PCB1$PCB)
sum(PCB1$PCB)

#quantile() returns a value, such as quartiles (Q1, Q3,etc.) or whatever is defined

quantile(PCB1$PCB, 0.25) 
quantile(PCB1$PCB, 0.75)
quantile(PCB1$PCB, c(0.25,0.5,0.75)) #this runs several values in one command


#Applying the same function on multiple columns
#apply()
#apply(dataset, 1, function) for rows
#apply(dataset, 2, function) for columns

apply(PCB1,1,mean) #Notice this results in a result for each row
apply(PCB1,2,mean) #This results in a result for each row


#tapply(dataset,index,function) subset counts
tapply(Pain1$Pain, Pain1$HairColour, mean)


##Correlation Coeffcient and R^2

#cor(data) Runs the correlation coeffcient
cor(PCB1)
#cor(data)^2 Runs the R^2 value
cor(PCB1)^2
#Or subset for a specific value
cor(PCB1)[1,2]^2


###Fitting a Regression Line y=a+bx
#use the lm() function
#lm(y-value ~ x-value)
#Gives the y-intercept and the slope

lm(PCB1$PCB ~ PCB1$Age)

#table() Contingency table for categorical values
table(Pain1)


### 5-digit Summary
#summary() Gives the 5 digit summary, plus the mean
summary(PCB1)
summary(Pain1)

### Random Sampling Data
#sample(dataset, size of sample)
#gives a random sample of your data
#Specify the column

sample(PCB1$PCB,10)


####Random Number Generator
##runif(number, lower, upper) number of sample, lower bound, upper bound

runif(15, 0, 300)

###If Statements
#if(condition){do this} else {do this} 




