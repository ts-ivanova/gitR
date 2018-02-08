#1.12.17
#week10

#I - false positive - rejecting H_0 by mistake
#II - false negative - false confirmance of H_0 (by mistake)

#Graphical tests for the type of distribution
#Soon - Numerical comparison
#goodness of fit
#tell of independence

#chisq
#t-distr
#F-distr
#Quadratic form for estimations on the data is the dispersion
#chisq is a quadratic form

#How to test hypothesis:
#1. H_0: mu1=m2
#2. H1: mu1 != mu2
#Statistical test, alpha
#alpha = 0.05
#p value <0.05 - reject H_0
#p value >0.05 - confirm/not reject H_0, for example p=0.12

#Independent measurements, cov
#Most variables are normally distributed.
#Tests: 1. for parameters; 2. goodness of fit; 3. type of distribution (normal)

#The easiest way for testing is the graphical way.
#qqline - adjusts the data on some distribution - uses quantiles and is accurate in the "middle" and gives large deviations on the "sides"
y<- rnorm(2000)*4
qqnorm(y); qqline(y, col=2, lwd=2, lty=2)
y<-rnorm(2000)*4 - 4
qqnorm(y)
qqline(y, col=2, lwd=2, lty=2)

y<-rexp(2000.1)
qqnorm(y)
qqline(y, col=2, lwd=2, lty=2)
x <- rpois(2000,1)
y <- rbinom(2000,size=10,prob=1/10)
qqplot(x,y); qqline(y, col = 2,lwd=2,lty=2)
y <- rbinom(2000,size=10,prob=1/2)
qqplot(x,y); qqline(y, col = 2,lwd=2,lty=2)



#3 Statistical Hypothesis Test
#3.1
sexsmoke<-matrix(c(70,120,65,140),ncol=2,byrow=T)
rownames(sexsmoke)<-c("male","female")
colnames(sexsmoke)<-c("smoke","nosmoke")
prop.test(sexsmoke)
prop.test(c(70,65),c(190,205)) 
prop.test(c(70,65),c(190,205),conf.level=0.99)
prop.test(c(70,65),c(190,205),c(0.73,0.33)) 
#p-value is very small => reject the hypothesis that the two proportions are 0,73 and 0.33

#3.2 t-test - when comparing means
#mu0 is what we want to compare, m -after the test
#H_o: mu< 17. pt() calculates p-value
mpg= c(11.4,13.1,14.7,14.7,15.0, 15.5,15.6,15.9,16.0,16.8)
xbar=mean(mpg); s=sd(mpg); n=length(mpg)
SE=s/sqrt(n)
est=(xbar-17)/SE
pt(est,df=n-1, lower.tail=T)
#or directly:
t.test(mpg,mu=17,alt="less") 



#Exercises:
#task1
library(MASS)
quine
tbl=table(quine$Eth, quine$Sex)
tbl
prop.test(tbl)
prop.test(tbl, correct=FALSE)





#15.12.2017
#week11
#example from 3. f-tests
F=3^2/2^2 #F-statistics
F
df(F, 9,14) #p-value; 2nd and 3rd arguments are degrees of freedom, 10-1,15-1 
#we confirm H_0
qf(0.975,9,14)


#task2, page6
#We have 25 measurements
x=c(170, 167, 174, 179, 179, 156, 163, 156, 187, 156, 183, 179, 174, 179, 170, 156, 187, 179, 183, 174, 187, 167, 159, 170, 179)
#Test H_0: mu=170 against the alternativite H_1: mu>170, mu<170
y=t.test(x, mu=170, alternatives="two-sided")
names(y)
y$p.value

#Test H_0: mu=170 against the alternativite H_1: mu>170
t.test(x, mu=170, alternative="greater")
t.test(x, mu=170, alternative="less")
#0.886 less
#0.11... greater


#task3
x=c(7.65, 7.60 ,7.65,7.70, 7.55, 7.55, 7.40, 7.40, 7.50, 7.50)
t.test(x, mu=7.5, alternatives="two-sided")
#H_0 is confirmed (sample is whithin etalon, 95%)
t.test(x, mu=7.5, alternatives="two-sided", conf.level = 0.99)


#task4
#median test - wilcox
x = c(12.8,3.5,2.9,9.4,8.7,0.7,0.2,2.8,1.9,2.8,3.1,15.8)
wilcox.test(x, mu=5, alternative="less", conf.level = 0.95)


#task7

nk=c(229,211,93,35,7,1)
n=sum(nk)
n
#empirical values
r=sum(nk*c(0,1,2,3,4,6))/n
r #mean, rate, Poisson with lambda=0.93

dpois(0,0.93)*n #theoretical value
pk=dpois(0:4, r)*n
pk
pk[6]=n-sum(pk)
pk
#theoretical values

#general statistic chi^2
chi2=sum((nk-pk)^2/pk)
chi2
#chi2 distr, differences between theoretical and experimental values squared, divided by the theoretical value

pchisq(chi2, df=5, lower.tail = FALSE)
#therefore it is indeed Poisson distribution
plot(nk, type="l")
lines(pk)



#WRONG SOLUTION:
chisq.test(table(nk,pk))
table(nk,pk)
#table is wrong
chisq.test(cbind(nk,pk))
#ok
#but in the previous solution chi2 = 1.16! 
#if we removed pk[6] the results would be similar to the previous solution, though


#task5
library(MASS)
survey
#Table - Smoke, Exer. Check for independence
survey$Exer
survey$Smoke
cbind(survey$Exer,survey$Smoke)
tbl=table(survey$Smoke,survey$Exer)
tbl
ctbl=cbind(tbl[,"Freq"], tbl[,"None"]+tbl[,"Some"])
ctbl
#test for independence
chisq.test(ctbl)
#therefore there is a connection (they are dependent)



# 2.12.2017
#week12
x22=rnorm(100,0,1)
y22=rnorm(100,1,2)

t=var.test(x22,y22)
t

xt=c(0.58, 0.42, 0.52, 0.33, 0.43, 0.23, 0.58, 0.76, 0.53, 0.64 )
ks.test(x, "punif")

#Graphical solution
k=qqnorm(morley$Speed)
qqline(morley$Speed)

#Numerical solution
t=ks.test(morley$Speed,"pnorm")
t





