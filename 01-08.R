v1<-("봄이 지나면 여름이고 여름이 지나면 가을입니다.그리고 겨울이죠.")
v1
extractNoun(v1)
v3<-c("봄이 지나면 여름이고 여름이 지나면 가을입니다.","그리고 겨울이죠.")
v3
extractNoun(v3)
v4<-sapply(v3,extractNoun,USE.NAMES = F)
v4
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62))
a<-seq(1,1000,len=62)
a
library(RColorBrewer)
palete<-brewer.pal(9,"set1")
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62),colors=palete)
