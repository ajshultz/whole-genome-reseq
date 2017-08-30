#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

#4 required arguments are 1) species, 2) file of sites to exclude from previous coverage work 3) output dir for plots, 4) path to directory with quality stats ifo
sp <- args[1]
exclude_file <- args[2]
plot_dir <- args[3]
qual_dir <- args[4]
stat <- args[5]

print(stat)

library(tidyverse)
library(ggplot2)


exclude <- read_tsv(exclude_file,col_names = c("scaffold","pos_-1","pos"))

exclude <- exclude %>% unite(scaffold,pos,sep = "_",col = "scaff_pos") %>% select("scaff_pos")

#First look at quality by depth, or QD
if (stat == "QD"){

for (i in 1:10){
  if (i == 1){
    QD <- read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_QD.INFO",sep=""),col_names = TRUE,na = "?")    
  }
  else {
    QD <- QD %>% bind_rows(read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_QD.INFO",sep=""),col_names = TRUE,na = "?"))
  }
}

ggplot(data=QD) + geom_density(mapping=aes(x=QD)) + ggtitle(label=paste(sp,stat,"unfiltered",sep=" "),subtitle=paste(nrow(QD)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_unfiltered.pdf",sep=""),device="pdf")

#Filter non-biallelic sites and sites excluded by 1.5x depth of coverage

QD <- QD %>% filter(nchar(REF)==1 & nchar(ALT) == 1) %>% unite(CHROM,POS,sep="_",col="scaff_pos",remove=FALSE) %>% anti_join(exclude,by="scaff_pos") %>% arrange(CHROM,POS)

ggplot(data=QD) + geom_density(mapping=aes(x=QD)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(QD)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter.pdf",sep=""),device="pdf")

rm(QD)
}

########################################
#Next, "mapping quality" or MQ

if (stat == "MQ"){

for (i in 1:10){
  if (i == 1){
    MQ <- read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_MQ.INFO",sep=""),col_names = TRUE,na = "?")    
  }
  else {
    MQ <- MQ %>% bind_rows(read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_MQ.INFO",sep=""),col_names = TRUE,na = "?"))
  }
}

ggplot(data=MQ) + geom_density(mapping=aes(x=MQ)) + ggtitle(label=paste(sp,stat,"unfiltered",sep=" "),subtitle=paste(nrow(MQ)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_unfiltered.pdf"),device="pdf")

#Filter non-biallelic sites and sites excluded by 1.5x depth of coverage

MQ <- MQ %>% filter(nchar(REF)==1 & nchar(ALT) == 1) %>% unite(CHROM,POS,sep="_",col="scaff_pos",remove=FALSE) %>% anti_join(exclude,by="scaff_pos") %>% arrange(CHROM,POS)

ggplot(data=MQ) + geom_density(mapping=aes(x=MQ)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(MQ)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter.pdf",sep=""),device="pdf")

ggplot(data=MQ) + geom_density(mapping=aes(x=MQ)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(MQ)," sites",sep="")) + xlim(c(0,80))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter_constrained.pdf",sep=""),device="pdf")

rm(MQ)
}

########################################
#Next, "FisherStrand" or FS
if (stat == "FS"){

for (i in 1:10){
  if (i == 1){
    FS <- read_tsv(paste(qual_dir,"/",sp,"s_Int",i,"_FS.INFO",sep=""),col_names = TRUE,na = "?")    
  }
  else {
    FS <- FS %>% bind_rows(read_tsv(paste(qual_dir,"/",sp,"s_Int",i,"_FS.INFO",sep=""),col_names = TRUE,na = "?"))
  }
}

ggplot(data=FS) + geom_density(mapping=aes(x=FS)) + ggtitle(label=paste(sp,stat,"unfiltered",sep=" "),subtitle=paste(nrow(FS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_unfiltered.pdf"),device="pdf")

#Filter non-biallelic sites and sites excluded by 1.5x depth of coverage

FS <- FS %>% filter(nchar(REF)==1 & nchar(ALT) == 1) %>% unite(CHROM,POS,sep="_",col="scaff_pos",remove=FALSE) %>% anti_join(exclude,by="scaff_pos") %>% arrange(CHROM,POS)

ggplot(data=FS) + geom_density(mapping=aes(x=FS)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(FS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter.pdf"),device="pdf")

FS <- FS %>% filter(FS != 0)

ggplot(data=FS) + geom_density(mapping=aes(x=FS)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(FS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter_no0s.pdf"),device="pdf")

rm(FS)
}

########################################
#Next, "Strand Odds Ratio" or SOR
if (stat == "SOR"){

for (i in 1:10){
  if (i == 1){
    SOR <- read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_SOR.INFO",sep=""),col_names = TRUE,na = "?")    
  }
  else {
    SOR <- SOR %>% bind_rows(read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_SOR.INFO",sep=""),col_names = TRUE,na = "?"))
  }
}

ggplot(data=SOR) + geom_density(mapping=aes(x=SOR)) + ggtitle(label=paste(sp,stat,"unfiltered",sep=" "),subtitle=paste(nrow(SOR)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_unfiltered.pdf"),device="pdf")

#Filter non-biallelic sites and sites excluded by 1.5x depth of coverage

SOR <- SOR %>% filter(nchar(REF)==1 & nchar(ALT) == 1) %>% unite(CHROM,POS,sep="_",col="scaff_pos",remove=FALSE) %>% anti_join(exclude,by="scaff_pos") %>% arrange(CHROM,POS)

ggplot(data=SOR) + geom_density(mapping=aes(x=SOR)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(SOR)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter.pdf",sep=""),device="pdf")

rm(SOR)
}

########################################
#Next, "mapping quality rank sum" or MQRS
if (stat == "MQRS"){

for (i in 1:10){
  if (i == 1){
    MQRS <- read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_MQRS.INFO",sep=""),col_names = TRUE,na = "?")    
  }
  else {
    MQRS <- MQRS %>% bind_rows(read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_MQRS.INFO",sep=""),col_names = TRUE,na = "?"))
  }
}

ggplot(data=MQRS) + geom_density(mapping=aes(x=MQRankSum)) + ggtitle(label=paste(sp,stat,"unfiltered",sep=" "),subtitle=paste(nrow(MQRS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_unfiltered.pdf"),device="pdf")

#Filter non-biallelic sites and sites excluded by 1.5x depth of coverage

MQRS <- MQRS %>% filter(nchar(REF)==1 & nchar(ALT) == 1) %>% unite(CHROM,POS,sep="_",col="scaff_pos",remove=FALSE) %>% anti_join(exclude,by="scaff_pos") %>% arrange(CHROM,POS)

ggplot(data=MQRS) + geom_density(mapping=aes(x=MQRankSum)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(MQRS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter.pdf",sep=""),device="pdf")

rm(MQRS)
}

########################################
#Next, "read pos rank sum" or RPRS
if (stat == "RPRS"){

for (i in 1:10){
  if (i == 1){
    RPRS <- read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_RPRS.INFO",sep=""),col_names = TRUE,na = "?")    
  }
  else {
    RPRS <- RPRS %>% bind_rows(read_tsv(paste(qual_dir,"/",sp,"_Int",i,"_RPRS.INFO",sep=""),col_names = TRUE,na = "?"))
  }
}

ggplot(data=RPRS) + geom_density(mapping=aes(x=ReadPosRankSum)) + ggtitle(label=paste(sp,stat,"unfiltered",sep=" "),subtitle=paste(nrow(RPRS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_unfiltered.pdf"),device="pdf")

#Filter non-biallelic sites and sites excluded by 1.5x depth of coverage

RPRS <- RPRS %>% filter(nchar(REF)==1 & nchar(ALT) == 1) %>% unite(CHROM,POS,sep="_",col="scaff_pos",remove=FALSE) %>% anti_join(exclude,by="scaff_pos") %>% arrange(CHROM,POS)

ggplot(data=RPRS) + geom_density(mapping=aes(x=ReadPosRankSum)) + ggtitle(label=paste(sp,stat,"SNPS 1.5x coverage filter",sep=" "),subtitle=paste(nrow(RPRS)," sites",sep=""))
ggsave(filename=paste(plot_dir,"/",sp,"_",stat,"_snps_covfilter.pdf",sep=""),device="pdf")

rm(RPRS)
}



