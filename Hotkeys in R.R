#Attempt completion   		                Tab or Ctrl+Space
#Cut 					                            Ctrl+X
#Delete word				                      Ctrl+Backspace or Ctrl+Delete
#Extract function from selection 		      Ctrl+Shift+U
#Find in Console				                  Ctrl+F 
#Find in Popup				                    Ctrl+Shift+F
#Go to Line				                        Ctrl+G
#Jump to Start/End				                Ctrl+Home/End or Ctrl+Up/Down
#Jump to Word			 	                      Ctrl+Left/Right
#New Script tab				                    Ctrl+Shift+N
#Select				 	                          Shift+[Arrow]
#Select to Line End 				              Shift+End
#Select to Line Start 			              Shift+Home 
#Select to Page End		 	                  Ctrl+Shift+End
#Select to Page Start		 	                Ctrl+Shift+Home 
#Select Word 				                      Ctrl+Shift+Left/Right
#View Function Source			                F2

#Update Packages
update.packages(ask = FALSE)

#When ?item doesn't work, this is the extensive search
help.search()

#Count columns/rows
ncol(crc.survey)
nrow()




#Excel Add On

install.packages("RExcelInstaller")
library(RExcelInstaller)

installRExcel(ForegroundServer = TRUE)

install.packages(rcom)
library(rcom)
comRegisterRegistry()


