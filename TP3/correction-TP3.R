# version du 09/02/2012
#
#Exercice 1

#Exercice 2
#1 
#2.a
X=rexp(10000,1.5)
lambda=(1:length(X))/cumsum(X)
#2.b
plot(lambda, type="l")
#4
X=matrix(rexp(500*1000,1.5),1000,500)
lambda500=500/rowSums(X)
Y=sqrt(500)*(lambda500-1.5)
borne=4
nbclasses=10
limites=borne*(-nbclasses:nbclasses)/nbclasses
hist(Y[Y>-borne & Y<borne],breaks=limites, main="histogrammes des Y", xlab="Y")

