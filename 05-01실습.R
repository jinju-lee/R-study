library(dplyr)
library(ggplot2)

#이상치 포함 데이터 생성
outlier<-data.frame(sex=c(1,2,1,3,2,1),
                    score=c(5,4,3,4,2,6))
outlier

#빈도 확인
table(outlier$sex)
table(outlier$score)

#결측 처리
outlier$sex<-ifelse(outlier$sex==3,NA,outlier$sex)
outlier
outlier$score<-ifelse(outlier$score>5,NA,outlier$score)
outlier

#결측치 제외하고 분석
outlier %>% 
  filter(!is.na(sex)&!is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))

#상자그림 통계치 출력
mpg<-as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)$stats

#결측 처리
mpg$hwy<-ifelse(mpg$hwy<12|mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy,na.rm = T))

#혼자서 해보기 178p
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)
#1
mpg$drv<-ifelse(!(mpg$drv %in% c(4,'f','r')),NA,mpg$drv)
mpg %>% 
  filter(!is.na(drv))
#2
boxplot(mpg$cty)$stats
mpg$cty<-ifelse(mpg$cty<9|mpg$cty>26,NA,mpg$cty)
mpg %>% 
  filter(!is.na(cty))
boxplot(mpg$cty)$stats
#3
mpg %>% 
  filter(!is.na(drv)&!is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty,na.rm = T))