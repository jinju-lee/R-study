#09-8.종교 유무에 따른 이혼율

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
#종교
class(welfare$religion)
table(welfare$religion)
#종교 유무 이름 부여
welfare$religion<-ifelse(welfare$religion==1,"Yes","No")
welfare$religion
table(welfare$religion)
qplot(welfare$religion)

#혼인상태
class(welfare$marriage)
table(welfare$marriage)
#이혼 여부 변수 만들기
welfare$group_marriage<-ifelse(welfare$marriage==1,"marriage",ifelse(welfare$marriage==3,"divorce",NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

#종교 유무에 따른 이혼율 표
religion_marriage<-welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion,group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
religion_marriage
religion_marriage<-welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(religion,group_marriage) %>% 
  mutate(pct=round(n/sum(n)*100,1))
#이혼 추출
divorce<-religion_marriage %>% 
  filter(group_marriage=='divorce') %>% 
  select(religion,pct)
divorce
#그래프
religion
ggplot(data=divorce,aes(x=religion,y=pct))+geom_col()
