file_name <- readline()
MachineRead_output <- read_csv(file_name)
MachineRead_output$Paper.ID <-gsub("\\[","", MachineRead_output$`Paper.ID`)
MachineRead_output$Paper.ID <-gsub("\\`","", MachineRead_output$`Paper.ID`)
MachineRead_output$Paper.ID <-gsub("\\]","", MachineRead_output$`Paper.ID`)
MachineRead_output$Paper.ID <-gsub(" ", "", MachineRead_output$`Paper.ID`)

paperIDs <- c()

for (each in MachineRead_output$Paper.ID) {
  
  paperIDs<- unlist(strsplit(each, ","))
  
  rownumber <- which(each == MachineRead_output$Paper.ID)
  
  MachineRead_output$uniqueNumID[rownumber] <- length(unique(paperIDs))
  
}

rowsToRemove <- which(MachineRead_output$uniqueNumID == 1)

MachineRead_output <- MachineRead_output[-c(rowsToRemove),]