#week4
#merge(A, B, by= Timestamp $or$ Datetime, all=T)
#by.x, by.y. Analog all.x, all.y


#execute code from instructions, p2
mat <- matrix(rep(seq(4), 4), ncol = 4)
#apply() applies a function; returns a vector with the results
#sum, rows:
apply(mat, 1, sum)
#sum, columns:
apply(mat, 2, sum)
apply(mat, 1, function(x) sum(x) + 2)


#lapply - applies a function on a list; returns a list
mat.df = data.frame(mat)
lapply(mat.df, sum)
y = lapply(mat.df, function(x, y) sum(x) + y, y = 5)
lapply(1:5, function(i) print(i))
       
#sapply - applies a function on a vector, matrix or a list; returns a vector, data.frame or a list. When simplity=F, result is the same as with lapply
mat1.df = data.frame(mat1)
sapply(mat1.df, sum)
y2 = sapply(mat1.df, function(x, y) sum(x) + y, y = 5)

#tapply - applies a function on an element of array; returns a vector or a matrix. When simplify=F, tapply returns a list
x1 = runif(16)
cat1 = rep(1:4, 4)
cat2 = c(rep(1, 8), rep(2, 8))
mat2.df = data.frame(x1)
mat2.df$
  cat1 = cat1
mat2.df$
  cat2 = cat2
tapply(mat2.df$
         x1, mat2.df$
         cat2, mean)
#mean values

#aggregation - summation
#aggregation sign, by; aggregate(X, by, fun)
dates = data.frame(date=as.Date("2001-01-01", format="%Y-%m-%d") + 0:729, data=0:729)
last.day = aggregate(x=dates["data"], by=list(month=substr(dates$ date, 1,7)), FUN=max)
last.day = aggregate(x=dates["data"], by = list(month = substr(dates$ date, 1, 7)), FUN=max)
var(x)
tapply(data$Price, data$Volume, mean)
#mean value (EX); var (DX) deviation

table(data$Price, data$Volume)


#task2 center of masses


#task3
A=c(0.1,5,2)
B=c(2,0,1.5) 
C=c(2,1,0.5)
m1=2.5
m2=2.5
m3=5
R=(1/(m1+m2+m3))*(m1*A+m2*B+m3*C)
R

#task4 aggregate by cyl, gear substr(dates$date,1, 7)), FUN = max
mtcars
aggregate(mtcars, by=list(mtcars$cyl, mtcars$gear), FUN = mean)

#table
A=matrix(c(0.125, 0.125, 0, 0, 0, 2/8, 2/8, 0, 0, 0, 1/8, 1/8), nrow=3, ncol = 4, byrow = TRUE)
b=apply(A, 1, FUN=sum)
c=apply(A, 2, FUN=sum)
rbind(A, c)
cbind(A, b)


#task5
data1 = read.table(url("http://www.math.bas.bg/statlab/tchorbadjieff/merge1.dat"))
data2 = read.table(url("http://www.math.bas.bg/statlab/tchorbadjieff/merge2.dat"))

#merge all=TRUE, all.x = true, all=false:  outer joint, left joint, inner joint respectively

M = merge(data1, data2, all=TRUE)
N = merge(data1, data2, all.x =TRUE)
P = merge(data1, data2, all=FALSE)
Q = merge(data1, data2, all.y=TRUE)
Q



rm(list=ls())
