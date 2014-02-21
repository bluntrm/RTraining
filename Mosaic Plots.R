library(vcd)



SCCAP <- read.csv(file.choose(),  header = TRUE)

#pcp_ia  sp_ia	pcp_q	sp_q

mosaic(~pcp_ia + sp_ia | pcp_q	+ sp_q, data = PCB1, shade=TRUE, legend=TRUE) 



        
PCB1<-(cbind(SCCAP$pcp_ia,SCCAP$sp_ia, SCCAP$pcp_q, SCCAP$sp_q), rbind (SCCAP[1,], SCCAP[2]))


PCB3<-data.frame(PCB2)
PCB2<-cbind(SCCAP$pcp_ia, SCCAP$pcp_q, SCCAP$pcp_open)

summary(PCB3)

mosaicplot(PCB3, main="Statements/Questions",  
       xlab= "Visit Iteration", color = T)

################################


names <-c("pcp_int\n",
          "pcp_medhist\n",
          "pcp_gimedhist\n",
          "pcp_fammedhist\n",
          "pcp_hlthbeh\n",
          "pcp_psychinfo\n",
          "pcp_physexam\n",
          "pcp_sympt\n",
          "pcp_oript\n",
          "pcp_fin\n",
          "pcp_possdiag\n",
          "pcp_ref\n",
          "pcp_tests\n",
          "pcp_med\n",
          "pcp_othertx\n",
          "pcp_emot\n",
          "pcp_social\n",
          "pcp_closing\n",
          "pcp_unint\n",
          "pcp_bckch\n"
)


par(mfrow=c(1,1), oma = c(0, 0, 3, 0))

w<-rbind(slices, slices_mean, slices_mean_f, slices_mean_m
         , slices_mean_aa, slices_mean_c)

#colours<- c("red", "green", "yellow", "purple", "orange", "blue")

mosaicplot (w,main ="Major Topic Groupings") 

mosaicplot (w,col = heat.colors(10),main ="Major Topic Groupings") 



doubledecker(w, 
             gp = gpar(fill = rev(grey.colors(tail(dim(x), 1)))),
             ,labeling_doubledecker = c(varnames = T, labbl_varnames = T),
             shading=TRUE,
             main="Major Topic Headings")






d <- data.frame(
     var1 = slices,
     var2= slices_mean,
     row.names = names
)

x<-data.frame(w, row.names = c("Your Visits", "All Physician Visits") 
)


x1 ="Information Gathering \n on Symptoms",
var2 ="Medical History",
var3 ="Social History",
var4 ="Differential Diagnosis",
var5 ="Recomendations \n for Symptoms",
var6 = "Rapport Building")












