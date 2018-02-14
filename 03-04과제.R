#1
y<-c(3,4,5,6,7)
plot(y)
plot(y,ylim = c(3,7),ylab='Y축 값',main='(1)-1')
#2
y<-c(3,3,4,4)
plot(y)
plot(y,ylim = c(1,5),ylab='Y축 값',main='(1)-2')
#3
x<-c(3,3,3)
y<-c(2,3,4)
plot(x,y,xlim = c(1,5),ylim = c(1,5),xlab = 'X축 값',ylab='Y축 값',main='(1)-3')
#4
x<-c(10,20,30,40,50,60,70,80,90)
y<-c(10,9,8,7,6,5,4,3,2)
plot(x,y,xlim = c(0,100),ylim = c(1,10),xlab = 'X축 값',ylab='Y축 값',main='(1)-4')
#5
x<-c(2,4,6,8)
y<-c(16,17,19,18)
plot(x,y,xlim = c(0,10),ylim = c(15,20),xlab = 'xxx',ylab='yyy',main='(1)-5')
#6.1
x<-c(12,13,14,15,16,17,18)
y<-c(30,31,33,32,28,27,30)
plot(x,y,xlim = c(10,20),ylim = c(26,34),xlab = '7월의 날짜(일)',ylab='최고 기온',main='일주일간 최고 기온변화')
#6.2
x<-c(1.0,2.0,2.0)
y<-c(99,98,100)
plot(x,y,xlim = c(0.0,3.0),ylim = c(95,100),xlab = '4학년(반)',ylab='점수(점)',main='4학년 1~3등 반 분포')
#1
df1<-data.frame('NO'=c(1,2,3),
                'NAME'=c('apple','banana','peach'),
                'PRICE'=c(100,200,300))
df1
#2
df2<-data.frame('NO'=c(10,20,30),
                'NAME'=c('train','car','airplane'),
                'PRICE'=c(1000,2000,3000))
df2
#(1)-1
s<-data.frame('name'=c('김길동','강길동','박길동'),
              'kor'=c(100,90,85),
              'mat'=c(90,95,98),
              'eng'=c(80,98,100))
s
#(1)-2
s[0,]
#(1)-3 
nrow(s)
#(1)-4
s[ ,c(1,2)]
#(1)-5
s[ ,c(1,3)]
#(1)-6
s$name
#(1)-7
subset(s,kor>=90)
#(1)-8
subset(s,name=='박길동')
#(1)-9
s<-rbind(s,data.frame(name='최길동',kor=80,mat=90,eng=93))
s
#(2)-1
t<-data.frame('name'=c('김길동','박길동','최길동'),
              'kor'=c(100,90,92),
              'mat'=c(90,95,100))
t
#(2)-2
t<-cbind(t,data.frame(sci=c(88,80,94)))
t
#(2)-3
length(t)
#(2)-4 
t[-2,]
#(2)-5 
t[,-1]
#(2)-6 
t[,c(1,4,2,3)]
#(3)-1
merge(s,t)
#(3)-2
merge(s,t,all = T)
#(3)-3
cbind(s,t)
#(3)-4
cbind(t,s)
#(3)-5
tt<-subset(t,select = c(name,kor,mat))
tt
#(3)-6
ss<-subset(s,select = c(name,kor,mat))
ss
#(3)-7
rbind(tt,ss)
#(3)-8
rbind(ss,tt)