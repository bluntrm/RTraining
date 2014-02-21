if (!require("ggplot2")) {
install.packages("ggplot2")
library(ggplot2)
}


#Using the mtcars dataset 
summary(mtcars)


#Comparing plots from base R to GGPLOT2
########################################################################

pdf(file="C:\\Users\\bluntrm\\Desktop\\R Graphic Examples.pdf")
par(mfrow=c(1,1))



#Examples using qplot() - quick plot 

#Scatterplot (Y only)
plot(mtcars$wt)   
qplot(y = mtcars$wt) 


#Scatterplot  (X and Y)
plot(mtcars$wt, mtcars$mpg)
qplot(mtcars$wt, mtcars$mpg)



#Scatterplot  (X and Y with Linear Regression)
plot(mtcars$wt, mtcars$mpg)
abline(lm(mtcars$mpg~mtcars$wt)) #plot formula for lm()

qplot(mtcars$wt, mtcars$mpg, geom=c("smooth","point"), method=lm) #specify smooth (line) and point.



#Bubble plot
radi<-sqrt(mtcars$hp/pi)  #set proportions for third scaler
symbols(mtcars$wt,mtcars$mpg, circles=radi,   #Plot shapes
      inches=0.1, fg="sky blue4", bg="sky blue3")    
abline(lm(mtcars$mpg~mtcars$wt))
legend(max(mtcars$wt)*.8, (max(mtcars$mpg))*.95, "Insert Legend Here", pch=1)


qplot(mtcars$wt, mtcars$mpg, geom=c("point", "smooth"), method=lm, 
     colour = mtcars$wt,  #Scale by color
     size= mtcars$hp)  #scale by shape



#Faceted scatter plot
qplot(mpg, wt, data=mtcars, facets=vs ~ am) #Must specify data= to use facets




#ggplot() Examples - building with layers
##############################################################
     
#Dot Plot 
mtcars2<-cbind(names=row.names(mtcars),mtcars) #Moving dataframe row names into a vector for plotting


     #Mpg and Names 
ggplot(mtcars2, aes(x=mpg, y=names)) +     
     geom_point(size=3)  #geoms are the basic layer for a plot.
     
     #Mpg and Wt
ggplot(mtcars2, aes(x=mpg, y=wt)) +     
     geom_point(size=3)  

     #Mpg, names and weight
ggplot(mtcars2, aes(x=mpg, y=reorder(names,wt))) +     #reorder() sorts a categorical variable by a numerical variable
     geom_point(size=3) 

     #Adding facets
ggplot(mtcars2, aes(x=mpg, y=reorder(names,wt))) +    
     geom_point(size=3) +
     facet_grid(vs ~ am , scales="free_y", space="free_y") #as opposed to fixed or free_x


     
dev.off()


