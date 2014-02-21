#Will need to clean out garbage code-
#Revisit the NA Omit logic statement to see that it's functioning correctly
#Adapt code for the zero array data step added to SAS Code.


#CRC1 <- read.csv(file.choose(), header=TRUE)

CRC1 <-read.csv('H:\\REDCap\\Data Imports\\Discrepancy\\R Source.csv'
         , header=TRUE)

#Creates a single column of phy_ID's for vector reference
#CRCID<-CRC1[ ,2]          


#Thoughts: a1 and r1 specify case rows.  If all of the functions are written on 
#for these, they can be reassigned to different cases as needed later.



#Step 1
a1<-CRC1[CRC1$case_name== "607_2", ]               #Subsets by specific case [row 3, all columns]
r1<-CRC1[CRC1$case_name== "607_2R", ]              #Subsets by specific case [row 12, all columns]

#case1_1<-rbind(a1,r1)       #Pairs the specific cases together


#SUBSETING THE SP AND PCP DATA
#a1[ ,order(names(a1))]      #Sorts alphabetically allowing SP and PCP variables to be pulled seperately

#a1[ ,sort(names(a1))]       #Sorts alphabetically allowing SP and PCP variables to be pulled seperately     



#These are just for testing the code on a small set of variables (S's and Q's).  

#a1_qs<-sum(a1$pcp_ia,a1$sp_ia,a1$pcp_q,a1$sp_q)      #Total Q and Statements, a1
#r1_qs<-sum(r1$pcp_ia,r1$sp_ia,r1$pcp_q,r1$sp_q)      #Total Q and Statemtnts, r1

#s_to_q<-c(a1$pcp_ia,a1$sp_ia,a1$pcp_q,a1$sp_q)      #Combines a1 columns for stat and ques



#FREQUENCY COUNT
#A logical statement produces 1 for true 0 for false.  If the cell contains > 0, 1,0). 
#The sum of the TRUE outputs is given.  These will need to be made into an object for the list

#sum(ifelse(s_to_q > 0, 1,0))                      #Either collapse all of the variables into an object
#sum(ifelse(c(a1$pcp_ia,a1$sp_ia,a1$pcp_q,a1$sp_q) > 0, 1,0))  #Or type out the variables seperately


#Logical statement and sum based on a range.
#sum(ifelse(c(subset(a1, select = pcp_ia:sp_q)) > 0, 1,0))   #This pulls all columns in the range + Frequency

#subset(a1, select = pcp_ia:sp_q)    
#subset(a1, select = pcp_int:sp_bckch)       


#MAJOR TOPIC HEADINGS - This creates an object to store MTH variables for a1 and r1
#na.omit removes NA categories so the logic statement on Frequency can work
a1_mth_pcp<-na.omit(c(a1$pcp_int,  a1$pcp_medhist,	a1$pcp_gimedhist,	a1$pcp_fammedhist,	a1$pcp_hlthbeh,	a1$pcp_psychinfo,	a1$pcp_physexam,	
               a1$pcp_sympt,	a1$pcp_oript,	a1$pcp_fin,	a1$pcp_possdiag,	a1$pcp_ref,	a1$pcp_tests,	a1$pcp_med,	a1$pcp_othertx,
               a1$pcp_emot,	a1$pcp_social,	a1$pcp_closing,	a1$pcp_unint,	a1$pcp_bckch))

a1_mth_sp<-na.omit(c(a1$sp_int,  a1$sp_medhist,	a1$sp_gimedhist,	a1$sp_fammedhist,	a1$sp_hlthbeh,	a1$sp_psychinfo,	a1$sp_physexam,	
          a1$sp_sympt,	a1$sp_oript,	a1$sp_fin,	a1$sp_possdiag,	a1$sp_ref,	a1$sp_tests,	a1$sp_med,	a1$sp_othertx,	
          a1$sp_emot,	a1$sp_social,	a1$sp_closing,	a1$sp_unint,	a1$sp_bckch))

r1_mth_pcp<-na.omit(c(r1$pcp_int,  r1$pcp_medhist,  r1$pcp_gimedhist,	r1$pcp_fammedhist,	r1$pcp_hlthbeh,	r1$pcp_psychinfo,	r1$pcp_physexam,	
               r1$pcp_sympt,	r1$pcp_oript,	r1$pcp_fin,	r1$pcp_possdiag,	r1$pcp_ref,	r1$pcp_tests,	r1$pcp_med,	r1$pcp_othertx,
               r1$pcp_emot,	r1$pcp_social,	r1$pcp_closing,	r1$pcp_unint,	r1$pcp_bckch))

r1_mth_sp<-na.omit(c(r1$sp_int,  r1$sp_medhist,	r1$sp_gimedhist,	r1$sp_fammedhist,	r1$sp_hlthbeh,	r1$sp_psychinfo,	r1$sp_physexam,	
          r1$sp_sympt,	r1$sp_oript,	r1$sp_fin,	r1$sp_possdiag,	r1$sp_ref,	r1$sp_tests,	r1$sp_med,	r1$sp_othertx,	
          r1$sp_emot,	r1$sp_social,	r1$sp_closing,	r1$sp_unint,	r1$sp_bckch))


a1_mth_pcp1<-sum(ifelse(a1_mth_pcp > 0, 1,0))       #Frequebcy Count: A1, PCP Major Topic Headings
a1_mth_sp1<-sum(ifelse(a1_mth_sp > 0, 1,0))         #Frequency Count: A1, SP Major Topic Headings

r1_mth_pcp1<-sum(ifelse(r1_mth_pcp > 0, 1,0))       #Frequebcy Count: R1, PCP Major Topic Headings
r1_mth_sp1<-sum(ifelse(r1_mth_sp > 0, 1,0))         #Frequebcy Count: R1, SP Major Topic Headings




#COMMUNICATION TYPES

#Subsets a1/r1 by variable range
a1com<-subset(a1, select = pcp_arg:sp_interruption5)        #Subsets CommType Variables for A1 
r1com<-subset(r1, select = pcp_arg:sp_interruption5)        #Subsets CommType variables for R1


#Ordering the subsets alphabetically
a1comtype<-a1com[ ,order(names(a1com))]           #Alphabetizes the A1 CommType Variables
r1comtype<-r1com[ ,order(names(r1com))]           #Alphabetizes the R1 CommType Variables

#Breaks out the SP/PCP groupings
a1_comtype_pcp <- subset (a1comtype, select = pcp_altru:pcp_threat)
a1_comtype_sp <- subset (a1comtype, select = sp_altru:sp_threat)
r1_comtype_pcp <- subset (r1comtype, select = pcp_altru:pcp_threat)
r1_comtype_sp <- subset (r1comtype, select = sp_altru:sp_threat)

#subset(a1, select = pcp_ia:sp_q)



#Removing the N/A's before frequency count

a1_comtype_pcp1 <- na.omit(c(a1$pcp_altru ,a1$pcp_ambi ,a1$pcp_apology ,a1$pcp_approval ,a1$pcp_arg ,
                             a1$pcp_concern ,a1$pcp_disapp ,a1$pcp_disparag ,a1$pcp_empha ,a1$pcp_esteem,
                             a1$pcp_foot ,a1$pcp_guilt ,a1$pcp_indiff ,a1$pcp_interruption3 ,a1$pcp_interruption4, 
                              a1$pcp_interruption5 ,a1$pcp_irrel ,a1$pcp_jarg ,a1$pcp_laughneg ,
                             a1$pcp_laughpos ,a1$pcp_legit, a1$pcp_offer ,a1$pcp_reassur ,a1$pcp_refut ,
                             a1$pcp_repeat ,a1$pcp_tangent ,a1$pcp_threat))


a1_comtype_sp1<-na.omit(c(a1$sp_altru ,a1$sp_ambi ,a1$sp_apology ,a1$sp_approval ,a1$sp_arg ,a1$sp_concern ,a1$sp_disapp, 
                          a1$sp_disparag ,a1$sp_empha ,a1$sp_esteem ,a1$sp_foot,a1$sp_guilt ,a1$sp_indiff ,a1$sp_interruption3,
                          a1$sp_interruption4 ,a1$sp_interruption5 ,a1$sp_irrel ,a1$sp_jarg ,a1$sp_laughneg,a1$sp_laughpos,
                          a1$sp_legit ,a1$sp_offer ,a1$sp_reassur ,a1$sp_refut ,a1$sp_repeat ,a1$sp_tangent ,a1$sp_threat))          


r1_comtype_pcp1 <- na.omit(c(r1$pcp_altru ,r1$pcp_ambi ,r1$pcp_apology ,r1$pcp_approval ,r1$pcp_arg ,  											
                             r1$pcp_concern ,r1$pcp_disapp ,r1$pcp_disparag ,r1$pcp_empha ,r1$pcp_esteem,												
                             r1$pcp_foot ,r1$pcp_guilt ,r1$pcp_indiff ,r1$pcp_interruption3 ,r1$pcp_interruption4, 												
                             r1$pcp_interruption5 ,r1$pcp_irrel ,r1$pcp_jarg ,r1$pcp_laughneg ,												
                             r1$pcp_laughpos ,r1$pcp_legit, r1$pcp_offer ,r1$pcp_reassur ,r1$pcp_refut ,												
                             r1$pcp_repeat ,r1$pcp_tangent ,r1$pcp_threat))												


r1_comtype_sp1<-na.omit(c(r1$sp_altru ,r1$sp_ambi ,r1$sp_apology ,r1$sp_approval ,r1$sp_arg ,r1$sp_concern ,r1$sp_disapp, 												
                          r1$sp_disparag ,r1$sp_empha ,r1$sp_esteem ,r1$sp_foot,r1$sp_guilt ,r1$sp_indiff ,r1$sp_interruption3,												
                          r1$sp_interruption4 ,r1$sp_interruption5 ,r1$sp_irrel ,r1$sp_jarg ,r1$sp_laughneg,r1$sp_laughpos,												
                          r1$sp_legit ,r1$sp_offer ,r1$sp_reassur ,r1$sp_refut ,r1$sp_repeat ,r1$sp_tangent ,r1$sp_threat))          												


#Frequency count by logic statement
#a1_mth_pcp1<-sum(ifelse(a1_mth_pcp > 0, 1,0))

a1_comtype_pcp2 <-sum(ifelse(a1_comtype_pcp1 > 0, 1,0))
a1_comtype_sp2 <-sum(ifelse (a1_comtype_sp1 > 0, 1,0))

r1_comtype_pcp2 <-sum(ifelse (r1_comtype_pcp1 > 0, 1,0))
r1_comtype_sp2 <-sum(ifelse (r1_comtype_sp1 > 0, 1,0))



#HEALTHCARE DECISIONS

#Subsets a1/r1 by variable range
a1hcd<-subset(a1, select = pcp_crc:sp_other_4)        #Subsets Healthcare Decisions Variables for A1 
r1hcd<-subset(r1, select = pcp_crc:sp_other_4)        #Subsets Healthcare Decisions variables for R1


#Ordering the subsets alphabetically
a1hcd1 <-a1hcd[ ,order(names(a1hcd))]           #Alphabetizes the A1 Healthcare Decisions Variables
r1hcd1 <-r1hcd[ ,order(names(r1hcd))]           #Alphabetizes the R1 Healthcare Decisions Variables

#Breaks out the SP/PCP groupings
a1_hcd_pcp <- subset (a1hcd1, select = pcp_acuteconst:pcp_xray)
a1_hcd_sp <- subset (a1hcd1, select = sp_acuteconst:sp_xray)
r1_hcd_pcp <- subset (r1hcd1, select = pcp_acuteconst:pcp_xray)
r1_hcd_sp <- subset (r1hcd1, select = sp_acuteconst:sp_xray)

#Removing the N/A's before frequency count
a1_hcd_pcp1 <- na.omit(c(a1$pcp_acuteconst, a1$pcp_anemia, a1$pcp_append, a1$pcp_blood, a1$pcp_canoth, 
                         a1$pcp_celiac, a1$pcp_chroconst, a1$pcp_chrons, a1$pcp_colitis,a1$pcp_colon, 
                         a1$pcp_colonoscopy, a1$pcp_crc, a1$pcp_ct, a1$pcp_diet, a1$pcp_divert, 
                         a1$pcp_duo, a1$pcp_ekg, a1$pcp_endoscopy, a1$pcp_enema,a1$pcp_flu, 
                         a1$pcp_fobt, a1$pcp_gall, a1$pcp_gyn, a1$pcp_hem, a1$pcp_hemocccult, 
                         a1$pcp_ibs, a1$pcp_intblo, a1$pcp_kidney, a1$pcp_liver, a1$pcp_meds,
                         a1$pcp_mixgi, a1$pcp_mri, a1$pcp_other_3, a1$pcp_other_4, a1$pcp_pancreas, 
                         a1$pcp_polyps, a1$pcp_prost, a1$pcp_sigmoid, a1$pcp_sleep,
                         a1$pcp_spleen, a1$pcp_stomach, a1$pcp_stool, a1$pcp_stress, a1$pcp_thyroid, 
                         a1$pcp_ulcer, a1$pcp_ultra, a1$pcp_unscript, a1$pcp_unspcan,
                         a1$pcp_unspdis, a1$pcp_uri, a1$pcp_urine, a1$pcp_virtcolon, a1$pcp_xray
                      ))


a1_hcd_sp1 <- na.omit(c(a1$sp_acuteconst, a1$sp_anemia ,a1$sp_append ,a1$sp_blood ,a1$sp_canoth 
                        ,a1$sp_celiac ,a1$sp_chroconst ,a1$sp_chrons ,a1$sp_colitis ,a1$sp_colon
                        ,a1$sp_colonoscopy ,a1$sp_crc ,a1$sp_ct ,a1$sp_diet ,a1$sp_divert,a1$ sp_duo 
                        ,a1$sp_ekg ,a1$sp_endoscopy ,a1$sp_enema ,a1$sp_flu ,a1$sp_fobt ,a1$sp_gall
                        ,a1$sp_gyn ,a1$sp_hem ,a1$sp_hemoccult ,a1$sp_ibs ,a1$sp_intblo ,a1$sp_kidney 
                        ,a1$sp_liver ,a1$sp_meds ,a1$sp_mixgi ,a1$sp_mri ,a1$sp_other_3
                        ,a1$sp_other_4 ,a1$sp_pancreas ,a1$sp_polyps ,a1$sp_prost ,a1$sp_sigmoid 
                        ,a1$sp_sleep ,a1$sp_spleen ,a1$sp_stomach ,a1$sp_stool ,a1$sp_stress
                        ,a1$sp_thyroid ,a1$sp_ulcer ,a1$sp_ultra ,a1$sp_unscript ,a1$sp_unspcan 
                        ,a1$sp_unspdis ,a1$sp_uri ,a1$sp_urine ,a1$sp_virtcolon ,a1$sp_xray))


r1_hcd_pcp1 <- na.omit(c(r1$pcp_acuteconst, r1$pcp_anemia, r1$pcp_append, r1$pcp_blood, r1$pcp_canoth, 
                         r1$pcp_celiac, r1$pcp_chroconst,r1$pcp_chrons, r1$pcp_colitis,r1$pcp_colon, 
                         r1$pcp_colonoscopy, r1$pcp_crc, r1$pcp_ct, r1$pcp_diet, r1$pcp_divert, 
                         r1$pcp_duo, r1$pcp_ekg, r1$pcp_endoscopy, r1$pcp_enema, r1$pcp_flu, 
                         r1$pcp_fobt, r1$pcp_gall, r1$pcp_gyn, r1$pcp_hem, r1$pcp_hemocccult, 
                         r1$pcp_ibs, r1$pcp_intblo, r1$pcp_kidney, r1$pcp_liver, r1$pcp_meds,
                         r1$pcp_mixgi, r1$pcp_mri, r1$pcp_other_3, r1$pcp_other_4, r1$pcp_pancreas, 
                         r1$pcp_polyps, r1$pcp_prost, r1$pcp_sigmoid, r1$pcp_sleep,
                         r1$pcp_spleen, r1$pcp_stomach, r1$pcp_stool, r1$pcp_stress, r1$pcp_thyroid, 
                         r1$pcp_ulcer, r1$pcp_ultra, r1$pcp_unscript, r1$pcp_unspcan,
                         r1$pcp_unspdis, r1$pcp_uri, r1$pcp_urine, r1$pcp_virtcolon, r1$pcp_xray
                        ))


r1_hcd_sp1 <- na.omit(c(r1$sp_acuteconst, r1$sp_anemia ,r1$sp_append ,r1$sp_blood ,r1$sp_canoth 
                        ,r1$sp_celiac ,r1$sp_chroconst ,r1$sp_chrons ,r1$sp_colitis ,r1$sp_colon
                        ,r1$sp_colonoscopy ,r1$sp_crc ,r1$sp_ct ,r1$sp_diet ,r1$sp_divert,r1$ sp_duo 
                        ,r1$sp_ekg ,r1$sp_endoscopy ,r1$sp_enema ,r1$sp_flu ,r1$sp_fobt ,r1$sp_gall
                        ,r1$sp_gyn ,r1$sp_hem ,r1$sp_hemoccult ,r1$sp_ibs ,r1$sp_intblo ,r1$sp_kidney 
                        ,r1$sp_liver ,r1$sp_meds ,r1$sp_mixgi ,r1$sp_mri ,r1$sp_other_3
                        ,r1$sp_other_4 ,r1$sp_pancreas ,r1$sp_polyps ,r1$sp_prost ,r1$sp_sigmoid 
                        ,r1$sp_sleep ,r1$sp_spleen ,r1$sp_stomach ,r1$sp_stool ,r1$sp_stress
                        ,r1$sp_thyroid ,r1$sp_ulcer ,r1$sp_ultra ,r1$sp_unscript ,r1$sp_unspcan 
                        ,r1$sp_unspdis ,r1$sp_uri ,r1$sp_urine ,r1$sp_virtcolon ,r1$sp_xray))




#Frequency count by logic statement
#a1_mth_pcp1<-sum(ifelse(a1_mth_pcp > 0, 1,0))

a1_hcd_pcp2 <-sum(ifelse(a1_hcd_pcp1 > 0, 1,0))
a1_hcd_sp2 <-sum(ifelse (a1_hcd_sp1 > 0, 1,0))

r1_hcd_pcp2 <-sum(ifelse (r1_hcd_pcp1 > 0, 1,0))
r1_hcd_sp2 <-sum(ifelse (r1_hcd_sp1 > 0, 1,0))
                             



#This is the Ques/Stat output in order for redcap
ResultsForREDCap<-cbind(a1$pcp_ia, r1$pcp_ia, a1$sp_ia, r1$sp_ia,     #A1 PCP Statement, R1 PCP Statement, A1 SP Statement, R1 SP Statements 
      a1$pcp_q, r1$pcp_q, a1$sp_q, r1$sp_q,         #A1 PCP Questions, R1 PCP Questions, A1 SP Questions, R1 SP Questions 
      a1_mth_pcp1,r1_mth_pcp1,                      #A1 PCP Major Topic Headings, R1 PCP Major Topic Headings 
      a1_mth_sp1,r1_mth_sp1,                        #A1 SP Major Topic Headings, R1 SP Major Topic Headings
      a1_comtype_pcp2,r1_comtype_pcp2,              #A1 PCP Comm Types, R1 PCP Comm Types
      a1_comtype_sp2,r1_comtype_sp2,                 #A1 SP Comm Types, R1 SP Comm Types
      a1_hcd_pcp2,r1_hcd_pcp2,                      #A1 PCP HCD, R1 PCP HCD
      a1_hcd_sp2,r1_hcd_sp2                        #A1 SP HCD. R1 SP HCD
      )



#This step will format the results so that they can be pasted into a CSV for REDCap.

write.csv(ResultsForREDCap, row.names = FALSE)

#A few notes on the function:
#row.names = FALSE prevents the vector (row number) from being listed in the output
#Adding the parameter, file = "data.csv", will output a .csv file to be saved in the working directory

#For REDCap paste in, paste the first half, then paste the second half after these variables
#total_speech_disc_pcp  total_speech_disc_sp  total_affect_disc_pcp	total_affect_disc_sp

#For now, I think it's easier to just paste in with commas and ask excel to split it



