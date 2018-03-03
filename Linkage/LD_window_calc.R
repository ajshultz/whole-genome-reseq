library(tidyverse)

#setwd("~/Dropbox/HFWGReseq/LD")

#Will need to be arg.
args <- commandArgs(TRUE)
pop <- args[1]

#read in first scaffold (scaffold 0, to initialize output file)
ld <- read_delim(paste0(pop,"_scaffold_0_10kbMax.linkage"),delim="\t",skip=6,col_names=c("CHR_x","POS_x","CHR_y","POS_y","DIST","BEST_D","BEST_Dprime","BEST_D2","BEST_R2","ADJ_BEST_D","ADJ_BEST_Dprime","ADJ_BEST_D2","ADJ_BEST_R2","Ni","LOGLIKE"))

ld %>%
  head(n=-1) %>%
  mutate(POS_x = as.integer(POS_x/1000)) %>%
  filter(!is.na(BEST_R2)) %>%
  group_by(CHR_x,POS_x) %>%
  summarize(BEST_R2 =round(mean(BEST_R2),digits=3), ADJ_BEST_R2 = round(mean(ADJ_BEST_R2),digits=3), Ni = round(mean(Ni),digits=2)) %>%
  mutate(WinStart = as.integer(POS_x*1000), WinStop = as.integer(POS_x*1000+999)) %>%
  select(CHR = CHR_x, WinStart, WinStop, BEST_R2, ADJ_BEST_R2, Ni) %>%
  write_delim(paste0("_",pop,"_LD_calc_1kbwins.linkage"),delim = "\t",col_names = T)

#read through remaining files, append to scaffold 0 file
for (i in 1:7026){
  ld <- read_delim(paste0(pop,"_scaffold_",i,"_10kbMax.linkage"),delim="\t",skip=6,col_names=c("CHR_x","POS_x","CHR_y","POS_y","DIST","BEST_D","BEST_Dprime","BEST_D2","BEST_R2","ADJ_BEST_D","ADJ_BEST_Dprime","ADJ_BEST_D2","ADJ_BEST_R2","Ni","LOGLIKE"))
  
  if (nrow(ld) > 0){
  ld %>%
    head(n=-1) %>%
    mutate(POS_x = as.integer(POS_x/1000)) %>%
    filter(!is.na(BEST_R2)) %>%
    group_by(CHR_x,POS_x) %>%
    summarize(BEST_R2 =round(mean(BEST_R2),digits=3), ADJ_BEST_R2 = round(mean(ADJ_BEST_R2),digits=3), Ni = round(mean(Ni),digits=2)) %>%
    mutate(WinStart = as.integer(POS_x*1000), WinStop = as.integer(POS_x*1000+999)) %>%
    select(CHR = CHR_x, WinStart, WinStop, BEST_R2, ADJ_BEST_R2, Ni) %>%    
    write_delim(paste0("_",pop,"_LD_calc_1kbwins.linkage"),delim = "\t",col_names = F,append=T)
  }
  
}