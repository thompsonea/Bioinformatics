file_name <- readline()
MachineRead_output <- read_csv(file_name) #Import data from dataframe
MachineRead_output$Paper.ID <-gsub("\\[","", MachineRead_output$`Paper.ID`) #substitute out special characters and get rid of junk
MachineRead_output$Paper.ID <-gsub("\\`","", MachineRead_output$`Paper.ID`)
MachineRead_output$Paper.ID <-gsub("\\]","", MachineRead_output$`Paper.ID`)
MachineRead_output$Paper.ID <-gsub(" ", "", MachineRead_output$`Paper.ID`)

paperIDs <- c() #name vector that's empty to be filled later

for (each in MachineRead_output$Paper.ID) { #for each in the dataframe under column
  
  paperIDs<- unlist(strsplit(each, ",")) #unlist and split the string from each comma under new vector
  
  rownumber <- which(each == MachineRead_output$Paper.ID) #define vector as call back to what meets the condition
  
  
  MachineRead_output$uniqueNumID[rownumber] <- length(unique(paperIDs)) #index rownumber and count unique IDs
  
}

rowsToRemove <- which(MachineRead_output$uniqueNumID == 1) #create new vector with uniqueIDs that appear once

MachineRead_output <- MachineRead_output[-c(rowsToRemove),] #remove LEEs that occurred once from dataframe