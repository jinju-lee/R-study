par(mfrow=c(1,2))
#1
y<-c(5,7,7,6,1)
plot(y,type='o',col='red',ylim = c(0,8),axes=FALSE,ann=FALSE)
axis(1, at=1:5,lab=c('A','B','C','D','F'))
axis(2,ylim=c(0,8))
title(main='학점별 학생수',col.main='red',font.main=4)
title(xlab = '학점(점)',col.lab='black')
title(ylab='학생수(명)',col.lab='blue')
#2
y<-c(12,13,20,23)
plot(y,type='o',col='red',ylim = c(10,24),axes=FALSE,ann=FALSE)
axis(1, at=1:4,lab=c('나리','구슬','송이','난초'))
axis(2,ylim=c(10,24))
title(main='반별 어린이수',col.main='blue',font.main=4)
title(xlab = '반이름',col.lab='black')
title(ylab='연령수(명)',col.lab='black')

