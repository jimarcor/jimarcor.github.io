haploid <- read.table(file = "New results/chrom.txt", sep=";", header=FALSE)

library(car)
hist(haploid[,2],main = "Haploid number distribution in sedges", xlab = "Chromosome number (n)")

library(ape)
phy<-read.tree("New results/cyperaceae_chronogram.tree")
phy<-ladderize(phy)
PhyChrom <- phy<-drop.tip(phy, setdiff(phy$tip.label, haploid[,1]))


#Plot the phylogeny

par(mfrow=c(1,2), mar=c(5.5,0,3,3),
    mai = c(1, 0, 0.5, 0.5))
plot(PhyChrom,cex=0.1,show.tip.label = F)
axis(1)
plot.default(factor(haploid[,1],levels=PhyChrom$tip.label)~haploid[,2], type="n", axes=F, xlab="") #plot axes
points(factor(haploid[,1],levels=PhyChrom$tip.label)~haploid[,2], #al usar plot.default evito que muestre las variables como boxplots (en cuyo caso deber??a ser invertido el orden de los ejes: conteo[,3] ~factor(conteo[,1],levels=CarexChrom$tip.label))
             axes=F, ylab="",xlab="", pch="·", cex=1.5, ylim=c(1,Ntip(PhyChrom)))

axis(1, c(0, 20, 40, 60, 80))
title(xlab="Chromosome number (n)")
