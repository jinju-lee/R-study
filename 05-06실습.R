#연령대 및 성별 월급 차이

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
#데이터 불러오기
raw_welfare<-read.spss(file="Koweps_hpc10_2015_beta1.sav",to.data.frame = T)
#복사본
welfare<-raw_welfare
#데이터 검토하기
head(welfare)
tail(welfare)
dim(welfare)
#변수명 바꾸기
welfare<-rename(welfare,
                sex=h10_g3,
                birth=h10_g4,
                marriage=h10_g10,
                religion=h10_g11,
                income=p1002_8aq1,
                code_job=h10_eco9,
                code_region=h10_reg7)

#연령대
welfare$age<-2015-welfare$birth+1
welfare<-welfare %>% 
  mutate(ageg=ifelse(age<30,"young",ifelse(age<=59,"middle","old")))
#성별
welfare$sex<-ifelse(welfare$sex==9,NA,welfare$sex)
welfare$sex<-ifelse(welfare$sex==1,"male","female")
table(welfare$sex)
#월급
welfare$income<-ifelse(welfare$income %in% c(0,9999),NA,welfare$income)

#연령대 및 성별 월급 평균표
sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_income=mean(income))
sex_income
#묶음막대그래프
ggplot(data=sex_income,aes(x=ageg,y=mean_income,fill=sex))+geom_col()+scale_x_discrete(limits=c('young','middle','old'))
#성별막대분리
ggplot(data=sex_income,aes(x=ageg,y=mean_income,fill=sex))+geom_col(position = "dodge")+scale_x_discrete(limits=c('young','middle','old'))

#혼자 해보기 231p
#나이 및 성별 월급 평균표
sex_age<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income=mean(income))
sex_age
ggplot(data=sex_age,aes(x=age,y=mean_income,col=sex,fill=sex))+geom_line()+scale_x_discrete(limits=c('young','middle','old'))
