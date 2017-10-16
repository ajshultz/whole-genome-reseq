library(tidyverse)

setwd("~/Git_Repos/whole-genome-reseq")
bamlists <- list.files("BamLists_NoRel/")
newdir <- "IndLists_NoRel"


for (file in bamlists){
  print(file)
  if (sum(grep("BamList",file) > 0)) {
  old <- read_table(paste("BamLists/",file,sep=""),col_names = c("path"))
  new <- old %>% separate(path,sep = "/",remove = FALSE,into = c("blank","n","holy","labs","lab","user","hfwgreseq","indel","merged","filename")) %>% select(filename,path) %>% separate(filename,sep="_realigned",into=c("ind","type")) %>% select(ind,path) %>% select(ind)
   newfile <- gsub(file,pattern = "_BamList.txt", replacement = "_IndList.txt")
  

  write_tsv(new,path=paste(newdir,newfile,sep="/"),col_names = FALSE)
  }
  }
