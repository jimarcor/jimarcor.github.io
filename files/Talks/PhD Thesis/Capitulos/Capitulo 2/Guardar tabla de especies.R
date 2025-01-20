######################################
###### HINCHLIFF & ROALSON 2013 ######
######################################

library(ape)
nex<-read.nexus("export.nex") #Documento guardado como .nex del árbol con figtree
#write.table(nex$tip.label,file="tiplabels.xls",row.names=F) #Guardo las especies

tiptable<-as.data.frame(read.csv("tiplabels.csv", header=T,sep=";"))
#tiptable<-tiptable[,2]
#tiptable<-tiptable[!(is.na(tiptable) | tiptable=="")] #No sé cómo quitar los valores en blanco
tiptable


CCDB_IPCN_Roalson<-read.table("clipboard", header=T, sep=";",na.strings=""); CIR<-CCDB_IPCN_Roalson

CIRmatch<-CIR[ CIR[,1] %in% tiptable[,2] , ]
CIRmatch

CIRmatch_sinduplis<-unique(CIRmatch[,1:4]);CIRmatch_sinduplis
length(unique(CIRmatch_sinduplis[,1])) #en principio, 187 especies con número de cromosomas conocido (algunos pueden tener los campos vacíos) de los 420 que hay en la filogenia

#write.table(CIRmatch_sinduplis,file="finaltips.xls",row.names = F, sep = ";")

#Podré escribir los nombres cuando consiga resolver el problema del rbind
#write.table(rbind(CIRmatch_sinduplis,tiptable[,2]),file="comprob_Hinch.xls",row.names = F)

tiptable$resolved_name <- tiptable$Species.without_.sp.cf

compHinchliff<- tiptable[-which(tiptable[,2] %in% CIRmatch_sinduplis[,1],useNames=T),] #VER LAS QUE FALTAN EN LA LISTA
compHinchliff


#########################
str(CIRmatch_sinduplis)
CIRmatch_sinduplis[,2:4]<-as.character(CIRmatch_sinduplis[,2:4])

result <- aggregate(gametophytic ~ resolved_name, data = CIRmatch_sinduplis, paste, collapse = ","); 
result$sporophytic <- aggregate(sporophytic ~ resolved_name, data = CIRmatch_sinduplis, paste, collapse = ",")

CIRmatch_sinduplis[ , .(gametophytic = paste(gametophytic, collapse=",")), by = CIRmatch_sinduplis$resolved_name]


result <- aggregate(CIRmatch_sinduplis[,2:4] ~ CIRmatch_sinduplis[,1], data = CIRmatch_sinduplis, c)

result <- aggregate(CIRmatch_sinduplis[,2:4] ~ CIRmatch_sinduplis[,1], data = CIRmatch_sinduplis, toString)



#No consegui que me uniera los valores bajo el mismo nombre
resume <- aggregate(CIRmatch_sinduplis[,2:4], by=list(CIRmatch_sinduplis[,1]), c)
resume <- aggregate(CIRmatch_sinduplis[-duplicated(CIRmatch_sinduplis)], by=list(CIRmatch_sinduplis[,1]),c)


resume<-as.data.frame(paste(unlist((CIRmatch_sinduplis), collapse =",")))
resume
########################


##################################
########## SPALINK 2016 ##########
##################################

##Árbol de Daniel Spalink
tree<-read.nexus("Cyperaceae.tree")
#write.table(tree$tip.label,file="Spalink.xls",row.names=F)

spalink<-as.data.frame(read.csv("spalink.csv", header=T,sep=";"))
#spalink<-spalink[,2]
#spalink<-spalink[!(is.na(spalink) | spalink=="")] #No sé cómo quitar los valores en blanco
spalink

CIRmatch_spa<-CIR[ CIR[,1] %in% spalink[,2] , ]
CIRmatch_spa

CIRmatch_spa_sinduplis<-unique(CIRmatch_spa[,1:4]);CIRmatch_spa_sinduplis
length(unique(CIRmatch_spa_sinduplis[,1])) #en principio, 104 especies con número de cromosomas conocido (algunos pueden tener los campos vacíos) de los 345 que hay en la filogenia

#write.table(CIRmatch_spa_sinduplis,file="finaltips_Spalink.xls",row.names = F, sep = ";")

compSpalink<- spalink[-which(spalink[,2] %in% CIRmatch_spa_sinduplis[,1],useNames=T),] #VER LAS QUE FALTAN EN LA LISTA
sort(compSpalink[,2])


#tabla conjunta de los que faltan en general
faltan <- unique(c(as.character(compHinchliff$resolved_name), as.character(compSpalink$resolved_name)))
sort(faltan)
#write.csv(sort(faltan),"spp faltan.csv")
