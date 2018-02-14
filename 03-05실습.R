#파일 이름 확인하기
list.files()
list.files(recursive = T)
list.files(all.files = T)

#숫자, 문자 입력받기
input<-scan()
input
input2<-scan(what = "")
input2

#한 줄 읽어 들이기
input3<-readline()
input3
input4<-readline("Are you OK?:")
input4

#파일 읽어 들여서 배열에 담
input5<-readLines('scan_4.txt')
input5

#주석, 공백 자동제거
fruit2<-read.table('fruits_2.txt')
fruit2
fruit2<-read.table('fruits_2.txt',skip=2)
fruit2

#라벨명을 수동으로 지정
label<-c('NO','NAME','PRICE','QTY')
fruit4<-read.csv('fruits_4.csv',header = F,col.names = label,stringsAsFactors = F)
fruit4
class(fruit4$NAME)
write.csv(fruit4,file = 'f.csv')

#원하는 데이터를 SQL 쿼리로 불러오기
install.packages("googleVis")
install.packages("sqldf")
library(googleVis)
library(sqldf)
Fruits
write.csv(Fruits,'Fruits_sql.csv',quote = F,row.names = F)
fruits_2<-read.csv.sql("Fruits_sql.csv",sql="SELECT*FROM file WHERE Year=2008")
fruits_2
fruits_3<-read.csv.sql("Fruits_sql.csv",sql="SELECT*FROM file WHERE Location='West'")
fruits_3
fruits_4<-read.csv.sql("Fruits_sql.csv",sql="SELECT*FROM file WHERE Sales>90")
fruits_4

#엑셀 파일 불러오기
install.packages("readxl")
library(readxl)
df_exam<-read_excel('excel_exam.xlsx')
df_exam
mean(df_exam$english)
mean(df_exam$science)

#엑셀 파일 첫번째 행이 변수명이 아니라면?
df_exam_novar<-read_excel("excel_exam_novar.xlsx",col_names = F)
df_exam_novar

#엑셀 파일에 시트가 여러 개 있다면?
df_exam_sheet<-read_excel("excel_exam_sheet.xlsx",sheet=3)
df_exam_sheet

#클립보드의 내용을 사용해서 데이터 프레임 생성하기
fruits6<-read.delim("clipboard",header = T)
fruits6

#write.table() 함수로 파일에 저장하기
write.table(fruits6,'fruits6.txt')
fruits6_2<-read.table('fruits6.txt',header = T)
fruits6_2

#excel 파일 형식으로 저장하기
install.packages("WriteXLS")
library(WriteXLS)
name<-c("Apple","Banana","Peach")
price<-c(300,200,100)
item<-data.frame(NAME=name,PRICE=price)
item
WriteXLS("item","item.xls")#Perl 있어야 진행

#RData 파일 활용하기
save(fruits6,file = "fruits6.rda")
rm(fruits6)
fruits6
load("fruits6.rda")
fruits6
