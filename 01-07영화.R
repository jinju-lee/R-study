library(KoNLP)
library(wordcloud)
useSejongDic()

data1<-readLines("score.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2
head(unlist(data2),30)
data3<-unlist(data2)
data3<-gsub("BEST","",data3)
data3<-gsub("¸®ºä","",data3)
data3<-gsub("³»¿ë","",data3)
data3<-gsub("¿µÈ­","",data3)
data3<-gsub("ÆòÁ¡","",data3)
data3<-gsub(" ","",data3)
data3<-gsub("-","",data3)
data3<-gsub("(^(0-9)$)","",data3)
data3<-gsub("(^(A-Q)$)","",data3)
data3<-gsub("(^(°¡-ÆR)$)","",data3)
data3
write(unlist(data3),"score_2.txt")
data4<-read.table("score_2.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing = T),20)
#data3<-gsub("(^(0-9)$)","",data3)
#data3<-gsub("(^(A-Q)$)","",data3)
#data3<-gsub("(^(°¡-ÆR)$)","",data3)

data3<-gsub("(¢Ï \\d)","",data3)

write(unlist(data3),"score_3.txt")
data4<-read.table("score_3.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing = T),20)
library(RColorBrewer)
palete<-brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.5,min.freq=1,random.order = F,random.color=T,colors=palete)
legend(0.3,1,"ÆòÁ¡ ºÐ¼®",cex=0.8, fill=NA,border=NA,bg="white",text.col='red',text.font=2,box.col="red")

