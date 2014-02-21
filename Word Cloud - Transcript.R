require(RColorBrewer)


display.brewer.all()

pal <- brewer.pal(4, "Greys")

#nf <- layout(matrix(1:4), widths=c(1,2,1,2), heights=c(1,1,1,1), respect=F)

#layout.show(nf)

par(mfrow=c(1,1), oma = c(1, 3, 3, 1),  family="serif") 

wordcloud(codes, scale = c(6, .5), rot.per = 0.4,
          random.order = F, colors = c("gold", "black", "skyblue4"), random.color=T)

wordcloud(codes, scale = c(6, .5), rot.per = 0.4,
          random.order = F, colors = pal, random.color=T)

wordcloud(codes, scale = c(6, .5), rot.per = 0.4,
          random.order = F, colors = pal, random.color=T)

wordcloud(codes, scale = c(6, .5), rot.per = 0.4,
          random.order = F, colors = pal, random.color=T)



codes<-"INTRODUCTION 
     Name
	General greeting
	New patient
	Can I help you
	Reason for visit
	

MEDICAL HISTORY 
	Doctors  (non-PCP)
	Who prescribed 
	Last time blood work was done
	Previous PCP
	Prescription , not GI
	OTC , not GI
	Specific medical conditions/ailments  
	Pain problems:  (not stomach)
	Surgeries
	Past hospitalizations
	Cancer screenings, not GI
	Screenings: not cancer, not GI
	Pregnancies
	GYN issues
	General: nonspecific
	

GI MEDICAL HISTORY 
	IBS:  discusses pt [patient] experiences and hx [history]
	When diagnosed with IBS
	Treatments/s for IBS
	Colonoscopy screening
	Screenings: GI ()
	Past  GI symptoms & illnesses
	General GI habits
	Current  GI problems
	 for  GI problems
	

FAMILY MEDICAL HISTORY
	General family history
	Cancer family history
	GI problems family history
	


HEALTH BEHAVIORS
	Sleep
	Tobacco use
	Alcohol use
	Caffeine intake
	Drug use
	Diet
	Exercise
	

PSYCHOSOCIAL INFORMATION
	Age
	Education
	Stress
	Recent move (all aspects)
	Living arrangements
	Environmental Conditions 
	Occupation/work related issues
	Marital status
	Children
	Sexual activity
	Significant s
	Quality of family/friend relationships
	Mental health
	Recent travel
	

PHYSICAL EXAM
	Gives patient instructions for exam
	Checks vitals
	Examines non-GI systems
	Palpates stomach
	Rectal exam
	Hernia exam
	Prostate exam
	Pelvic exam
	Breast exam 
	Discusses whether to have exam
	Explains or justifies reason for exam
	Asks permission for exam
	Physical observations 
	GI Exam: 
	

SYMPTOMS
	Duration of symptoms
	Periodicity of pain
	Symptom periodicity:  (non-pain)
	Description of pain
	Pain rating
	Location of pain
	What makes symptoms worse/better
	Fatigue 
	Constipation/Diarrhea
	Stool changes (physical)
	Changes in bowel habits (all but C/D)
	How eating affects symptoms
	Certain foods' effect on symptoms
	Symptoms after bowel movement
	Appetite symptoms
	Diet changes made by patient
	Weight loss or gain
	Effect of symptoms on daily routine
	IBS problems
	Nausea or vomiting
	Fever and/or chills
	Blood in stool/rectal bleeding 
	Heartburn
	Bloating
	Urination changes/problems
	GYN issues
	Online educational materials
	Effect of life changes on symptoms
	Symptoms are changing/different
	Mucous in stool
	

ORIENTS PATIENT
	Discusses practice logistics
	Medical charts/records
	Billing
	Logistics of today's visit
	Educates patient
	Refers to computer
	Online educational materials
	

FINANCIAL
	Does patient have health insurance
	When health insurance starts
	Health insurance: general
	Wait for insurance to do tests
	 costs
	Tests costs
	General financial issues
	

POSSIBLE DIAGNOSES
	Possible cause of sx
	Cancer rule out
	General rule out
	Physician states does not know
	Online educational materials
	Self-diagnoses
	

REFERRALS
	GI specialist
	OB/GYN
	Specialist 
	PCP 
	Clinic or hospital
	

TESTS OFFERED
	Test offered
	Preparation for tests 
	Rationale for tests
	Sequential diagnostic process discussion
	Offers test options 
	Online educational materials
	Discusses whether to do tests today
	


	GI prescription 
	Non-GI prescription 
	OTC GI offered
	 OTC offered
	Offers  sample
	Description of  side effects
	Rationale for 
	Directions for taking 
	How  works
	Online educational materials
	

 TREATMENTS
	Change diet
	Increase exercise
	Regulate or increase sleep
	Decrease stress
	Rationale for  treatments
	Online educational materials
	Probiotics
	

EMOTIONS
	Annoyed/frustrated about symptoms
	Concerned/worried about symptoms
	General anxiety during visit
	Depression
	Crying
	

SOCIAL CHITCHAT
	Weather
	Info about region
	Common interests
	Current events
	Sports
	Discusses previous city (Detroit/Pittsburgh)
	Social niceties 
	

FOLLOW UP & CLOSING
	Schedule follow-up visit
	Call in a few days/weeks
	No need to follow up if improves
	Logistics for testing 
	Will wait for test results for decisions
	Evaluate  trial for decisions
	Directions for acquiring 
	When to return
	Keep in touch
	If symptoms worsen, what to do
	What to do in an emergency
	Any problems, call
	How patient will be informed of results
	Things to watch for/signs more serious
	General goodbye 
	Thank you
	Problems? Needs?
	

UNINTELLIGIBLE
	Unintelligible
	Nonverbal Response

BACK  CHANNELS/FILLERS
	Transition 
	Approving
	Emphasis
	Noted
"





