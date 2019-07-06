# version du 09/02/2012
#
#Exercice 1
#1
U=rbinom(2,1,0.5)
X=U[1]*(1+2*U[2])
#2.a
U=matrix(rbinom(2*10000,1,0.5),10000,2)
X=U[,1]*(1+2*U[,2])
#2.b
Xbar=cumsum(X)/(1:length(X))
plot(1:10000,Xbar,type="l")
abline(h=1, col="red")
#3.b
n=100
p=10000
U1=matrix(rbinom(p*n,1,0.5),p,n)
U2=matrix(rbinom(p*n,1,0.5),p,n)
X=U1*(1+2*U2)
Xbar=rowSums(X)/n
Y=sqrt(n/1.5)*(Xbar-1)
#3.c
borne=4
nbclasses=20
limites=borne*(-nbclasses:nbclasses)/nbclasses
hist(Y[Y>-borne & Y<borne],breaks=limites, main="histogrammes des Y", xlab="Y",ylim=c(0,0.4*p*borne/nbclasses))
xx=borne*(-100:100)/100
lines(lines(xx,p*borne/nbclasses*dnorm(xx,mean=0,sd=1),col="red"))

#Exercice 2
#

