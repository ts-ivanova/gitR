#week14

#chi-square is used when we have discrete random variables. For the continuous case - histograms.
#t-test - mean and variance
#Kolmogorov-Smirnov 
#Ftest b1=0


#task4
x=c(1.5, 1.7, 2.0, 2.5, 2.5, 2.7, 2.9, 3, 3.5, 3.4, 9.5, 9.5, 3.8, 4.2, 4.3, 4.6, 4, 5.1, 5.1, 5.1, 5.2, 5.3)
y=c(3, 2.5, 3.5, 3, 3.1, 3.6, 3.2, 3.9, 4.0, 4.0, 8.0, 2.5, 4.2, 4.1, 4.8, 4.2, 5.1, 5.1, 5.1, 5.1, 4.8, 5.3)

L=lm(y~x)
L$coefficients
summary(L)
plot(x,y)
abline(L)

residuals(L) #normalized vector of residuals
 
#indexes of elements that are not in the interval [-2,2]
z= c(residuals(L))
b=which(z>2|z<(-2))
x1=x[-c(b)]
x1
y1=y[-c(b)]
y1 
#data without outliers (elements 11,12).
#Plot again and compare:
M=lm(y1~x1)
M$coefficients
summary(M)
plot(x1,y1)
abline(M)


#task6
install.packages("faraway")

library("faraway")
??savings
data(savings)
ks.test(savings$sr, "pnorm", mean=mean(savings$sr), sd= sd(savings$sr))
shapiro.test(savings$sr)


cov(savings$sr, savings$pop15)
cov(savings$sr, savings$pop75)
cov(savings$sr, savings$dpi)
cov(savings$sr, savings$ddpi)
#covariation matrix??

savings.lm=lm(sr~pop15+pop75+dpi+ddpi, data=savings)
summary(savings.lm)

savings.lm15=lm(sr~pop75+dpi+ddpi, data=savings)
summary(savings.lm15)

A=anova(savings.lm, savings.lm15)
#this performs F-tests
#summary.lm15 is better
summary(A)


savings.lm2=lm(sr~pop75+ddpi, data=savings)
summary(savings.lm2)
B=anova(savings.lm15,savings.lm2)
summary(B)


#task6
#H0: b4=b5=0, which means insignificance, alpha=5%
err_ss_full = 615.62

s = 1.513
s_2 = s^2
s_2

err_ss_red = 360.43
#F(2.269) is calculated with qf(2.269)
qf(2.269)

#P(F>3.235)-0.04 - with pf




rm(list = ls())
