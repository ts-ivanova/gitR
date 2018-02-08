#1.12.17
#week9

#Covariation Cov=E[(X-EX)(Y-EY)]
#Correlation Cor = Cov/(sqrt(DX)sqrt(DY)) is in interval [-1,1]
#Correlation with empirical data is calculated by using formula (5) in week9.pdf
#In R we calculate Covariation and Correlation by using the functions cov and cor

#Example 1:
#for \rho =1
x=c(1:10)
y=c(1:10)
cor(x,y)
plot(x,y)

#for \rho = -1 - anticorrelation
x=c(1:10)
y=c(10:1)
cor(x,y)
plot(x,y)
plot(y,x)

#for \rho -> 0
x=rnorm(100)
y=rexp(100)
cor(x,y)
plot(x,y)


#Covariational matrix
#multidimensional distributions formula (6)
#v (6), K e kovariacionnata matrica
#Tryabva da instalirame: 
install.packages("mvtnorm")

library(mvtnorm)
x=y=seq(-5,5, length = 50)
f=function(x,y)dmvnorm(cbind(x,y))
z=outer(x,y,f)
persp(x,y,z, theta=10, phi=20, expand=0.5, col="light blue")
persp(x,y,z, theta=10, phi=20, expand=0.5, col="light blue", shade=0.75)
#theta, phi - polar coordinates
persp(x,y,z, theta=5, phi=31, expand=0.5, col="light blue")
persp(x,y,z, theta=5, phi=31, expand=0.5, col="light blue", shade=0.75)


#Exercises:
#task1
iris
iris[-c(5)] #remove the text column
cov(iris[-c(5)])
cor(iris[-c(5)]) #between -1 and 1
#Element on diagonal - dispersion of each variable 
#For example, Sepal.Length.dispersion = 0.68569
#Covariation matrix is symmetrical.
#Joint plot:
pairs(iris[-c(5)])
#down right - strong correlation, up left - weak correlation

#task2 
#Calculate the correlation matrix of the covariation Kz of the vector random variables X=(X1,X2,X3)
M=matrix(c(16,-14,12,-14,49,-21,12,-21,36) , nrow=3, ncol=3)
M
cov2cor(M) #this is the correlation matrix of the covariation.


rm(list=ls())

