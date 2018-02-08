#week8
#Central limit theorem. Law of large numbers.
qnorm(1-0.05/2)

#Data analysis, variances
 #Graphical:
 #boxplot - graphically find outliers
 q1=qnorm(0.25)
 q2=qnorm(0.5)
 q3=qnorm(0.75)
 lower = q1-1.5*(q3-q1)
 upper = q3+1.5*(q3-q1)
 tmp.list = list(stats=rbind(lower, q1, q2, q3, upper), out=numeric(0), group=numeric(0), names='')
 bxp(tmp.list)
 #quantile with p = 1/2 - median. 
 #upper box 75%. lower box 25%. 
 #outside boxes - outliers.
 

#Measurement errors
#Confidence Intervals (CI), etc.

#Other distributions:
 #Chi-square, t, F
 

 
#Exercises
 
#task1
 s=rbinom(n=10000,size=1000, prob=1/2)
 s
 z=(s-10000*1/2)/sqrt(10000*1/2*1/2)
 z
 hist(s, prob=T)
 hist(z, prob=T)
 #p=1/3
 s=rbinom(n=10000,size=10000, prob=1/3)
 s
 z=(s-10000*1/3)/sqrt(10000*1/3*2/3)
 z
 hist(s, prob=T)
 hist(z, prob=T)
 
 
 
#24.11.2017
#task1 from week8
 x=rbinom(1000,100, 1/2)
 #n - number of trials
 #size - number of observations on each trial
 p_hat = mean(x)/100
 p_hat
 y=p_hat
 #formula CI - (8), week8
 
 z_star = qnorm(1-0.05/2)
 #standard error
 SE=sqrt(p_hat*(1-p_hat)/100)
 SE
 low_CI = p_hat-z_star*SE
 z=low_CI
 low_CI
 high_CI = p_hat+z_star*SE
 h=high_CI
 high_CI
 plot(x/100, type="p", col="gray")
 lines(rep(p_hat, 1000), type="l", col="blue")
 lines(rep(low_CI,1000), type="l", col="red")
 lines(rep(high_CI,1000), type="l", col="red")
 
 
#task3
 #6 measurements of temperature
 x=c(102.5,101.7,103.1,100.9,100.5,102.2)
 sigma=1.2
 #95% conf int is?
 x_hat= (102.5+101.7+103.1+100.9+100.5+102.2)/6
 x_hat=mean(x)
 z_s = qnorm(1-0.05/2)
 z_s
 CI_low = x_hat-z_s*sigma/sqrt(6)
 CI_low
 CI_high = x_hat+z_s*sigma/sqrt(6)
 CI_high
 c(CI_low, CI_high)
 #outliners are
 outL=x[which(x<CI_low | x>CI_high)]
 outL
 
#task4 Michaelson-Morley
 #no sigma, therefore formula 12, week8, and we'll use t-distr
 qnorm(1-0.05/2)
 qt(1-0.05/2, 100 )
 qt(1-0.05/2, 1000 )
 #large numbers, t becomes normal distr
 ?morley
 #experiment for measuring the speed of light
 #CI
 x=morley[,3]
 #s=n-1
 s=sd(x)
 s
 length(morley[,3])
 tstar=qt(1-0.05/2,length(morley[,3]))
 m=mean(morley[,3])
 #95% CI
 lowCI=m-tstar*s/sqrt(100)
 hiCI=m+tstar*s/sqrt(100)
 c(lowCI, hiCI)
 outL=x[which(x<lowCI | x>hiCI)]
 outL
 length(outL)
 #99.7 CI
 tstar=qt(1-0.003/2,length(morley[,3]))
 lowCI=m-tstar*s/sqrt(100)
 hiCI=m+tstar*s/sqrt(100)
 c(lowCI, hiCI)
 outL=x[which(x<lowCI | x>hiCI)]
 outL
 length(outL)
 boxplot(x)
 
 
 