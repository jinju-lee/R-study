#과제관광지도-인천
library(ggplot2)
library(ggmap)
incheon <- read.csv("인천여행코스.csv",header=T)
incheon1 <- get_map("Incheon", zoom=10, maptype = "terrain")
incheon.map <- ggmap(incheon1)+geom_point(data=incheon,aes(x=LON, y=LAT),size=3,alpha=0.7,col="red")

incheon.map + geom_path(data=incheon,aes(x=LON,y=LAT),size=1,linetype=5,col="blue")+geom_text(data=incheon, aes(x = LON, y = LAT+0.01, label=장소),size=3)
ggsave("incheon_1.png",dpi=700)

#과제관광지도-서울
library(ggplot2)
library(ggmap)
seoul <- read.csv("서울여행코스.csv",header=T)
seoul1 <- get_map("seoul", zoom=10, maptype = "terrain")
seoul.map <- ggmap(seoul1)+geom_point(data=seoul,aes(x=LON, y=LAT),size=3,alpha=0.7,col="red")

seoul.map + geom_path(data=seoul,aes(x=LON,y=LAT),size=1,linetype=5,col="blue")+geom_text(data=seoul, aes(x = LON, y = LAT+0.01, label=장소),size=3)
ggsave("seoul_1.png",dpi=700)