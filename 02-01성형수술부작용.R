library(KoNLP)
library(wordcloud)
useSejongDic()
data1<-readLines("remake2.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES = F)
data2
data3<-unlist(data2)
data3<-Filter(function(x) {nchar(x)<=30},data3)
head(unlist(data3),30)

data3<-gsub("\\d+","",data3)##
data3<-gsub("\\.","",data3)
data3<-gsub(" ","",data3)
data3<-gsub("\\'","",data3)
data3<-gsub("답변","",data3)
data3<-gsub("성형외과","",data3)
data3<-gsub("부작용","",data3)
data3<-gsub("지식iN","",data3)
data3<-gsub("하이닥-네이버","",data3)
data3<-gsub("수술","",data3)
data3<-gsub("성형수술","",data3)
data3<-gsub("추천","",data3)
data3<-gsub("조회","",data3)

data3<-Filter(function(x) {nchar(x)>=2},data3)
write(unlist(data3),"remake22.txt")
data4<-read.table("remake22.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing=T),20)

library(RColorBrewer)
palete<-brewer.pal(9,"Set3")
#wordcloud
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.8,min.freq=3,max.words = 50,random.order = F,random.color=T,colors=palete)
legend(0.3,1,"성형수술 부작용 키워드",cex=0.8, fill=NA,border=NA,bg="white",text.col='red',text.font=2,box.col="red")

top10<-head(sort(wordcount,decreasing = T),10)

#pie chart
pct<-round(top10/sum(top10)*100,1)
names(top10)
lab<-paste(names(top10),"\n",pct,"%")
pie(top10,main = "성형수술 부작용 키워드 TOP10",col=rainbow(10),cex=0.8,labels=lab)
lab

#bar chart
bchart<-head(sort(wordcount,decreasing = T),10)
bchart
#세로
bp<-barplot(bchart,main="성형수술 부작용 키워드 TOP 10", col=rainbow(10),cex.names=0.7,las=2,ylim=c(0,35))
text(x=bp,y=bchart*1.05,labels=paste("(",pct,"%",")"),col="black",cex=0.7)
text(x=bp,y=bchart*0.95,labels=paste(bchart,"건"),col="black",cex=0.7)
#가로
bp<-barplot(bchart,main="성형수술 부작용 키워드 TOP 10", col=rainbow(10),cex.names=0.7,las=1,xlim=c(0,35),horiz=T)
text(y=bp,x=bchart*0.9,labels=paste(bchart,"건"),col="black",cex=0.7)
text(y=bp,x=bchart*1.15,labels=paste("(",pct,"%",")"),col="black",cex=0.7)

