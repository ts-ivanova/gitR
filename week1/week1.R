#week1, Probability and Statistics with R
#Introduction
#R is a script language. Environment - C/C++, Fortran.
rm(list=ls())
help()
sessionInfo()
install.packages("UsingR")
library("UsingR")
?UsingR
??UsingR
ls()
#R is used mostly for statistical data analysis.
#check data type: is(x); define as type, for example as.numeric(x)


#task1
v=matrix(c("a", "b", "c", "2", "2", "3"), TRUE)
is.matrix(v)

#task2
mat1 = matrix(1:6, 2)
mat2 = matrix(c(rep(1, 3), rep(2, 3)), 2, byrow = T)
mat1; mat2
solve(mat1[, 2:3]) #inverse matrix of the matrix that consists of 2nd and 3rd column of mat1
m=matrix(c(3,5,4,6), 2, byrow=TRUE)
m
solve(m)
mat1*mat2
mat1 %*%  t(mat2)


#task3 vector y;
y = c(8,3,8,7,15,9,12,4,9,10,5,1)
M = matrix(c(8,3,8,7,15,9,12,4,9,10,5,1), 6, 2, TRUE)
dimnames(M) = list(c("1","2","3","4","5","6"), c("c1", "c2"))
min(M)
max(M)
?runif
rbind(M,runif(2, min=1, max=20))
dim(M)
M[,"c2"]*2
M+6

#task4
#n=10 coin throws.
n=10
mu = sample(1:10, 10)
nu=mu/10
P=choose(n, mu)/2^10
P
N=matrix(c(nu, P), 10, 1)
is.matrix(N)
N
#rbind(N,nu)
Q=matrix(cbind(N,P), 10,2)
Q
dimnames(Q) = list( c("row1", "row2", "row3", "row4", "row5", "row6", "row7", "row8", "row9", "row10"),  c("x", "y")) 
plot(N, P, type = "p", pch = NULL,
        col = 1, cex = NULL, bg = NA,
        xlab = NULL, ylab = NULL, xlim = NULL, ylim = NULL)

