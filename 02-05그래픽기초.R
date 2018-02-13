var1<-c(1,2,3,4,5)
plot(var1)

x<-1:3
y<-3:1
plot(x,y,xlim = c(1,10),ylim = c(1,5),xlab = 'X축 값',ylab='Y축 값',main='Plot Test')
plot.new()
dev.new()

v1<-c(100,130,120,160,150)
plot(v1,type = 'o',col='red',ylim = c(0,200),axes = FALSE,ann = FALSE)
axis(1,at=1:5,lab=c('MON','TUE','WED','THU','FRI'))
axis(2,ylim=c(0,200))
title(main = 'FRUIT',col.main='red',font.main=4)
title(xlab = 'DAY',col.lab='black')
title(ylab = 'PRICE',col.lab='blue')
v1
par(mfrow=c(1,3))
plot(v1,type = 'o')
plot(v1,type = 's')
plot(v1,type = 'l')

pie(v1)
plot(v1,type='o')
barplot(v1)
