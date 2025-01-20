setwd("C:/Users/jimarcor/Google Drive/TESIS/Capitulo 2")

##            Hinchliff & Roalson 2013            ##

install.packages("ape")
library(ape)
unprunedtreeHinch<-read.nexus("./Hinchliff & Roalson 2013/export.nex")
chromHinch<-read.csv("RESUMEN_Hinchliff.csv", header=T,sep=";") #Dos primeras columnas de RESUMEN_Hinchliff_Spalink.xls
#Poner "_" en los espacios

Faltan1<-read.csv("Faltan FINALES.csv", header=F,sep=";") #Los que no tenemos y queremos eliminar
Faltan<-as.character(Faltan1[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

######QUIZ?S HAYA ALGUN TAXON ELIMINADO DE ESTA LISTA POR NO SER CYPERACEAE ? COMPROBAR######

unprunedtreeHinch$tip.label


#Hay algunos taxones repetidos: Carex aquatilis (incluye dos veces el tipo y una variedad), Eleocharis...
#Los elimino???


#prune tree by matching tips (chromosomes count and tiplabel)
HinchChromtree<-drop.tip(phy=unprunedtreeHinch,Faltan,subtree=F) #Elimina los tips que no tenemos muestreados
HinchChromtree


plot.phylo(HinchChromtree, cex = 0.7,type="fan",no.margin=T)

chromHinch[-which(chromHinch[,1] %in% HinchChromtree$tip.label,useNames=T),] #VER LAS QUE FALTAN EN LA LISTA Y TENGO NUMERO CROMOSOMA

write.tree(HinchChromtree, file="CypHinch.tree")

#Pegar nº chrom
tabchrom<-read.csv("clipboard", header=F, sep=",") #archivo RESUMEN_Hinchliff
tabchrom
row.names(tabchrom) = paste(tabchrom[,1], tabchrom[,2], sep="_")
HinchChromtree$tip.label <- row.names(tabchrom)[match(HinchChromtree$tip.label,tabchrom[,1])]
plot.phylo(HinchChromtree, cex = 0.7,type="fan",no.margin=F, label.offset= 1)




##            Spalink et al. 2016            ##

unprunedtreeSpalink<-read.nexus("./Spalink et al 2016/Cyperaceae.tree")
chromSpalink<-read.csv("RESUMEN_Spalink.csv", header=T,sep=";") #Dos primeras columnas de RESUMEN_Hinchliff_Spalink.xls
#Poner "_" en los espacios

Faltan1<-read.csv("Faltan FINALES.csv", header=F,sep=";") #Los que no tenemos y queremos eliminar
Faltan<-as.character(Faltan1[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

######QUIZ?S HAYA ALGUN TAXON ELIMINADO DE ESTA LISTA POR NO SER CYPERACEAE ? COMPROBAR######

unprunedtreeSpalink$tip.label


#Hay algunos taxones repetidos: Carex aquatilis (incluye dos veces el tipo y una variedad), Eleocharis...
#Los elimino???


#prune tree by matching tips (chromosomes count and tiplabel)
SpalChromtree<-drop.tip(phy=unprunedtreeSpalink,Faltan,subtree=F) #Elimina los tips que no tenemos muestreados
SpalChromtree

plot.phylo(SpalChromtree, cex = 0.7,type="fan",no.margin=T)

chromSpalink[-which(chromSpalink[,1] %in% SpalChromtree$tip.label,useNames=T),] #VER LAS QUE FALTAN EN LA LISTA Y TENGO NUMERO CROMOSOMA

write.tree(SpalChromtree, file="CypSpalink.tree")


#Pegar nº chrom
tabchrom<-read.csv("clipboard", header=T, sep=",") #archivo RESUMEN_Spalink
tabchrom
row.names(tabchrom) = paste(tabchrom[,1], tabchrom[,2], sep="_")
SpalChromtree$tip.label <- row.names(tabchrom)[match(SpalChromtree$tip.label,tabchrom[,1])]
plot.phylo(SpalChromtree, cex = 0.7,type="fan",no.margin=T, label.offset= 1)




###########


library("devtools")
devtools::install_github("roszenil/chromploid")
library("chromploid")
library("geiger") #chromploid depends on geiger so don't forget to load it



Q_chromevolM3()

