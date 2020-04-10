#setwd("~/Dropbox/HFWGReseq/PathwayAnalyses/")

library(tidyverse)
library(signet)
library(graphite)
data(daub13)

#First arg should be bedfile with max scores, second arg should be filename for output.
args <- commandArgs(TRUE)
input <- args[1]
name <- args[2]
savedir <- args[3]

hf_scores <- read_delim(input,delim = "\t",col_names = c("scaff","gene_id","start","end","chisq"))

#Transform into tibble with just zebra finch entrezgene ID and chisq score.
hf_scores <- hf_scores %>%
  dplyr::select(gene_id,chisq) 

#Load gallus gallus, zebra finch and human gene tables for entrezgene translation.
zf_gene <- read_delim("../ZF_GeneID_Table.txt",delim="\t")
#gg_gene <- read_delim("GG_GeneID_Table.txt",delim="\t")
hs_gene <- read_delim("../HS_GeneID_Table.txt",delim="\t")

# gg_gene <- gg_gene %>%
#   dplyr::select(GeneID,Symbol) %>%
#   mutate(entrezgene_gg = as.character(GeneID))  

hs_gene <- hs_gene %>%
  dplyr::select(GeneID,Symbol) %>%
  mutate(entrezgene_hs = as.character(GeneID))  

# zf_gg_combo <- zf_gene %>%
#   dplyr::select(GeneID,Symbol) %>%
#   mutate(entrezgene_zf = as.character(GeneID)) %>%
#   inner_join(gg_gene,by="Symbol")
  
zf_hs_combo <-  zf_gene %>%
  dplyr::select(GeneID,Symbol) %>%
  mutate(entrezgene_zf = as.character(GeneID)) %>%
  inner_join(hs_gene,by="Symbol")

# hf_scores_gg <- hf_scores %>%
#   inner_join(zf_gg_combo,by="entrezgene_zf") %>%
#   dplyr::select(entrezgene_gg,chisq) %>%
#   mutate(chisq = as.numeric(chisq)) %>%
#   filter(!is.na(chisq))

hf_scores_hs <- hf_scores %>%
  inner_join(zf_hs_combo,by="entrezgene_zf") %>%
  dplyr::select(entrezgene_hs,chisq) %>%
  mutate(chisq = as.numeric(chisq)) %>%
  filter(!is.na(chisq))

#hs_kegg_paths <- pathways("hsapiens","kegg")
#hs_kegg_paths <- lapply(hs_kegg_paths,function(x) pathwayGraph(x))

HSS <- searchSubnet(kegg_human,
                    hf_scores_hs,
                    iterations = 10000)

null <- nullDist(kegg_human,
                 hf_scores_hs,
                 n = 10000)

HSS_test <- testSubnet(HSS,null)
tab <- summary(HSS_test) %>%
  mutate(FDR_pval = p.adjust(p.value,method="BH")) %>%
  arrange(FDR_pval)

save(hf_scores_hs,HSS,null,HSS_test,tab,file=paste(savedir,"/signet_testing_",name,".Rdat",sep=""))
write.table(tab,file=paste(savedir,"/signet_testing_scores_",name,".tsv",sep=""),sep="\t",quote=FALSE,row.names=FALSE)

