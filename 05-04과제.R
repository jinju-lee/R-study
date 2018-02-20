library(dplyr)
data1<-read.csv("2013년_프로야구선수_성적.csv")
data1

data1 %>% 
  select(선수명,팀,경기,타수) %>% 
  filter(타수>400)

data1 %>% 
  select(선수명,팀,경기,타수) %>% 
  filter(타수>400) %>% 
  arrange(타수)

data1 %>% 
  select(선수명,팀,경기,타수) %>% 
  mutate(경기x타수=경기*타수) %>% 
  arrange(경기x타수)

data1 %>% 
  group_by(팀) %>% 
  summarise(average=mean(경기,na.rm = TRUE))
#
data1 %>% 
  filter(경기>=120)
#
data1 %>% 
  filter(경기>=120&득점>=80)
#
data1 %>% 
  filter(포지션 %in% c('1루수','3루수'))
#
data1 %>% 
  select(선수명,포지션,팀)
#
data1 %>% 
  group_by(팀) %>% 
  summarise(경기평균=mean(경기),타수평균=mean(타수))

library(googleVis)
attach(Fruits)
#1
Fruits %>% 
  filter(Expenses>80)
#2
Fruits %>% 
  filter(Expenses>90&Sales>90)
#3
Fruits %>% 
  filter(Expenses>90|Sales>80)
#4
Fruits %>% 
  filter(Expenses==79|Expenses==91)
#5
Fruits %>% 
  select(Fruit:Sales,-Location)
#6
Fruits %>% 
  group_by(Fruit) %>% 
  summarise(Sum=sum(Sales)) %>% 
  filter(!is.na(Sum))
#7
Fruits %>% 
  group_by(Fruit) %>% 
  summarise(Sales=sum(Sales),Profit=sum(Profit)) %>% 
  filter(!is.na(Sales)|!is.na(Profit))
