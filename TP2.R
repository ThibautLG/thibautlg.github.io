graphics.off()
pause=10
pas=1/100
tmax=10
S=rexp(2*tmax,1)
T=c(0,cumsum(S))
Nt=rep(0,tmax/pas)
for (i in seq(1,tmax/pas)) Nt[i]=max(which(T<=i*pas))-1
x=seq(1,tmax/pas)*pas
for (i in seq(1,tmax/pas)) {
  Sys.sleep(pas)
  Nti=Nt[1:i]
  xi=x[1:i]
  plot(xi,Nti,type='s',ylim=c(0,Nt[tmax/pas]),xlim=c(0,x[tmax/pas]),main="On se balade sur Nt")
}
Sys.sleep(pause)
dev.new()
#maintenant, on s'arrete à T_3
Ta=T[3+1]
for (i in seq(1,Ta/pas+1)) {
  Sys.sleep(pas)
  Nti=Nt[1:i]
  xi=x[1:i]
  plot(xi,Nti,type='s',ylim=c(0,Nt[tmax/pas]),xlim=c(0,x[tmax/pas]),main="On se balade sur Nt, jusqu'à T_3")
}
plot(xi,Nti,type='s',ylim=c(0,Nt[tmax/pas]),xlim=c(0,x[tmax/pas]),main=paste("On sait que T_3=",floor(100*T[4])/100,"!"))
lines(c(Ta,Ta),c(0,Nt[tmax/pas]),col="red")
Sys.sleep(pause)
dev.new()
#maintenant on s'arrete à T_N_5
Ta=T[Nt[5/pas]+1]
for (i in seq(1,Ta/pas+1)) {
  Sys.sleep(pas)
  Nti=Nt[1:i]
  xi=x[1:i]
  plot(xi,Nti,type='s',ylim=c(0,Nt[tmax/pas]),xlim=c(0,x[tmax/pas]),main="On se balade sur Nt, jusqu'à T_N_5")
}
plot(xi,Nti,type='s',ylim=c(0,Nt[tmax/pas]),xlim=c(0,x[tmax/pas]),main=paste("T_N_5=",floor(100*Ta)/100,"?? \n On ne sait pas si la trajectoire va suivre la ligne verte."))
lines(c(5,5),c(0,Nt[tmax/pas]),col="red")
lines(c(Ta,5),c(Nt[5/pas+1],Nt[5/pas+1]),col="green")