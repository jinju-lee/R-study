data1<-read.csv('2013년_서울_주요구별_병원현황.csv',header=T)
data1
barplot(as.matrix(data1[1:9,2:11]),main=paste('서울시 주요 구별 과목별 병원현황-2013년','\n','출처[국민건강보험공단]'),ylab='병원수',beside=T,col=rainbow(8),ylim=c(0,350))
abline(h=seq(0,350,10),lty=3,lwd=0.2)
name<-data1$표시과목
name
legend(75,350,name,cex = 0.8,fill = rainbow(8),bg='white')
savePlot('hospital.png',type='png')


