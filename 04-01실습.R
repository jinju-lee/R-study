exam<-read.csv("csv_exam.csv")

#데이터 앞부분
head(exam)
head(exam,10)

#데이터 뒷부분
tail(exam)
tail(exam,10)

#뷰어창
View(exam)

#행열갯수
dim(exam)

#속성
str(exam)

#요약통계량 출력
summary(exam)

#mpg데이터 파악하기
library(ggplot2)
mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
help(mpg)
summary(mpg)

#변수명 바꾸기
install.packages("dplyr")
library(dplyr)
df_raw<-data.frame(var1=c(1,2,1),
                   var2=c(2,3,2))
df_raw
#복사
df_new<-df_raw
df_new
df_new<-rename(df_new,v2=var2)
df_new

#혼자서해보기
mpg_new<-mpg
mpg_new
mpg_new<-rename(mpg_new,city=cty,highway=hwy)
mpg_new

#파생변수 만들기
df<-data.frame(var1=c(4,3,8),
               var2=c(2,6,1))
df
df$var_sum<-df$var1+df$var2
df
df$var_mean<-(df$var1+df$var2)/2
df
mpg_new$total<-(mpg_new$city+mpg_new$highway)/2
head(mpg_new)
mean(mpg_new$total)
summary(mpg_new$total)
#히스토그램
hist(mpg_new$total)

#합격 판정변수 만들기
mpg_new$test<-ifelse(mpg_new$total>=30,"A",ifelse(mpg_new$total>=20,"B","C"))
head(mpg_new)
table(mpg_new$test)

#막대그래프
library(ggplot2)
qplot(mpg_new$test)

#분석도전
midwest<-as.data.frame(ggplot2::midwest)
midwest<-rename(midwest,total=poptotal,asian=popasian)
midwest$ratio<-midwest$asian/midwest$total
head(midwest)
hist(midwest$ratio)
mean(midwest$ratio)
midwest$test<-ifelse(mean(midwest$ratio)<midwest$ratio,"large","small")
table(midwest$test)
qplot(midwest$test)
 