library(KoNLP)
useSejongDic()
data1<-readLines("propose.txt")
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
data3<-gsub("프로포즈","",data3)
data3<-gsub("선물","",data3)
data3<-gsub("결혼","",data3)
data3<-gsub("연애","",data3)
data3<-gsub("가족","",data3)
data3<-gsub("생활","",data3)
data3<-gsub("답변","",data3)
data3<-gsub("준비","",data3)
data3<-gsub("여자","",data3)
data3<-gsub("추천","",data3)
data3<-gsub("조회","",data3)
data3<-gsub("생각","",data3)
data3<-gsub("장소","",data3)
data3<-gsub("친구","",data3)
data3<-gsub("방법","",data3)
data3<-gsub("사회","",data3)
data3<-gsub("패션","",data3)
data3<-gsub("남자","",data3)
data3<-gsub("의미","",data3)
data3<-gsub("커플","",data3)
data3<-gsub("행사","",data3)
data3<-gsub("감동","",data3)
data3<-gsub("사람","",data3)
data3<-gsub("성공","",data3)
data3<-gsub("조언","",data3)
data3<-gsub("특별","",data3)
data3<-gsub("시간","",data3)
data3<-gsub("하게","",data3)
data3<-gsub("하시","",data3)
data3<-gsub("\\^ㅎ","",data3)
data3<-gsub("감사","",data3)
data3<-gsub("그룹","",data3)
data3<-gsub("기억","",data3)
data3<-gsub("누나","",data3)
data3<-gsub("문화","",data3)
data3<-gsub("정치","",data3)
data3<-gsub("질문","",data3)

data3<-Filter(function(x) {nchar(x)>=2},data3)
write(unlist(data3),"propose2.txt")
data4<-read.table("propose2.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing=T),20)

library(RColorBrewer)

top10<-head(sort(wordcount,decreasing = T),10)

#pie chart
pct<-round(top10/sum(top10)*100,1)
names(top10)
lab<-paste(names(top10),"\n",pct,"%")
pie(top10,main = "프로포즈 선물 TOP 10",col=rainbow(10),cex=0.8,labels=lab)
lab

#bar chart
bchart<-head(sort(wordcount,decreasing = T),10)
bchart
#세로
bp<-barplot(bchart,main="프로포즈 선물 TOP 10", col=rainbow(10),cex.names=0.7,las=2,ylim=c(0,60))
text(x=bp,y=bchart*1.05,labels=paste("(",pct,"%",")"),col="black",cex=0.7)
text(x=bp,y=bchart*0.95,labels=paste(bchart,"건"),col="black",cex=0.7)
