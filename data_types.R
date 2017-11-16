x<-1
print(x)
x
msg<-"hello"
x<-5
x
print(x)
# [1] 5  [1] indicates 5 is 1st element of vector
#make vector
x<-1:20
x
## c function - concatenate
x<-c(0.5,0.6)
x
x<-c(T,F)
x<-c("a","b")
x<-vector("numeric",length=10)
x
#[1] 0 0 0 0 0 0 0 0 0 0
#mix objects 
x<-c(1.7,"a")
x
#[1] "1.7" "a"  - numeric vector 1.7 coerced into character
#explicit coercion
x<-(.6)
class(x)
as.numeric(x)
as.logical(x)
#[1] TRUE
as.character(x)
[1] "0.6"
#return "NA" if coersion fails

#matrices
m<-matrix(nrow=2,ncol=3)
m
dim(m)
attributes(m)
#matrix made column-wise: fill each col 
m<-matrix(1:6,nrow=2,ncol=3)
m
#transform matrix using dim functtion
m<-1:10
m
dim(m)<-c(2,5)#2 rows, 5 col
m

#create matrix by binding columns or rows
#cbind(), rbind()
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)


#Lists
x<-list(1,"a",TRUE,1+41)
x
#> x
#[[1]]   # [[]] denotes list vs vector
#[1] 1

#Factors : categorical data, ordered, unordered
#integer vector, each integer has label: 1-High;2-Med;3-Low
#treated special by modeling functions
#Male, Female

x<-factor(c("yes","yes","no","yes","no"))
x
#> x
#[1] yes yes no  yes no 
#Levels: no yes

table(x)
#x
#no yes 
#2   3 

unclass(x)  # strips out function - converts to integer function
#[1] 2 2 1 2 1
#attr(,"levels")
#[1] "no"  "yes"


#order of levels set: baseline level is 1st level_ determined by alphabetical order
# if (yes, no) then No will be first
#you can set this w/ levels function

x<-factor(c("yes","yes","no","yes","no"),levels=c("yes","no"))
x

#Missing Values
is.na()#test if objects are NA
is.nan() #test for undefined math operations

x<-c(1,2,NA,10,3)
x
is.na(x)
#[1] FALSE FALSE  TRUE FALSE FALSE

## Data Frames
#tabular data
#list, every element has same length
##!! each element of listt thought of as a column, and lenght of each element of the list is the numeber of rows
# Table - each column has same length
#can be different objects
#Attributes: row.name; 
#create by calling read.table(), read.csv()
#convert to matrix: data.matrix()

x<-data.frame(foo=1:4,bar=c(T,T,F,F))# have to be same length (#rows)
x
# foo   bar
#1   1  TRUE
#2   2  TRUE
#3   3 FALSE
#4   4 FALSE
nrow(x)
ncol(x)


#R objects can have names - "readable code"
x<-1:3
names(x)
names(x)<-c("foo","bar","norf")
x
#> x
#foo  bar norf 
#1    2    3 

#lists can have names:
x<-list(a=1,b=2)
x

#matrices can have names (dimnames)
m<-matrix(1:4,nrow=2,ncol=2)
dimnames(m)<-list(c("a","b"),c("c","d"))
m
#> m
#c d
#a 1 3
#b 2 4
