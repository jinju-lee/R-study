#혼자해보기 - 연령대 및 종교 유무에 따른 이혼율 분석

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
welfare$religion<-ifelse(welfare$religion==1,"Yes","No")
#혼인상태
welfare$group_marriage<-ifelse(welfare$marriage==1,"marriage",ifelse(welfare$marriage==3,"divorce",NA))
#이혼 추출
divorce<-ageg_marriage %>% 
  filter(group_marriage=='divorce') %>% 
  select(ageg,pct)

#연령대
welfare$age<-2015-welfare$birth+1
welfare<-welfare %>% 
  mutate(ageg=ifelse(age<30,"young",ifelse(age<=59,"middle","old")))
welfare$ageg

#연령대 별 이혼율 표
ageg_marriage<-welfare %>% 
  filter(!is.na(ageg_marriage)) %>% 
  count(religion,ageg,ageg_marriage) %>% 
  mutate(pct=round(n/sum(n)*100,1))
#연령대 별 이혼율 그래프
ageg_divorce<-ageg_marriage %>% 
  filter(ageg!="young"&group_marriage=="divorce") %>% 
  select(ageg,pct)
ageg_divorce
ggplot(data = ageg_divorce,aes(x=ageg,y=pct))+geom_col()

#연령대 및 종교 유무에 따른 이혼율 표
 ageg_religion_marriage<-welfare %>% 
   filter(!is.na(group_marriage)&ageg!='young') %>% 
   group_by(ageg,religion,group_marriage) %>% 
   summarise(n=n()) %>% 
   mutate(tot_group=sum(n)) %>% 
   mutate(pct=round(n/tot_group*100,1))
ageg_religion_marriage
#연령대 및 종교 유무별 이혼율 표
df_divorce<-ageg_religion_marriage %>% 
  filter(group_marriage=="divorce") %>% 
  select(ageg,religion,pct)
df_divorce

#그래프
ggplot(data=df_divorce,aes(x=ageg,y=pct,fill=religion))+geom_col(position = "dodge")
