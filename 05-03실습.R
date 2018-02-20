#성별에 따른 월급 차이

#install.packages("foreign")
#install.packages("readxl")
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

#이름 변경
#sex=h1001_4(성별: 1.남 2.여 9.모름/무응답)
#birth=h1001_5(태어난 연도 ~년 9999.모름/무응답)
#marriage=h1001_11(혼인상태: 0.비해당(18세 미만) 1.유배우 2.사별 3.이혼 4.별거 5.미혼(18세이상, 미혼모포함) 6.기타(사망 등) 9.모름/무응답)
#religion=h1001_12(종교: 1.있음 2.없음 9.모름/무응답)
#income=p1002_8aq1(일한달의 월 평균 임금 (1~9998)만원 9999.모름/무응답)
#code_job=h10_eco9(직종)
#code_region=h10_reg7(7개 권역별 지역구분: 1.서울 2.수도권(인천/경기) 3.부산/경남/울산 4.대구/경북 5.대전/충남 6.강원/충북 7.광주/전남/전북/제주도 )

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
#변수 검토하기
class(welfare$sex)
table(welfare$sex)
#9 응답 처리
welfare$sex<-ifelse(welfare$sex==9,NA,welfare$sex)
table(is.na(welfare$sex))
#성별 항목 이름 부여
welfare$sex<-ifelse(welfare$sex==1,"male","female")
table(welfare$sex)
qplot(welfare$sex)
#월급
#변수 검토하기
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income)+xlim(0,1000)
#이상치 결측 처리
welfare$income<-ifelse(welfare$income %in% c(0,9999),NA,welfare$income)
table(is.na(welfare$income))

#성별 월급 평균표
sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income=mean(income))
sex_income
#그래프
ggplot(data=sex_income,aes(x=sex,y=mean_income))+geom_col()
