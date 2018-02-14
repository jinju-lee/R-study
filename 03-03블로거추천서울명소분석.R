library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()
#mergeUserDic(data.frame(readLines("seoul_go.txt"),"ncn"))
txt<-readLines("seoul_go.txt")
place<-sapply(txt,extractNoun,USE.NAMES = F)
place
head(unlist(place),30)
cdata<-unlist(place)
place<-str_replace_all(cdata,"[^[:alpha:]]","")
place<-gsub(" ","",place)
txt<-readLines("서울명소gsub.txt")
txt
cnt_txt<-length(txt)
txt
i<-1
for(i in 1:cnt_txt){
  place<-gsub((txt[i]),"",place)
}
#place
place<-Filter(function(x){nchar(x)>=2},place)
write(unlist(place),"seoul_go_2.txt")
rev<-read.table("seoul_go_2.txt")
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount, decreasing = T),30)

library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(names(wordcount),freq = wordcount,scale = c(5,1),rot.per = 0.25,min.freq = 2,random.order = F,random.color = T,colors = palete)
legend(0.3,1,"블로거 추천 서울 명소 분석",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")