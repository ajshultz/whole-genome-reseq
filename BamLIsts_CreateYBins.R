library(tidyverse)

setwd("~/whole-genome-reseq")
bamlists <- list.files("BamLists_NoRel/")

poplists <- read_csv("~/Dropbox/HFWGReseq/HFCCCPOut_PopMap.csv")

score_pop = function(cases,controls,test_cases){
  test_cases[test_cases == cases] <- 1
  test_cases[test_cases == controls] <- 0
  return(test_cases)
}

status_replace = function(cases,controls,file){
    pop = file %>%
    gsub(replacement = "",pattern="_BamList.txt")
  
  status = read_table(paste0("BamLists_NoRel/",file,sep=""),col_names = c("path")) %>%
    separate(path,sep = "/",remove = FALSE,into = c("blank","n","holy","labs","lab","user","hfwgreseq","indel","merged","filename")) %>%
    select(filename,path) %>%
    separate(filename,sep="_realigned",into=c("sample","type")) %>%
    select(sample) %>%
    left_join(poplists) %>%
    select(broad_pop_time) %>%
    mutate(score = score_pop(cases=cases,controls=controls,test_cases=broad_pop_time)) %>%
    select(score) %>%
    write_delim(path=paste0("BamLists_NoRel/",pop,"_yBin.txt"),col_names = FALSE)
}


for (file in bamlists){
  print(file)
  if (file == "Eastern_0114_BamList.txt"){
    controls = "east_01"
    cases = "east_14"
    status_replace(cases=cases,controls=controls,file=file)
  }
      
  if (file == "Eastern_9001_BamList.txt"){
    controls = "east_90"
    cases = "east_01"
    status_replace(cases=cases,controls=controls,file=file)    
  }
    
  if (file == "Eastern_9014_BamList.txt"){
    controls = "east_90"
    cases = "east_14"
    status_replace(cases=cases,controls=controls,file=file)          
  }
  
  if (file == "Western_0114_BamList.txt"){
    controls = "west_01"
    cases = "west_14"
    status_replace(cases=cases,controls=controls,file=file)        
  }
  
  if (file == "Eastern_90_Western_01_BamList.txt"){
    controls = "east_90"
    cases = "west_01"
    status_replace(cases=cases,controls=controls,file=file)        
  }
  
  if (file == "Eastern_14_Western_14_BamList.txt"){
    controls = "east_14"
    cases = "west_14"
    status_replace(cases=cases,controls=controls,file=file)        
  }
  
  }
  
