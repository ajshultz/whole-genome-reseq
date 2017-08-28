library(tidyverse)

setwd("~/whole-genome-reseq")
bamlists <- list.files("BamLists/")
newdir <- "BamLists_NoRel"

rels <- c("CA_01_08","CA_14_11","CA_14_05","MA_14_15","MA_14_16","ME_01_11","ME_01_12","ME_90_12","NY_01_07","NY_01_08","NY_90_04","OH_90_02","WA_14_05","WA_14_09")

for (file in bamlists){
  print(file)
  if (sum(grep("BamList",file) > 0)) {
  old <- read_table(paste("BamLists/",file,sep=""),col_names = c("path"))
  new <- old %>% separate(path,sep = "/",remove = FALSE,into = c("blank","n","holy","labs","lab","user","hfwgreseq","indel","merged","filename")) %>% select(filename,path) %>% separate(filename,sep="_realigned",into=c("ind","type")) %>% select(ind,path) %>% filter(!(ind %in% rels)) %>% select(path)

  write_tsv(new,path=paste(newdir,file,sep="/"),col_names = FALSE)
  }
  }
