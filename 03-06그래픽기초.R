a<-c(1,2,3)
plot(a,xlab = "aaa")

#타이틀 위치
par(mgp=c(2,1,0))
plot(a,xlab = "aaa")

#여백 조정하기
par(oma=c(1,1,1,1))
plot(a,xlab = "aaa")

#여러 개의 그래프 중첩
par(mfrow=c(1,1))
v1<-c(1,2,3,4,5)
v2<-c(5,4,3,2,1)
v3<-c(3,4,5,6,7)
plot(v1,type = "s",col="red",ylim = c(1,10))
par(new=T)
lines(v2,type = "o",col="blue",ylim = c(1,5))
par(new=T)
lines(v3,type = "l",col="green",ylim = c(1,15))
#범례 추가하기
legend(4,9,c("v1","v2","v3"),cex=0.9,col=c('red','blue','green'),lty=1)

#지도 위 표시
#install.packages("ggmap")
#install.packages("stringr")
library(ggmap)
library(stringr)
loc<-read.csv("서울_강동구_공영주차장_위경도.csv",header=T)
loc
loc2 <- str_sub(loc$주차장명,start=-2,end=-2)
loc2
colors <- c()
for ( i in 1:length(loc2)) {
   if (loc2[i] == '구' ) {
      colors <- c(colors,"red") }
   else { 
      colors <- c(colors,"blue") }
    }
kd<-get_map("Amsa-dong",zoom=13,maptype="roadmap")
kor.map<-ggmap(kd)+geom_point(data=loc,aes(x=LON,y=LAT),size=3,alpha=0.7,color=colors)
kor.map+geom_text(data=loc,aes(x=LON,y=LAT+0.001,label=주차장명),size=3)
ggsave("kd.png",dpi=500)

#학교표시
library(ggmap)
library(stringr)
loc<-read.csv("광운대.csv",header=T)
loc
kd<-get_map("wolgye-dong",zoom=13,maptype="roadmap")
kor.map<-ggmap(kd)+geom_point(data=loc,aes(x=LON,y=LAT),size=5,alpha=0.7,color='blue')
kor.map+geom_text(data=loc,aes(x=LON,y=LAT+0.002,label=name),size=3)
ggsave("kw.png",dpi=500)

#서울 지역별 장애인도서관
library(ggmap)
loc <- read.csv("지역별장애인도서관정보.csv",header=T)
loc
kor <- get_map("seoul", zoom=11, maptype = "terrain")
kor.map <- ggmap(kor)+geom_point(data=loc, aes(x=LON, y=LAT),size=5,alpha=0.7)
kor.map + geom_text(data=loc, aes(x = LON, y = LAT+0.01, label=자치구명),size=3)
ggsave("lib.png",dpi=500)

#서울 구청 위치
library(ggmap)
loc <- read.csv("서울시구청위치정보_new.csv",header=T)
loc
gu <- get_map("seoul", zoom=11, maptype = "terrain")
gu.map <- ggmap(gu)+geom_point(data=loc, aes(x=LON, y=LAT),size=4,alpha=0.7,color='magenta')
gu.map + geom_text(data=loc, aes(x = LON, y = LAT+0.01, label=name),size=3)
ggsave("gu.png",dpi=500)

#서울 지하철 2호선
library(ggmap)
two <- read.csv("서울지하철2호선위경도정보.csv",header=T)
thr<-read.csv("서울지하철3호선역위경도정보.csv",header=T)
sub <- get_map("seoul", zoom=11, maptype = "terrain")

sub.map <- ggmap(sub)+geom_point(data=two, aes(x=LON, y=LAT),size=1.5,alpha=1,color='darkgreen')+geom_point(data=thr, aes(x=LON, y=LAT),size=1.5,alpha=1,color='darkorange')

sub.map + geom_text(data=two, aes(x = LON, y = LAT+0.01, label=역명),size=2.3)+geom_text(data=thr, aes(x = LON, y = LAT+0.01, label=역명),size=2.3)
ggsave("sub2+3.png",dpi=500)

#제주도 여행경로
#install.packages("ggplot2")
library(ggplot2)
library(ggmap)
jeju <- read.csv("제주도여행코스_1일차.csv",header=T)
jeju
jeju1 <- get_map("Hallasan", zoom=10, maptype = "terrain")

jeju.map <- ggmap(jeju1)+geom_point(data=jeju,aes(x=LON, y=LAT),size=3,alpha=0.7,col="red")

jeju.map + geom_path(data=jeju,aes(x=LON,y=LAT),size=1,linetype=5,col="blue")+geom_text(data=jeju, aes(x = LON, y = LAT+0.01, label=장소),size=3)
ggsave("jeju_1.png",dpi=700)