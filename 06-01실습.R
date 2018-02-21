#09-7.성별 직업 빈도

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

#성별
welfare$sex<-ifelse(welfare$sex==9,NA,welfare$sex)
welfare$sex<-ifelse(welfare$sex==1,"male","female")
table(welfare$sex)
#직업
#직업분류코드 목록 불러오기
list_job<-read_excel("Koweps_Codebook.xlsx",col_names = T,sheet = 2)
welfare$code_job
head(list_job)
dim(list_job)
#직업명 결합
welfare<-left_join(welfare,list_job,id='code_job')
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)

#성별 직업 빈도표
#남성 직업 빈도 상위 10개 추출
job_male<-welfare %>% 
  filter(!is.na(job)&sex=='male') %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_male
#남성 직업 빈도 상위 10개 추출
job_female<-welfare %>% 
  filter(!is.na(job)&sex=='female') %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_female

#그래프
#여성
ggplot(data = job_female,aes(x=reorder(job,n),y=n))+geom_col()+coord_flip()
#남성
ggplot(data = job_male,aes(x=reorder(job,n),y=n))+geom_col()+coord_flip()