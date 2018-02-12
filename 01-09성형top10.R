library(KoNLP)
library(wordcloud)
useSejongDic()
data1<-readLines("remake.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2
data3<-unlist(data2)
data3<-Filter(function(x) {nchar(x)<=10},data3)
head(unlist(data3),30)
data3<-gsub("\\d+","",data3)##
data3<-gsub("쌍수","쌍꺼풀",data3)
data3<-gsub("쌍커풀","쌍꺼풀",data3)
data3<-gsub("메부리코","매부리코",data3)
data3<-gsub("\\.","",data3)
data3<-gsub(" ","",data3)
data3<-gsub("\\'","",data3)
data3
write(unlist(data3),"remake_2.txt")
data4<-read.table("remake_2.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing=T),20)
txt<-readLines("성형gsub.txt")
txt
cnt_txt<-length(txt)
cnt_txt
i<-1
for(i in 1:cnt_txt){
  data3<-gsub((txt[i],"",data3))
  }
data3
data3<-Filter(function(x) {nchar(x)<=2},data3)
write(unlist(data3),"remake_2.txt")
data4<-read.table("remake_2.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing = T),10)
library(RColorBrewer)
palete<-brewer.pal(9,"Set3")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=2,random.order = F,random.color=T,colors=palete)
legend(0.3,1,"여고생들이 선호하는 성형수술 부위",cex=0.8, fill=NA,border=NA,bg="white",text.col='red',text.font=2,box.col="red")
top10<-head(sort(wordcount,decreasing = T),10)

pct<-round(top10/sum(top10)*100,1)
names(top10)
lab<-paste(names(top10),"\n",pct,"%")
pie(top10,main = "여고생들이 선호하는 성형수술 부위 TOP10",col=rainbow(10),cex=0.8,labels=lab)
lab
bchart<-head(sort(wordcount,decreasing = T),10)
bchart
bp<-barplot(bchart,main="여고생들이 선호하는 성형수술 부위 TOP 10", col=rainbow(10),cex.names=0.7,las=1,xlim=c(0,25),horiz=T)
text(y=bp,x=bchart*0.9,labels=paste(bchart,"건"),col="black",cex=0.7)
text(y=bp,x=bchart*1.15,labels=paste("(",pct,"%",")"),col="black",cex=0.7)
