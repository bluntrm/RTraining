corn.data <- read.csv(file.choose(),header=TRUE, sep = "\t")


quantile(corn.data$Fertilizer_A,.5)
quantile(corn.data$Fertilizer_B,.5)
quantile(corn.data$Fertilizer_C,.5)

median(corn.data$Fertilizer_A)
median(corn.data$Fertilizer_B)
median(corn.data$Fertilizer_C)

summary(corn.data)
----------------------------------------

Of the 15 students in this class, 
if 14 receive a passing grade, 
is passing rate significantly different from p=0.65?

prop.test(14, 15, .65, alternative = "t")

----------------------------------------


Assume that you observed coat colors in guinea pigs in the following counts: 

Nspots = 12 individuals with spots, 
Nsilky = 22 with silky fur, 
NSmooth = 15 smooth coated, and 
Naguti = 8 aguti. 

Test the hypothesis that these coat colors occur in equal frequencies using a ??2 test. 
Report below the associated P-value.
Answer 

?chisq.test

ginnypig<-as.matrix(c(12,22,15,8))
ginnypig
chisq.test(ginnypig)

-----------------------------------------
  
  
The Kruskal-Wallis Rank sum test is used to test multiple treatments. Using the "CornOutput.csv" 
data set test for the statistical differences in the fertilizer treatments (Fertilizer_A, Fertilizer_B, 
and Fertilizer_C). Report below the ??2 statistic.

  
kruskal.test(corn.data)
  


--------------------------------------
Load the data CornOutput.csv into R. These data represent the output in numbers of bushels 
per acre of corn with three different fertilizer treatments. Create and upload a density plot 
showing the distribution of bushels yielded by each treatment


#Just for fun
#apply(corn.data,2,density)


colors <- c("red", "blue", "green")
corn.names <- c("Fertilizer A", "Fertilizer B", "Fertilizer C")

plot(density (corn.data[ ,1]), col = "red", xlab = "Bushels", main = "Chapter 10 - Question 4")  
lines(density(corn.data[,2]), col = "blue")
lines(density(corn.data[,3]), col = "green")

legend(8, .13, corn.names, col = colors, bty = "n", lwd =2)





The pine germination data (from the Chapter) shows that germination of Pinus echinata seedlings is 
significantly differentiated between the control and the cutting treatments. In this question, 
test for differences in the cutting treatments (SEL & CLR) using a Wilcoxon Rank Sum test. 

Are the germination rates significantly differentiated (with ?? = 0.05)? #NO! p= .5068 


pine.data <- read.table(file.choose(),header=TRUE, sep = "")

X <- pine.data$GERM[pine.data$TRT == "CLR"]
Y <- pine.data$GERM[pine.data$TRT == "SEL"]

wilcox.test(Y,X)




Create and upload a bar graph of reported student diversity for the a
cademic year 2006-2007 from VCU (data from the Chapter) and the following 
institutions:
  
Auburn University
University of Virginia

Standardize the counts to percentages to facilitate easier comparison.


race.cat <- c("N-R","B/NH", "AI/AN",
               "A/PI", "H", "W/NH",
               "R/EU")

Auburn.race<- c(130,1615,127, 319, 342, 16560,274)
UVA.1<-c(166,238, 5,351,129,1994, 208)
UVA.2<-c(604, 1141, 23,1455, 532, 8711, 969)
UVA.race<-UVA.1 + UVA.2
VCU.race<-c(512,3983,124,1970,709,11180,1019)


VCU.race.p<-VCU.race / sum(VCU.race)
Auburn.race.p<-Auburn.race / sum(Auburn.race)
UVA.race.p<-Auburn.race / sum (Auburn.race)

race.plot.p<-rbind(VCU.race.p,UVA.race.p,Auburn.race.p)



colors <- c("black", "gold", "white")
labels <- c("NR", "BNH", "AIAN", "API", "H", "WNH", "Unk")
barplot(race.plot.p, names.arg = race.cat, beside = TRUE, col = colors, 
        main = "Chapter 10, Question 1", xlab = "Race/Ethnicity",
        ylab = "Percentage Enrolled, 2006-2007")

legend(0, 0.6, c("VCU", "UVA", "Auburn"), fill = colors, bty = "n")






Categories <- c("Non-resident", "Black non-Hispanic", 
                "American Indian or Alaskan Native",
                "Asian or Pacific Islander", 
                "Hispanic", 
                "White non-Hispanic",
                "Race/ethnicity unknown")

Auburn.race<- c(130,1615,127, 319, 342, 16560,274)

UVA.1<-c(166,238, 5,351,129,1994, 208)
UVA.2<-c(604, 1141, 23,1455, 532, 8711, 969)
UVA.race<-UVA.1 + UVA.2

VCU.race<-c(512,3983,124,1970,709,11180,1019)

uni.demo<-rbind(VCU.race, UVA.race,Auburn.race)

q2<-matrix(t(uni.demo), ncol = 3)

rownames(q2)<- Categories

q2

chisq.test(q2)



Statistically test the differences in reported student diversity for the 
academic year 2006-2007 from VCU (data from the Chapter) and the 
following institutions: 

Statistically test the hypothesis that these institutions have equal diversity.

#Ho: Diversity between locations is homogenious
#Ha: Diversity between locations is heterogenius
#Alpha = .25
#Test Statistic: chisq.test() in R
#Decision Rule: If the P-value < alpha, then reject H0

#############################################################
#######################################################################
###################################################################

install.packages(c("xtable", "tm", "wordcloud", "RColorBrewer"))

Question 1

Create a table of the different words found in the first paragraph 
of this Chapter (Chapter 11).


paragraph1<-c("while the majority of biological data is numeric in nature there are still several important reasons to be able to manipulate character-based information for example you may be downloading all the references from a online database such as WebOfScience and want to mine the abstracts for metadata you may also be interested in working with sequence data which consists of mostly text information in this relatively short chapter we will learn about how we can work with string in data in R and look at a few examples using genetic sequences")

ParaG<- unlist(strsplit(paragraph1, " "))

table(ParaG)


Question 2

The 2012 Presidential State of the Union Speech is located in the 
Chapter in the file "SOTU.R". Source this code and you will find a 
data.frame where each row is paragraph of the speech. 
Create a word cloud from this text.


require(tm)
require(wordcloud)
source("SOTU.R")

corpus<-Corpus(DataframeSource(SOTU))

summary(corpus)

corpus<-tm_map(corpus,removePunctuation)
corpus<-tm_map(corpus,tolower)
corpus<-tm_map(corpus,removeNumbers)
corpus<-tm_map(corpus,stripWhitespace)


removeMyWords <- function(x) {
  ret <- removeWords(x, stopwords("english"))
  return(ret)
}

corpus <- tm_map(corpus, removeMyWords)

tdm <- TermDocumentMatrix(corpus)
m<-as.matrix(tdm)
m[1:3,]

p<-sort(rowSums(m), decreasing = TRUE)
df<-data.frame(words = names(p), freq = p)

wordcloud(names(p),p)

require(RColorBrewer)


Question 3

Take the word cloud in the previous question and, using RColorBrewer,
color the words based upon their frequency.

display.brewer.all()

pal <- brewer.pal(9, "Blues")

wordcloud(df$word, df$freq, col = pal, scale = c(6, 0.2), rot.per = 0.4,
          random.order = T)




Question 4

Create a density plot of the ??2 distribution with df=2. Label the
y-axis using the "expression.()" function so that it reads "??2" 
appropriately.


plot(density(rchisq(10,2)), ylab = "X²", main = "Chapter 11, Question 4", col = "blue", bg ="yellow")

?expressionx



Question 5

Show the code that fixes the string x <- "Dr. Dyer is a loser" 
(and when I say 'fix' I mean change it to say Im not one...)

x <- "Dr. Dyer is a loser"
y<-"not"

paste(substring(x,1,11),(paste(y, substring(x,12),collapse = "  ")))





Question 6
  
Create a table from the data data <- matrix( rnorm(9), nrow=3 ) 
and label the rows as c("Richmond", "Petersburg", "Varina") 
and the columns as c("PPM(A)", "PPM(B)", "PPM(C)"). Use the 
xtable library to export this table as HTML and upload it here.


data.q <- matrix( rnorm(9), nrow=3 )

City.Names<- c("Richmond", "Petersburg", "Varina")
PPM.Labels<- c("PPM(A)", "PPM(B)", "PPM(C)")


rownames(data.q)<- City.Names
colnames(data.q)<- PPM.Labels

data.q.6 <- xtable(data.q, "Chapter 11 - Question 6",align = "l|ccc")

print(data.q.6, type = "html", file = "Chpt11Q6.html")


print(data.q)