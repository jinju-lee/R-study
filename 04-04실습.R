df<-data.frame(sex=c("M","F",NA,"M","F"),
               score=c(5,4,3,4,NA))
df
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

mean(df$score)
sum(df$score)

df_nomiss<-df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
df_nomiss<-df %>% filter(!is.na(score)&!is.na(sex))
df_nomiss
df_nomiss2<-na.omit(df)
df_nomiss2

exam<-read.csv("csv_exam.csv")
exam[c(3,8,15),"math"]
exam$math
exam

#혼자서 해보기
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"]<-NA

table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(hwy_ave=mean(hwy))
