date2<-seq(from=as.Date('2018-02-13'),to=as.Date('2018-02-28'),by='day')
date2

vec1<-c(1,6,3,4,5,7)
vec1
vec1[9]<-9
vec1
append(vec1,10)
append(vec1,c(10,11),after=3)

var4<-c(1,2,3,4,5)
var1<-c(1,2,3)

var1+var4
setdiff(var1,var4)
intersect(var1,var4)
union(var1,var4)
length(var1)
nrow(var1)

fruits<-c(10,20,30)
fruits
names(fruits)<-c('apple','banana','peach')
fruits
fruits[1]
names(fruits)

var1
NROW(var1)
#검색연산자
var7<-c(1,3,5,7,9)
3 %in% var7
4 %in% var7
#행렬
mat2<-matrix(c(1,2,3,4),nrow=2)
mat2
mat3<-matrix(c(1,2,3,4),nrow=2,byrow=T)
mat3
mat3[,1]
mat3[1,]
mat3[1,1]
mat3[1,2]
mat4<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,byrow = T)
mat4
mat4<-rbind(mat4,c(11,12,13))
mat4
mat4<-rbind(mat4,c(15,16,17,18))
mat4
mat4<-rbind(mat4,c(19,20))
mat4
mat4<-matrix(c('a','b','c','d'),nrow=2,byrow = T)
mat4
mat4<-cbind(mat4,c('e','f'))
mat4
colnames(mat4)<-c('First','Second','Third')
mat4
names(mat4)<-c('A','B','C','D','E','F')
mat4
#배열
array1<-array(c(1:12),dim=c(4,3))
array1
array2<-array(c(1:12),dim=c(2,2,3))
array2
#list
list1<-list(name='James Seo',
            address='Seoul',
            tel='010-8706-4712',
            pay=500)
list1
list1$name
list1[1:2]
list1$birth<-'1975-10-23'
list1
list1$name<-c('Seojinsu','James Seo')
list1$name
list1
list1$pay<-NULL
list1
