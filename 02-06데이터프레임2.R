sales2<-matrix(c(1,"Apple",500,5,
                 2,"Peach",200,2,
                 3,"Banana",100,4,
                 4,'Grape',50,7),nrow = 4,byrow = T)
sales2
df1<-data.frame(sales2)
df1
names(df1)<-c('NO','NAME','PRICE','QTY')
df1$NAME
class(df1$NAME)
subset(df1,QTY<5)
subset(df1,PRICE==200)
subset(df1,NAME=='Apple')

df1<-data.frame(name=c('apple','banana','cherry'),price=c(300,200,100))
df2<-data.frame(name=c('apple','cherry','berry'),qty=c(10,20,30))
df1
df2
merge(df1,df2)
merge(df1,df2,all=T)
names(df1)<-c('이름','가격')
df1
colnames(df2)<-c('이름','갯수')
df2
ncol(df1)
nrow(df1)
rownames(df1)
colnames(df1)
df1[,c(2,1)]
