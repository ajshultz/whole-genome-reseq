#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

samples <- args[1]
dir <- args[2]

load(paste(dir,"/",samples,".Asso1GL1.LRTPvals.Rdat",sep=""))

#load("~/Dropbox/HFWGReseq/LRT/Eastern_90_Western_01.Asso1GL1.10K_Sample.Rdat")
#load("~/Dropbox/HFWGReseq/LRT/Eastern_90_Western_01.Asso1GL1.Sig_FDR.Rdat")
#e9001res <- sampled_res
#e9001res <- rbind(e9001res,sig_fdr_e90w01)
#samples <- "eastern 1990 vs. western 2001"
#genomeinfo <- read.table("~/Dropbox/HFWGReseq/final.assembly.homo.fa.fai")

#Read in genome info
genomeinfo <- read.table("../genome/final.assembly.homo.fa.fai")
genomeinfo$Scaff <- apply(genomeinfo,1,function(x)as.numeric(unlist(strsplit(as.character(x[1]),"_"))[2]))
scafflen <- genomeinfo$V2
names(scafflen) <-genomeinfo$Scaff

maxfdrp <- min(e9001res$Pval.adj)
maxp <- min(e9001res$Pval)
bonferroni <- 0.05/nrow(e9001res)
fdr <- max(e9001res[e9001res$Pval.adj<0.05,"Pval"])

if (maxp == 0){
	maxp <- 0.00000000000000001
}

if (maxfdrp == 0){
	maxfdrp <- 0.00000000001
}


#Manhattan plot function
####Turning Manhattan Plot script into a function,chr=chromosome,bp=position along chromosome,cn=total chromosome number,value=value to plot,tite=title of plot,chrlengths=total lengths of chromosomes,plotnames=chromosome names for axis labels,ylab=y-axis label, t1=significance threshold, maxp= maximum value for threshold,logneg=to -log transform or not (good for p-values)

manhattan <- function(chr,bp,value,title="Manhattan",chrlengths=chrlengths,plotnames,ylab,t1,maxp,logneg=TRUE,line=TRUE,highlight=FALSE,special,xtxt=""){
#working parameters ********************************************

chrlengths <- chrlengths[names(chrlengths) %in% as.character(chr)]
cn=length(chrlengths)

#tmp=max(-log10(p));
#if(tmp > maxp) maxp = tmp+0.5;


title=title
fontsize=0.6 #0.5


#layout(matrix(1:2,nrow=2))
#par(mar=c(6,7,4,4))
par(mar=c(1,3,2,1)+0.1)
par(mgp=c(1.5,1,0))


  ### Chr ends
ends=chrlengths  #chr legnth
cum.ends=numeric(cn)
cum.ends[1]=ends[1]
for (i in 2:cn){
cum.ends[i]=cum.ends[i-1]+ends[i]
}
  ### Chr centers
cum.centers=numeric(cn)
cum.centers[1]=cum.ends[1]/2
for (i in 2:cn){
cum.centers[i]=cum.ends[i-1]+((cum.ends[i]-cum.ends[i-1])/2)}

  ### Cumulative bp
cum.bp=numeric(length(bp))
cum.bp[chr==1] = bp[chr==1]
for (i in 2:cn){
cum.bp[chr==i] = bp[chr==i] + cum.ends[i-1]}

  ### Colors to use for chromosomes
 # use=c("red","blue")
 #use=c("#1f78b460","#1f78b4")
 use=c("#a6cee3","#1f78b4")
 col=use[chr%%2+1]
 if (highlight==TRUE) col[special] = "#e31a1c"
  # chrcol=rep(c("darkblue","lightblue"),)

  # names(chrcol)=chrnumvec
  # col=chrcol[chr]

  ### Size for points
 size=numeric(length(cum.bp))
 size=size+0.5
  
  ### Plot
 xtxt=xtxt
  #if (title!="CD56+ NK cells")
    #xtxt=""

if (logneg==TRUE) value = -log10(value)

#plot(cum.bp, value,xlim=c(0,cum.ends[cn]),ylim=c(0,maxp),xaxs="i",xlab=xtxt,ylab=ylab,cex.lab=1.6*fontsize,cex=size,col=col,axes=F,frame.plot=T,pch=19,main=title,cex.main=2*fontsize)
plot(cum.bp, value,xlim=c(0,cum.ends[cn]),ylim=c(0,maxp),xaxs="i",xlab=xtxt,ylab=ylab,cex.lab=1.6*fontsize,cex=0.08,col=col,bg=col,axes=F,frame.plot=T,pch=19,main=title,cex.main=2*fontsize)


if (highlight==TRUE){
points(cum.bp[special],value[special],col=col[special],pch=19,cex=0.1)
}
  ### Axes
  
#axis(1, at = cum.centers, labels = plotnames,las=2,cex.axis=fontsize)
#axis(1, at = cum.centers, las=2,cex.axis=fontsize,labels=NULL)
axis(2,las=1,cex.axis=fontsize)	
  
  # Horizontal line
if (line==TRUE) abline(h=t1,lty=1,col="black",lwd=1)

}


png(file=paste(dir,"/",samples,".Asso1GL1_pvals_manhattan.png",sep=""),height=3,width=8,units="in",res=300)
manhattan(chr=e9001res$Scaffold,bp=e9001res$Position,value=e9001res$Pval,chrlengths=scafflen,title=samples,plotnames=names(scafflen),ylab="-log p-value",t1=-log10(fdr),maxp=-log10(0.0000000000000001),logneg=TRUE,highlight=FALSE,line=TRUE,special=e9001res$Pval.adj<0.05)
dev.off()

png(file=paste(dir,"/",samples,".Asso1GL1_fdr_manhattan.png",sep=""),height=3,width=8,units="in",res=300)
manhattan(chr=e9001res$Scaffold,bp=e9001res$Position,value=e9001res$Pval.adj,chrlengths=scafflen,title=samples,plotnames=names(scafflen),ylab="-log p-value",t1=-log10(0.05),maxp=-log10(maxfdrp),logneg=TRUE,highlight=FALSE,line=FALSE)
dev.off()


