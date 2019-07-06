# Script pour la lecture et l'affichage de tables de données
# fonctions read.table et plot
# version 24 janvier 2012

# onu67 budget temps :
onu67 <- read.table("http://www.math.univ-toulouse.fr/~tlegouic/TP1/donnees/onu67_budget_temps.txt"
  , colClasses = c("character",rep("numeric",10),rep("factor",4)))
summary(onu67) ; head(onu67)

# ajout d'une colonne
T<-cbind(onu67, PAYS2=ifelse(onu67$PAYS==1,"USA",ifelse(onu67$PAYS==2,"Autre Ouest",ifelse(onu67$PAYS==3,"Autre Est","Yougoslavie"))))
head(T)

# graphique des variables PROF et MENA (temps passé en activités professionnelles et pour le ménage), avec mise en évidence du sexe (couleur) et du pays (forme)
plot(onu67[,c(1,3)]
, pch=ifelse(onu67$PAYS==1,15,ifelse(onu67$PAYS==2,16,ifelse(onu67$PAYS==3,17,18)))
, col=ifelse(onu67$SEX==1,ifelse(onu67$CIV==1,"blue",ifelse(onu67$CIV==2,"lightblue","white")),ifelse(onu67$CIV==1,"red",ifelse(onu67$CIV==2,"pink","white")))
, xlab="Activités professionnelles"
, ylab="Activités ménagères"
, main="Enquête ONU 1967 :\nTemps passé en act. prof. et pour le ménage, par cat. de personne"
, sub="En 1/100èmes d'heure")
legend("bottomleft"
, c("H célibataire","H marié","F célibataire","F mariée","USA","Autres Ouest","Yougoslavie","Autres Est")
, col=c("blue","lightblue","red","pink",rep("black",4))
, pch=c(4,4,4,4,15,16,18,17)
, bty="n")
text(550,600,"L'homme occidental marié")
arrows(670,585,onu67[11,1]+5,onu67[11,3]+10,length=0.1)
