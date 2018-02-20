#나이와 월급의 관계

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

#변수 검토하기
class(welfare$birth)
#이상치 확인
summary(welfare$birth)
qplot(welfare$birth)
#결측치 확인
table(is.na(welfare$birth))
#이상치 결측 처리
welfare$birth<-ifelse(welfare$birth==9999,NA,welfare$birth)
table(is.na(welfare$birth))
#파생변수 만들기-나이
welfare$age<-2015-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)
#나이 월급 평균표
age_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))
head(age_income)

#선그래프
ggplot(data=age_income,aes(x=age,y=mean_income))+geom_line()

#연령대에 따른 월급 차이

#파생변수 만들기
welfare<-welfare %>% 
  mutate(ageg=ifelse(age<30,"young",ifelse(age<=59,"middle","old")))
table(welfare$ageg)
qplot(welfare$ageg)
#연령대별 월급 평균표
ageg_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income=mean(income))
ageg_income
#막대 정해진 순서로 정렬
ggplot(data=ageg_income,aes(x=ageg,y=mean_income))+geom_col()+scale_x_discrete(limits=c('young','middle','old'))

