#조건에 맞는 데이터 출력
library(dplyr)
exam<-read.csv("csv_exam.csv")
exam
exam %>% filter(class==1)
exam %>% filter(class==1&math>=50)
exam %>% filter(math>=90|english>=90)
exam %>% filter(class %in% c(1,3,5))

#추출한 행으로 데이터
class1<-exam %>% filter(class==1)
class2<-exam %>% filter(class==2)
mean(class1$math)
mean(class2$math)

#혼자서 해보기
#1
car1 <-mpg %>% filter(displ<=4)
car2 <-mpg %>% filter(displ>=5)
mean(car1$hwy)
mean(car2$hwy)
#2
car3 <-mpg %>% filter(manufacturer=='audi')
car4 <-mpg %>% filter(manufacturer=='toyota')
mean(car3$cty)
mean(car4$cty)
#3
car5 <-mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda'))
mean(car5$hwy)

#filter+select
exam %>% filter(class==1) %>% select(english)
exam %>% 
  filter(class==2) %>% 
  select(math)

#혼자서 해보기
#1
test<- mpg %>% select(class,cty) %>% head(10)
test
#2
suv<-test %>% filter(class=='suv')
mean(suv$cty)
compact<-test %>% filter(class=='compact')
mean(compact$cty)
