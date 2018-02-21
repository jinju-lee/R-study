#09-9.지역별 연령대 비율

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

#지역
class(welfare$code_region)
table(welfare$code_region)
#지역 코드 목록
list_region<-data.frame(code_region=c(1:7),
                        region=c('서울',
                                 '수도권(인천/경기)',
                                 '부산/경남/울산',
                                 '대구/경북',
                                 '대전/충남',
                                 '강원/충북',
                                 '광주/전남/전북/제주도'))
#welfare에 지역명 변수 추가
welfare<-left_join(welfare,list_region,id="code_region")
welfare %>% 
  selecr(code_region,region) %>% 
  head

#지역별 연령대 비율표
region_ageg<-welfare %>% 
  count(region,ageg) %>% 
  group_by(region) %>% 
  mutate(pct=round(n/sum(n)*100,2))
head(region_ageg)
#그래프
ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg))+geom_col()+coord_flip()

#노년층 비율 내림차순 정렬
list_order_old<-region_ageg %>% 
  filter(ageg=='old') %>% 
  arrange(pct)
list_order_old
#지역명 순서 변수 만들기
order<-list_order_old$region
order
ggplot(data=region_ageg,aes(x=region,y=pct,fill=ageg))+geom_col()+coord_flip()+scale_x_discrete(limits=order)

#연령대 순으로 막대 색깔 나열하기
class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg<-factor(region_ageg$ageg,level=c('old','midle','young'))
class(region_ageg$ageg)
levels(region_ageg$ageg)
ggplot(data = region_ageg,aes(x=region,y=pct,fill=ageg))+geom_col()+coord_flip()+scale_x_discrete(limits=order)