library(dplyr)
library(ggplot2)

mpg<-as.data.frame(ggplot2::mpg)

ggplot(data=mpg, aes(x=displ,y=hwy))+
  geom_point()+
  xlim(3,6)+
  ylim(10,30)

#혼자서 해보기 188p
#1
ggplot(data=mpg, aes(x=cty,y=hwy))+
  geom_point()
#2
ggplot(data=midwest, aes(x=poptotal,y=popasian))+
  geom_point()+
  xlim(0,500000)+
  ylim(0,10000)

#막대 그래프
df_mpg<-mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))
df_mpg
ggplot(data = df_mpg,aes(x=drv,y=mean_hwy))+
  geom_col()

#크기순 정렬
ggplot(data = df_mpg,aes(x=reorder(drv,-mean_hwy),y=mean_hwy))+
  geom_col()

#빈도 막대
ggplot(data=mpg,aes(x=drv))+geom_bar()
ggplot(data=mpg,aes(x=hwy))+geom_bar()

#혼자서 해보기 193p
#1
data1<-mpg %>% 
  filter(class=='suv') %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
data1
ggplot(data=data1, aes(x=reorder(manufacturer,-mean_cty),y=mean_cty))+geom_col()
#2
ggplot(data=mpg,aes(x=class))+geom_bar()

#시계열 그래프
ggplot(data=economics,aes(x=date,y=unemploy))+
  geom_line()

#혼자서 해보기 195p
#1
ggplot(data=economics,aes(x=date,y=psavert))+
  geom_line()
