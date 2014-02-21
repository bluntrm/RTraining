journal <- read.csv (file.choose(), header=TRUE)

row.names(journal) <- journal[,1]
journal <- journal[,-1]

journal<-as.matrix(journal)


# specify the adjacency matrix
EV <- eigen(journal) # compute eigenvalues and eigenvectors
max(EV$values)  # find the maximum eigenvalue

# get the eigenvector associated with the largest eigenvalue
centrality <- data.frame(EV$vectors[,1]) 
names(centrality) <- "Centrality"
print(centrality)






library(igraph)

G<-graph.adjacency(journal, mode=c("undirected"))               # convert adjacency matrix to an igraph object
cent<-data.frame(bet=betweenness(G),eig=evcent(G)$vector) # calculate betweeness & eigenvector centrality 
res<-as.vector(lm(eig~bet,data=cent)$residuals)           # calculate residuals
cent<-transform(cent,res=res)                             # add to centrality data set
write.csv(cent,"r_keyactorcentrality.csv")                # save in project folder

plot(G, layout = layout.fruchterman.reingold,
           main = 'SBHD Faculty Journal Publishing')             # network visualization

# create vertex names and scale by centrality
plot(G, layout = layout.fruchterman.reingold, 
     vertex.size = 20*evcent(G)$vector, 
     vertex.label = as.factor(rownames(cent)), 
     main = 'SBHD Faculty Journal Publishing')

# key actor analysis - plot eigenvector centrality vs. betweeness
# and scale by residuals from regression: eig~bet

library(ggplot2)

p<-ggplot(cent,aes(x=bet,y=eig,label=rownames(cent),colour=res,
                   size=abs(res)))+xlab("Betweenness Centrality")+ylab("Eigenvector Centrality")


#pdf('key_actor_analysis.pdf')
p+geom_text()+opts(title="Key Actor Analysis")   

#dev.off()




