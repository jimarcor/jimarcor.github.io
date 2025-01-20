setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/RESULTADOS/PARTICIONES DE ARBOLES (inputs)/Hinchliff")
library (ape)
HinchChromtree<-read.tree("C:/Users/jimarcor/Google Drive/Tesis/Capítulo 2/CypHinch.tree")
#write.table(HinchChromtree$tip.label,file="HinchChromtree.xls",row.names=F) #Guardo las especies, que editaré a mano para coger las del nodo

  #SDCFAEC
setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/PARTICIONES DE ARBOLES/Hinchliff/Nodo SDC+FAEC")
SDCFAEC1<-read.csv("SDCFAEC.csv", header=F,sep=";") #Los que son del nodo SDC+FAEC
SDCFAEC<-as.character(SDCFAEC1[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgSDCFAEC<-drop.tip(phy=HinchChromtree, SDCFAEC, subtree=F) #arbol del Background del nodo SDCFAEC
plot.phylo(bgSDCFAEC, cex = 0.7,type="fan",no.margin=T)
write.tree(bgSDCFAEC, file="bgSDCFAEC.tree")

#saco el nodo
SDCFAECtree<-drop.tip(phy=HinchChromtree, bgSDCFAEC$tip.label) #árbol del nodo SDCFAEC
plot.phylo(SDCFAECtree, cex = 0.7,type="fan",no.margin=T)
write.tree(SDCFAECtree, file="SDCFAEC.tree")



  #Nodo 1 
setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/PARTICIONES DE ARBOLES/Hinchliff/Nodo 1 Hinchliff")
Nodo11<-read.csv("Nodo1.csv", header=F,sep=";") #Los que son del nodo Nodo1
Nodo1<-as.character(Nodo11[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo1<-drop.tip(phy=HinchChromtree, Nodo1, subtree=F) #arbol del Background del nodo Nodo1
plot.phylo(bgNodo1, cex = 0.7,type="fan",no.margin=T)
write.tree(bgNodo1, file="bgNodo1.tree")

#saco el nodo
Nodo1tree<-drop.tip(phy=HinchChromtree, bgNodo1$tip.label) #árbol del nodo Nodo1
plot.phylo(Nodo1tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo1tree, file="Nodo1.tree")


  
  #Nodo 2 
setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/PARTICIONES DE ARBOLES/Hinchliff/Nodo 2 Hinchliff")
Nodo21<-read.csv("Nodo2.csv", header=F,sep=";") #Los que son del nodo Nodo2
Nodo2<-as.character(Nodo21[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo2<-drop.tip(phy=HinchChromtree, Nodo2, subtree=F) #arbol del Background del nodo Nodo1
plot.phylo(bgNodo2, cex = 0.7,type="fan",no.margin=T)
write.tree(bgNodo2, file="bgNodo2.tree")

#saco el nodo
Nodo2tree<-drop.tip(phy=HinchChromtree, bgNodo2$tip.label) #árbol del nodo Nodo1
plot.phylo(Nodo2tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo2tree, file="Nodo2.tree")



#Nodo 3

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/PARTICIONES DE ARBOLES/Hinchliff/Nodo 3 Hinchliff")
Nodo31<-read.csv("Nodo3.csv", header=F,sep=";") #Los que son del nodo Nodo2
Nodo3<-as.character(Nodo31[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo3<-drop.tip(phy=HinchChromtree, Nodo3, subtree=F) #arbol del Background del nodo Nodo1
plot.phylo(bgNodo3, cex = 0.7,type="fan",no.margin=T)
write.tree(bgNodo3, file="bgNodo3.tree")

#saco el nodo
Nodo3tree<-drop.tip(phy=HinchChromtree, bgNodo3$tip.label) #árbol del nodo Nodo1
plot.phylo(Nodo3tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo3tree, file="Nodo3.tree")



#Nodo 1+2

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/RESULTADOS/PARTICIONES DE ARBOLES (inputs)/Hinchliff/Nodo 1+2 Hinchliff")
Nodo121<-read.csv("Nodo1+2_Hinchliff.csv", header=F,sep=";") #Los que son del nodo Nodo2
Nodo12<-as.character(Nodo121[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo12<-drop.tip(phy=HinchChromtree, Nodo12, subtree=F) #arbol del Background del nodo Nodo1+2
plot.phylo(bgNodo12, cex = 0.7,type="fan",no.margin=T)
write.tree(bgNodo12, file="bgNodo12.tree")

#saco el nodo
Nodo12tree<-drop.tip(phy=HinchChromtree, bgNodo12$tip.label) #árbol del nodo Nodo1+2
plot.phylo(Nodo12tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo12tree, file="Nodo12.tree")



#Nodo 2+3

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/PARTICIONES DE ARBOLES/Hinchliff/Nodo 2+3 Hinchliff")
Nodo231<-read.csv("Nodo2+3_chrom_Hinchliff.csv", header=F,sep=";") 
Nodo23<-as.character(Nodo231[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo23<-drop.tip(phy=HinchChromtree, Nodo23, subtree=F) #arbol del Background del nodo Nodo1+2
plot.phylo(bgNodo23, cex = 0.7,type="fan",no.margin=T)
write.tree(bgNodo23, file="bgNodo23.tree")



#Nodo 4-2

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/RESULTADOS/PARTICIONES DE ARBOLES (inputs)/Spalink/Nodo 2-4 Hinchliff")
Nodo241<-read.csv("Nodo 4-2_chrom_Hinchliff.csv", header=F,sep=";") 
Nodo24<-as.character(Nodo241[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo24<-drop.tip(phy=HinchChromtree, Nodo24, subtree=F) #arbol del Background del nodo Nodo1+2
plot.phylo(bgNodo24, cex = 0.7,type="fan",no.margin=T)
write.tree(bgNodo24, file="bgNodo24.tree")


# Saco el Nodo 4-2
Nodo24tree<-drop.tip(phy=HinchChromtree, bgNodo24$tip.label)
plot.phylo(Nodo24tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo24tree, file="Nodo24.tree")




#Nodo 1-3

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/RESULTADOS/PARTICIONES DE ARBOLES (inputs)/Hinchliff/Nodo 1-3 Hinchliff")
Nodo311<-read.csv("Nodo1-3_chrom_Hinchliff.csv", header=F,sep=";") 
Nodo31<-as.character(Nodo311[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo31<-drop.tip(phy=HinchChromtree, Nodo31, subtree=F) #arbol del Background del nodo Nodo1+2
plot.phylo(bgNodo31, cex = 0.7,type="fan",no.margin=T)

# Saco el Nodo 1-3
Nodo31tree<-drop.tip(phy=HinchChromtree, bgNodo31$tip.label)
plot.phylo(Nodo31tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo31tree, file="Nodo31.tree")



#Nodo 4-2-3

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/RESULTADOS/PARTICIONES DE ARBOLES (inputs)/Hinchliff/Nodo 4-2-3 Hinchliff")
Nodo4231<-read.csv("Nodo 4-2-3_chrom_Hinchliff.csv", header=F,sep=";") 
Nodo423<-as.character(Nodo4231[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo423<-drop.tip(phy=HinchChromtree, Nodo423, subtree=F) #arbol del Background del nodo Nodo1+2
plot.phylo(bgNodo423, cex = 0.7,type="fan",no.margin=T)

# Saco el Nodo 4-2-3
Nodo423tree<-drop.tip(phy=HinchChromtree, bgNodo423$tip.label)
plot.phylo(Nodo423tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo423tree, file="Nodo423.tree")



#Nodo 4-1

setwd("C:/Users/jimarcor/Google Drive/TESIS/Capítulo 2/RESULTADOS/PARTICIONES DE ARBOLES (inputs)/Hinchliff/Nodo 4-1 Hinchliff")
Nodo411<-read.csv("Nodo4-1_chrom_Hinchliff.csv", header=F,sep=";") 
Nodo41<-as.character(Nodo411[,1]) #Convierto en caracter, porque es obligatorio para hacer el pruning

#Saco el background
bgNodo41<-drop.tip(phy=HinchChromtree, Nodo41, subtree=F) #arbol del Background del nodo Nodo1+2
plot.phylo(bgNodo41, cex = 0.7,type="fan",no.margin=T)

# Saco el Nodo 4-1
Nodo41tree<-drop.tip(phy=HinchChromtree, bgNodo41$tip.label)
plot.phylo(Nodo41tree, cex = 0.7,type="fan",no.margin=T)
write.tree(Nodo41tree, file="Nodo41.tree")
