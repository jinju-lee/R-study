#직업별 월급 차이

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
#월급
welfare$income<-ifelse(welfare$income %in% c(0,9999),NA,welfare$income)
#직업분류코드 목록 불러오기
list_job<-read_excel("Koweps_Codebook.xlsx",col_names = T,sheet = 2)
head(list_job)
dim(list_job)
#직업명 결합
welfare<-left_join(welfare,list_job,id='code_job')
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)
#직업별 월급 평균표
job_income<-welfare %>% 
  filter(!is.na(job)&!is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income=mean(income))
head(job_income)
#상위 10개 추출
top10<-job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10
ggplot(data=top10,aes(x=reorder(job,mean_income),y=mean_income))+geom_col()+coord_flip()
