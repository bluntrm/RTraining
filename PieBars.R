# library(sqldf)
# library(plotrix)
# library(ggplot2)
# require (gplots)
# library(vcd)


#p <- read.csv(file.choose(), header=TRUE)
p_sub<-p[p$PHYID==68,]
p_sub[is.na(p_sub)] <- 0 



par(mfrow=c(3,2), oma = c(1, 3, 3, 1),  family="serif") 

mtext("% Bottom", outer = TRUE, cex = 1.5)


info_gather<-sum(p_sub$pcp_physexam,p_sub$pcp_sympt)
medical_history<-sum(p_sub$pcp_medhist, p_sub$pcp_gimedhist, p_sub$pcp_fammedhist)
social_history<-sum(p_sub$pcp_psychinfo, p_sub$pcp_hlthbeh, p_sub$pcp_fin)
diff_diag<-sum(p_sub$pcp_possdiag)
recomendations<-sum(p_sub$pcp_tests, p_sub$pcp_ref, p_sub$pcp_med,p_sub$pcp_othertx, p_sub$pcp_closing)
rapport_building<-sum(p_sub$pcp_int ,p_sub$pcp_social, p_sub$pcp_emot)

info_gather_mean<-sum(p_sub$pcp_physexam_mean,p_sub$pcp_sympt_mean)
medical_history_mean<-sum(p_sub$pcp_medhist_mean, p_sub$pcp_gimedhist_mean, p_sub$pcp_fammedhist_mean)
social_history_mean<-sum(p_sub$pcp_psychinfo_mean, p_sub$pcp_hlthbeh_mean, p_sub$pcp_fin_mean)
diff_diag_mean<-sum(p_sub$pcp_possdiag_mean)
recomendations_mean<-sum(p_sub$pcp_tests_mean, p_sub$pcp_ref_mean, p_sub$pcp_med_mean,p_sub$pcp_othertx_mean, p_sub$pcp_closing_mean)
rapport_building_mean<-sum(p_sub$pcp_int_mean ,p_sub$pcp_social_mean, p_sub$pcp_emot_mean)


slices <- c(info_gather,
            medical_history,
            social_history,
            diff_diag,
            recomendations,
            rapport_building)

slices_mean <- c(info_gather_mean,
                 medical_history_mean,
                 social_history_mean,
                 diff_diag_mean,
                 recomendations_mean,
                 rapport_building_mean)

slice_names <-c("Information Gathering \non Symptoms",
                "Medical History",
                "Social History",
                "Differential Diagnosis",
                "Recomendations \nfor Symptoms",
                "Rapport Building")



max_out<-ifelse( (max(slices) >= max(slices_mean)), max(slices), max(slices_mean))



barplot (as.matrix(slices),                                          #Data object needs to be a vector
         col=rainbow(20),                                       #Setting Colors
         beside=TRUE,                                               #Changed bar orientation (Instead of stacked)
         main="Your Score",                                  #Main title
         xlab= "Statements",                                             #X label  
         names.arg= slice_names,                                        #Names bars using the "namesi" object from above
         cex.names=.5,                                              #Text size
         horiz=T,
         las=1 ,xlim=c(0,.5)  )                                                 #Horizontal bars


abline(xpd=F, v=c(.05, .10,.15,  .20,.25, .30), col="grey40", lty="dotted" )

abline(xpd=F, v=c(20,40,60,80,100), col="grey40")
abline(xpd=F,v=c(10, 20,30, 40,50 , 60, 70, 90), col="grey40", lty="dotted" )


barplot (as.matrix(slices_mean),                                          #Data object needs to be a vector
         col=rainbow(20),                                       #Setting Colors
         beside=TRUE,                                               #Changed bar orientation (Instead of stacked)
         main="All Physicians",                                  #Main title
         xlab= "Statements",                                             #X label  
         names.arg= slice_names,                                        #Names bars using the "namesi" object from above
         cex.names=.5,                                              #Text size
         horiz=T,
         las=1,xlim= c(0,.5)  )                                                #Horizontal bars

abline(xpd=F,v=c(.05, .10,.15,  .20,.25, .30), col="grey40", lty="dotted" )
abline(xpd=F,v=c(20,40,60,80,100), col="grey40")
abline(xpd=F,v=c(10, 20,30, 40,50 , 60, 70,90), col="grey40", lty="dotted" )





#EXTRA CODE -- JUST IN CASE


slice_nam <-c("Introduction",
                   "Medical History",
                   "GI Medical History",
                   "Fmaily Medical History",
                   "Health Behaviour",
                   "Psychosocial Information",
                   "Physcial Exam",
                   "Symptoms",
                   "Orients Patient",
                   "Financial",
                   "Possible Diagnosis",
                   "Referrals",
                   "Tests",
                   "Medication",
                   "Other Treatment",
                   "Emotion",
                   "Social Chit-Chat",
                   "Closing",
                   "Unintelligible",
                   "Backchannel")

barplot (as.matrix(slices_mean_f),                                          #Data object needs to be a vector
         col=rainbow(20),                                       #Setting Colors
         beside=TRUE,                                               #Changed bar orientation (Instead of stacked)
         main="Female Visits",                                  #Main title
         xlab= "Statements",                                             #X label  
         names.arg= slice_nam,                                        #Names bars using the "namesi" object from above
         cex.names=.5,                                              #Text size
         horiz=T,
         las=1,xlim= c(0,.5)  ) 

abline(v=c(.05, .10,.15,  .20,.25, .30), col="grey40", lty="dotted" )
abline(v=c(20,40,60), col="grey40")
abline(v=c(10, 20,30, 40,50 , 60, 70), col="grey40", lty="dotted" )


barplot (as.matrix(slices_mean_m),                                          #Data object needs to be a vector
         col=rainbow(20),                                       #Setting Colors
         beside=TRUE,                                               #Changed bar orientation (Instead of stacked)
         main="Male Visits",                                  #Main title
         xlab= "Statements",                                             #X label  
         names.arg= slice_nam,                                        #Names bars using the "namesi" object from above
         cex.names=.5,                                              #Text size
         horiz=T,
         las=1,xlim= c(0,.5)  )


abline(v=c(.05, .10,.15,  .20,.25, .30), col="grey40", lty="dotted" )
abline(v=c(20,40,60), col="grey40")
abline(v=c(10, 20,30, 40,50 , 60, 70), col="grey40", lty="dotted" )

barplot (as.matrix(slices_mean_aa),                                          #Data object needs to be a vector
         col=rainbow(20),                                       #Setting Colors
         beside=TRUE,                                               #Changed bar orientation (Instead of stacked)
         main="African American Visits",                                  #Main title
         xlab= "Statements",                                             #X label  
         names.arg= slice_nam,                                        #Names bars using the "namesi" object from above
         cex.names=.5,                                              #Text size
         horiz=T,
         las=1,xlim= c(0,.5)  )    

abline(v=c(.05, .10,.15,  .20,.25, .30), col="grey40", lty="dotted" )
abline(v=c(20,40,60), col="grey40")
abline(v=c(10, 20,30, 40,50 , 60, 70), col="grey40", lty="dotted" )


barplot (as.matrix(slices_mean_c),                                          #Data object needs to be a vector
         col=rainbow(20),                                       #Setting Colors
         beside=TRUE,                                               #Changed bar orientation (Instead of stacked)
         main="Caucasian Visits",                                  #Main title
         xlab= "Statements",                                             #X label  
         names.arg= slice_nam,                                        #Names bars using the "namesi" object from above
         cex.names=.5,                                              #Text size
         horiz=T,
         las=1,xlim= c(0,.5)  )                                                 #Horizontal bars


abline(v=c(.05, .10,.15,  .20,.25, .30), col="grey40", lty="dotted" )
abline(v=c(20,40,60), col="grey40")
abline(v=c(10, 20,30, 40,50 , 60, 70), col="grey40", lty="dotted" )
 



 