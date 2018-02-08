#5.1.2018
#week13

#numerical comparison of theoretical results with experimental results.
#parameter comparison
#lm(y~x1+x2+x3+...+xn) /linear model
#coeff b0, b1 are calculated with method of least squares
#regression line abline(lm())
#works only for normally distributed data

#task1
xi=c(2,-6,7)
yi=c(3,4,6)
table=rbind(xi, yi)
table
r=cor(xi,yi)
sx=sd(xi)
sx
sy=sd(yi)
sy
b1=r*(sy/sx)
b1

b0=mean(yi)-b1*mean(xi)
b0
#so far - how it's calculated
#directly with lm()
l=lm(yi~xi)
plot(xi,yi)
abline(l)

summary(l)

names(l)

#access elements:
l$coefficients
l$residuals


#task2
x=c(-2,-1,0,1,2)
y=c(4,1,0,1,4)

L=lm(y~x)
plot(x,y)
abline(L)
cor(x,y)
L$coefficients

x1=x^2 #syntax in R. Ok if we type lm(y~I(x^2))
M=lm(y~x1)
plot(x1,y)
abline(M)
cor(x1,y)
M$coefficients

lm(y~I(x^2))

summary(lm(y~x))
summary(lm(y~I(x^2)))


#task3 Statistics for physisists book
x=c(0,4,10,15,21,29,36,51,68)
y=c(66.7,71,76.3,80.6,85.7,92.9,99.4,113.6,125.1)
L=lm(y~x)
L$coefficients
plot(x,y)
abline(L)
summary(lm(y~x))

#reject H_0, because Pr(>|t|) is almost 0.
#therefore the parameter is of significance
#max **** - for how good the test actually is
#conf int is 67.5+-1.96*0.5

#func coeff(summary(L)) returns table with coeff
coef(summary(L))
C=coef(summary(L))[,2] #errors
C
D=coef(summary(L))[,1]
D
D+1.96*C
D-1.96*C

#T = 98 C temperature
y1=67.508+0.8706*98
y1 #this is how a prediction is made

#or 2nd way:
C1=coef(summary(L))[,2][1]
C1
D1=coef(summary(L))[,1][1]
D1
q=qnorm(1-0.05/2)
q
a=D1+C1*q
b=D1-C1*q
vec=c(a,b)
vec

C1=coef(summary(L))[,2][2]
C1
D1=coef(summary(L))[,1][2]
D1
q=qnorm(1-0.05/2)
a=D1+C1*q
b=D1-C1*q
vec=c(a,b)
vec
