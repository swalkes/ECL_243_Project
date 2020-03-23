#ECL243 Final Script for Submission

#libraries used
library(vcfR)
library(adegenet)
library(poppr)


##Recreating Figure 2A
fig2a<-read.csv("Fig2AData.csv")
#test using mean Fst values
boxplot(Mean~Group,data=fig2a)
points(x=fig2a$Group,y=fig2a$Mean)
#alt using weighted Fst values
boxplot(Weighted~Group,data=fig2a)
points(x=fig2a$Group,y=fig2a$Weighted)


##Recreating Figure 2B
fig2b<-read.csv("Fig2BData.csv")
plot(x=fig2b$ln.km.,y=fig2b$Fst..1.Fst.,xlab="ln(km)",ylab="Fst/(1-Fst)",ylim=c(.02,.08))
text(x=fig2b$ln.km.,y=fig2b$Fst..1.Fst.,labels=fig2b$ï..Pop2, pos=1)
abline(lm(fig2b$Fst..1.Fst.~fig2b$ln.km.))


##DAPC analysis
#data input and formatting
allvcf<-read.vcfR("plink.vcf")
all.genind<-vcfR2genind(allvcf)
all.pops<-read.csv("allpops_correct.csv")
pop(all.genind)<-all.pops$Pop


#filter out P maniculatus samples
manless.genind<-popsub(all.genind,blacklist = "maniculatus")


#DAPC with only P leuc samples
#110 PCs, 3 clusters
dapc.test5<-find.clusters(pleuc.genind)
dapc.att5<-dapc(pleuc.genind,dapc.test5$grp)
scatter(dapc.att5)
assignplot(dapc.att5)

