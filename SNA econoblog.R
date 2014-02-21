#http://econometricsense.blogspot.com/2012/04/introduction-to-social-network-analysis.html


# specify the adjacency matrix
A <- matrix(c(0,1,1,1,1,0,1,0,1,1,0,0,1,0,0,0 ),4,4, byrow= TRUE)
EV <- eigen(A) # compute eigenvalues and eigenvectors
max(EV$values)  # find the maximum eigenvalue

# get the eigenvector associated with the largest eigenvalue
centrality <- data.frame(EV$vectors[,1]) 
names(centrality) <- "Centrality"
print(centrality)



par(mfrow=c(2,1))

library(igraph)

G<-graph.adjacency(A, mode=c("undirected"))               # convert adjacency matrix to an igraph object
cent<-data.frame(bet=betweenness(G),eig=evcent(G)$vector) # calculate betweeness & eigenvector centrality 
res<-as.vector(lm(eig~bet,data=cent)$residuals)           # calculate residuals
cent<-transform(cent,res=res)                             # add to centrality data set
write.csv(cent,"r_keyactorcentrality.csv")                # save in project folder

plot(G, layout = layout.fruchterman.reingold)             # network visualization

# create vertex names and scale by centrality
plot(G, layout = layout.fruchterman.reingold, 
     vertex.size = 20*evcent(G)$vector, 
     vertex.label = as.factor(rownames(cent)), 
     main = 'Network Visualization in R')

# key actor analysis - plot eigenvector centrality vs. betweeness
# and scale by residuals from regression: eig~bet




A <- read.csv(file.choose(), header=TRUE, row.names = 1)

#row.names(A) <- A[,1]
#A <- A[,-1]
#A[is.na(A)] <- 0

EV <- eigen(A) # compute eigenvalues and eigenvectors


max(EV$values)  # find the maximum eigenvalue

# get the eigenvector associated with the largest eigenvalue
centrality <- data.frame(EV$vectors[,1]) 
names(centrality) <- "Centrality"
print(centrality)


library(igraph)

Kite<-graph.adjacency(A, mode=c("undirected"))               # convert adjacency matrix to an igraph object

cent<-data.frame(bet=betweenness(Kite),eig=evcent(Kite)$vector) # calculate betweeness & eigenvector centrality 
res<-as.vector(lm(eig~bet,data=cent)$residuals)           # calculate residuals
cent<-transform(cent,res=res)                             # add to centrality data set


par(mfrow=c(3,4), oma = c(1,3, 3, 1))

# network visualization
#plot(Kite, layout = layout.auto, vertex.label = as.factor(rownames(cent)), main = "Auto") 
plot(Kite, layout = layout.random, vertex.label = " ", main = "Random") 
plot(Kite, layout = layout.circle, vertex.label = " ", main = "Circle") 
plot(Kite, layout = layout.sphere, vertex.label = " ", main = "Sphere") 
plot(Kite, layout = layout.graphopt, vertex.label = " ", main = "Graphopt") 
plot(Kite, layout = layout.spring, vertex.label = " ", main = "Spring") 
plot(Kite, layout = layout.fruchterman.reingold, vertex.label =" ", main = "Fruchterman Reingold")
plot(Kite, layout = layout.kamada.kawai,vertex.label = " ", main = "Kamada Kawai") 
plot(Kite, layout = layout.reingold.tilford, vertex.label =" ", main = "Reingold Tilford") 
plot(Kite, layout = layout.fruchterman.reingold.grid, vertex.label = " ", main = "Fruchterman Reingold Grid")
plot(Kite, layout = layout.lgl, vertex.label = " ", main = "Large Graph Layout (LGL)") 
plot(Kite, layout = layout.svd, vertex.label = " ", main = "Singular Value Decomposition (SVD)") 
plot(Kite, layout = layout.drl, vertex.label = " ", main = "Directed Graph Layout (DrL)") 

mtext("Sample of Network Layouts in R", outer = TRUE, cex = 2)

par(mfrow=c(1,1))




Kite<-graph.adjacency(A, mode=c("undirected"))               # convert adjacency matrix to an igraph object

cent<-data.frame(bet=betweenness(Kite),eig=evcent(Kite)$vector) # calculate betweeness & eigenvector centrality 
res<-as.vector(lm(eig~bet,data=cent)$residuals)           # calculate residuals
cent<-transform(cent,res=res)                             # add to centrality data set





windowsFonts(
     A=windowsFont("Algerian"),
     B=windowsFont("Bookman Old Style"),
     C=windowsFont("Comic Sans MS"),
     D=windowsFont("Castellar")
)



par(mfrow=c(1,1), family = "B")

# create vertex names and scale by centrality
plot(Kite, layout = layout.fruchterman.reingold, 
     vertex.size = 20*evcent(Kite)$vector, 
     main = "Kite Network Scaled by Eigenvector Centrality in R",
     sub= "Fruchterman Reingold Layout")


# create vertex names and scale by centrality
plot(Kite, layout = layout.reingold.tilford, 
     vertex.size = 20*evcent(Kite)$vector, 
     main = "Kite Network Scaled by Eigenvector Centrality in R",
     sub = "Reingold Tilford Layout")





#Get the number of rows in Pain1 and assign it to a variable
N1 <- nrow(drug) 

#Generate that many uniform random numbers (Between 0 and 1) 
U1 <-runif (N1,0,1)

#Determine which are greater than .5 and assgin 1 for true and 0 for false
U1<-ifelse(U1 > 0.5,1,0)

#Pull the data points at random as created above
B<-drug[U1 > 0.5,]





#Dya <- ?read.csv(file.choose(),col.names=1, row.names = 1)
#DyAt<-read.csv(file.choose(), header=TRUE,row.names = 1)

dyad<-graph.adjacency(Dya, mode=c("undirected"), diag=FALSE)   




plot(dyad, layout = layout.auto,
 vertex.size = 3,
     vertex.label = NA,
     #main = "Drugnet\nDegree",
     #sub= "Reingold Tilford Layout"
     vertex.color = DyAt[DyAt$RaceGender,]

     )


par(mfrow=c(1,1), oma = c(1,3, 3, 1))

# network visualization
plot(dyad, vertex.size = 3,layout = layout.auto, vertex.label = NA, main = "Auto") 
plot(dyad, vertex.size = 3,layout = layout.sphere, vertex.label = " ", main = "Sphere") 
plot(dyad,vertex.size = 3, layout = layout.graphopt, vertex.label = " ", main = "Graphopt") 
plot(dyad, vertex.size = 3,layout = layout.spring, vertex.label = " ", main = "Spring") 
plot(dyad, vertex.size = 3,layout = layout.fruchterman.reingold, vertex.label =" ", main = "Fruchterman Reingold")
plot(dyad, vertex.size = 3,layout = layout.kamada.kawai,vertex.label = " ", main = "Kamada Kawai") 
plot(dyad, vertex.size = 3,layout = layout.fruchterman.reingold.grid, vertex.label = " ", main = "Fruchterman Reingold Grid")
plot(dyad, vertex.size = 3,layout = layout.lgl, vertex.label = " ", main = "Large Graph Layout (LGL)") 
plot(dyad,vertex.size = 3,layout = layout.svd, vertex.label = " ", main = "Singular Value Decomposition (SVD)") 
plot(dyad, vertex.size = 3,layout = layout.drl, vertex.label = " ", main = "Directed Graph Layout (DrL)") 




library(igraph)

#drug <- read.csv(file.choose(), header=TRUE, row.names = 1)

drugnet<-graph.adjacency(drug, mode=c("undirected"))   

#Degrees
plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = .6*degree(drugnet), 
     vertex.label = "",
     main = "Drugnet\nDegree",
     sub= "Reingold Tilford Layout"
     )

#CLoseness 
plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = 100000*closeness(drugnet), 
     vertex.label = "",
     main = "Drugnet\nCloseness",
     sub= "Reingold Tilford Layout"
     )

#Eigenvector
plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = 20*evcent(drugnet)$vector, 
     vertex.label = "",
     main = "Drugnet\nEigenvector",
     sub= "Reingold Tilford Layout"
     )

#Betweeness
plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = .002*betweenness(drugnet), 
     vertex.label = "",
     main = "Drugnet\nBetweeness",
     sub= "Reingold Tilford Layout"
     )

#Betweeness Circular
plot(drugnet, layout = layout.reingold.tilford (drugnet, circular=TRUE),
 vertex.size = .002*betweenness(drugnet), 
     vertex.label = "",
     main = "Drugnet\nBetweeness\n'Circular'",
     sub= "Reingold Tilford Layout"
     )


require(RColorBrewer)
display.brewer.all()

coloring <- brewer.pal("Blues")

sort(bonpow(drugnet, exponent= 0))


bonpow(graph, nodes=V(graph), loops=FALSE, exponent=1,
    rescale=FALSE, tol=1e-7, sparse=TRUE)

plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = .002*betweenness(drugnet), 
     vertex.label = NA,
     mark.groups = tail(sort(bonpow(drugnet, exponent=0))),
     vertex.color="orange"
          )

plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = .002*betweenness(drugnet), 
     vertex.label = NA,
     mark.groups = tail(sort(centralization.betweenness(drugnet)$res)),
     vertex.color="orange"
          )





plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = .002*betweenness(drugnet), 
     vertex.label = NA,
     #mark.col = coloring,
     mark.groups = tail(sort(authority.score(drugnet)$vector)),
     #mark.groups = largest.cliques(drugnet),
     #main = "Drugnet\nBetweeness\n'Circular'",
     #sub= "Reingold Tilford Layout"
     vertex.color="orange"
          )

plot(drugnet, layout = layout.reingold.tilford,
 vertex.size = .002*betweenness(drugnet), 
     vertex.label = NA,
     mark.col = "red",
     mark.groups = largest.cliques(drugnet),
     add=TRUE
     #main = "Drugnet\nBetweeness\n'Circular'",
     #sub= "Reingold Tilford Layout"
     )

cliques(drugnet)

clique.number(drugnet)


?max


drugat <- read.csv(file.choose(), header=TRUE, row.names=1)
require(RColorBrewer)
display.brewer.all()

coloring <- brewer.pal(293, "Blues")

flan <- degree(drugnet)

class(drugat2)

drugat1<-as.list(drugat)

drugat2<-cbind(drugat$Ethnicity,drugat$Gender,drugat$HasTie) 



     cake <-lapply(1:298, function(x) sample(1:10,3))

     plot(drugnet, layout = layout.reingold.tilford,
     vertex.size =20*evcent(drugnet)$vector, 
     vertex.label = NA,
     main = "Drugnet - Pie Charts - Scaled by Eigenvector",
     vertex.shape="pie",
     vertex.pie=cake)

     plot(drugnet, layout = layout.reingold.tilford,
     vertex.size =1.2*degree(drugnet), 
     vertex.label = NA,
     main = "Drugnet - Pie Charts - Scaled by Degrees",
     vertex.shape="pie",
     vertex.pie=cake)










largest.cliques(drugnet)

H<-centralization.degree(drugnet, normalized = TRUE)
centralization.betweenness
centralization.closeness
centralization.evcent
H$res[H$res>0] 


par(mfrow=c(1,1), oma = c(1,3, 3, 1))

# network visualization
#plot(Kite, layout = layout.auto, vertex.label = as.factor(rownames(cent)), main = "Auto") 
plot(drugnet, layout = layout.random, vertex.size = .1,vertex.label = " ", main = "Random") 
plot(drugnet, layout = layout.circle, vertex.size = .1,vertex.label = " ", main = "Circle") 
plot(drugnet, layout = layout.sphere, vertex.size = .1,vertex.label = " ", main = "Sphere") 
plot(drugnet, layout = layout.graphopt, vertex.size = .1,vertex.label = " ", main = "Graphopt") 
plot(drugnet, layout = layout.spring, vertex.size = .1,vertex.label = " ", main = "Spring") 
plot(drugnet, layout = layout.fruchterman.reingold, vertex.size = .1,vertex.label =" ", main = "Fruchterman Reingold")
plot(drugnet, layout = layout.kamada.kawai,vertex.size = .1,vertex.label = " ", main = "Kamada Kawai") 
plot(drugnet, layout = layout.reingold.tilford, vertex.size = .1,vertex.label =" ", main = "Reingold Tilford") 
plot(drugnet, layout = layout.fruchterman.reingold.grid, vertex.size = .1,vertex.label = " ", main = "Fruchterman Reingold Grid")
plot(drugnet, layout = layout.lgl, vertex.size = .1,vertex.label = " ", main = "Large Graph Layout (LGL)") 
plot(drugnet, layout = layout.svd, vertex.size = .1,vertex.label = " ", main = "Singular Value Decomposition (SVD)") 
plot(drugnet, layout = layout.drl, vertex.size = .1,vertex.label = " ", main = "Directed Graph Layout (DrL)") 

mtext("Sample of Network Layouts in R", outer = TRUE, cex = 2)

par(mfrow=c(1,1))

