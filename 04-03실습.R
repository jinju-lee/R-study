#순서대로 정렬하기
#오름차순
exam %>% arrange(math)
#내림차순
exam %>% arrange(desc(math))

#혼자서 해보기
mpg %>% 
  filter(manufacturer=='audi')%>% 
  arrange(desc(hwy))%>% 
  head(5)

#파생변수 추가하기
exam %>% 
  mutate(total=math+english+science,
         mean=(math+english+science)/3) %>% 
  head
exam %>% 
  mutate(test=ifelse(science>=60,"pass","fail")) %>% 
  head
exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  head

#혼자서 해보기
library(ggplot2)
mpg_new<-mpg 
mpg_new<-mpg_new %>% mutate(sumy=hwy+cty) %>% head
mpg_new<-mpg_new %>% mutate(avery=sumy/2) %>% head
mpg_new %>% 
  arrange(desc(avery)) %>% 
  head(3)
mpg %>% 
  mutate(sumy=hwy+cty, avery=sumy/2) %>%
  arrange(desc(avery)) %>% 
  head(3)

#요약하기
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),
            sum_match=sum(math),
            median_match=median(math),
            n=n())
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

#dplyr조합하기
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

#혼자서 해보기
mpg %>% 
  group_by(class) %>% 
  summarise(cty_ave=mean(cty))
mpg %>% 
  group_by(class) %>% 
  summarise(cty_ave=mean(cty)) %>% 
  arrange(desc(cty_ave))
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(hwy_ave=mean(hwy)) %>% 
  arrange(desc(hwy_ave)) %>% 
  head(3)
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=='compact') %>% 
  summarise(cnt=n()) %>% 
  arrange(desc(cnt))

#가로로 합치기
test1<-data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,85))
test2<-data.frame(id=c(1,2,3,4,5),
                  final=c(70,83,65,95,80))
total<-left_join(test1,test2,by="id")
total

exam
name<-data.frame(class=c(1,2,3,4,5),
                 teacher=c("kim","lee","park","choi","jung"))
name
exam_new<-left_join(exam,name,by="class")
exam_new

#세로로 합치기
group_a<-data.frame(id=c(1,2,3,4,5),
                    test=c(60,80,70,90,85))
group_b<-data.frame(id=c(6,7,8,9,10),
                    test1=c(70,83,65,95,80))
group_all<-bind_rows(group_a,group_b)
group_all

#혼자서 해보기
fuel<-data.frame(fl=c("c","d","e","p","r"),
                 price_fl=c(2.35,2.38,2.11,2.76,2.22),
                 stringAsFactors=F)
fuel
head(mpg)
mpg_new<-left_join(mpg,fuel,by="fl")
mpg_new %>% 
  select(model,fl,price_fl) %>% 
  head(5)

#분석도전
library(ggplot2)
midwest_new<-midwest
midwest_new<-midwest_new %>% mutate(kids_ratio=(total-popadults)/total*100) 
midwest_new %>% 
  arrange(desc(kids_ratio)) %>% 
  select(county,kids_ratio) %>% 
  head(5)
midwest_new<-midwest_new %>% 
  mutate(grade=ifelse(kids_ratio>=40,"large",ifelse(kids_ratio>=30,"middle","small"))) %>% 
  table(midwest_new$grade)
  

