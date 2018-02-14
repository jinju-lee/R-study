library(wordcloud)
wordcloud(words,freq,scale=c(4,5),min.freq = 3,max.words = Inf,random.order = TRUE,random.color = FALSE,rot.per = .1,colors = "black",ordered.colors = FALSE,use.r.layout = FALSE,fixed.asp = TRUE,...)

library(RColorBrewer)
display.brewer.all()
COL1<-brewer.pal(9,"Pastel1");COL1
