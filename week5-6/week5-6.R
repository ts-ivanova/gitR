#3.11.2017 
#week5
#Discrete random variables
#Mean and variance:
#mu=Ex=sum(x f_X)
#sigma^2 = sum(x-mu)^2*f_X, sigma - standard deviation


#DISCRETE DRAWINGS WITH SUBSTITUTING
#Binomial distribution: mu=np, sigma^2 = npq

#dbinom - density
#pbinom - distribution function
#qbinom - quantile
#rbinom - random variable generator

#Binomial distribution
x=seq(0,50,by=1)
#probability for success = 0.2:
y=dbinom(x,50,0.2)
plot(x,y)

#Cumulative distribution P(X<=k)=sum(dbinom(c(1:24), 50,1/2)):
y=dbinom(x, 50, 0.5)
plot(x,y)
sum(dbinom(c(1:24), 50, 1/2))
pbinom(24,50,0.5)

#Find a random variable from the distribution - with qbinom():
qbinom(0.4438624, 50, 1/2)
qbinom(0.5561376, 50, 1/2)

#Generate binomial random variables:
rbinom(5,10,0.2)
rbinom(5,100,0.2)


#Negative binomial distribution nbinom()
#Binomial trials until successes = r. (Counts the unsuccessful trials until the r-th success).
#When r=1 -> Geometrical distribution.


#task2
#2 boxes with 50 mateches each
#n=50
#k=100-21=79
#C_(n+n-k)^(n) *(1/2^n)*(1/2^(n-k))
n=50
k=21
(1/(2^(n)))*(1/(2^(n-k)))*choose(n+n-k,n)

choose(100-21, 50)*2^(21-100)
#distribution
dbinom(29, 79, 1/2)


#task3 - negative binomial; head and tales
v1=dnbinom(1,2,1/2)
v1
v2=dnbinom(2,2,1/2)
v2
v3=dnbinom(3,2,1/2)
v3
v4=dnbinom(4,2,1/2)
v4
#so far, n <= 6 6
#for n>=7:
d1=pnbinom(4, 2, 1/2, lower.tail=FALSE)
d1
#on each throw $5, capital $25

#p = 2/5
w1=dnbinom(1,2,2/5)
w1
w2=dnbinom(2,2,2/5)
w2
w3=dnbinom(3,2,2/5)
w3
w4=dnbinom(4,2,2/5)
w4

V=matrix(c(v1, w1, (1-v1), (1-w1), v2, w2, (1-v2), (1-w2), v3, w3, (1-v3), (1-w3), v4, w4, (1-v4), (1-w4)),nrow=4,ncol=4)
V
#This could be done with apply()
#Shift on the odds ratio and on the distriution in x direction


#task4, negative binomial
#basketball player
p=0.7
r=3
qnbinom(1-0.18522,3,0.7)
#2+3=5 minimum number of trials in order for us to have 3 successes.





#DISCRETE DRAWINGS WITHOUT SUBSTITUTING
#Hypergeometric distribution - choose n-"good" and m-"bad" among m+n options
#dhyper(d density, p prob.distr., q quantil, r random distr.)
#example: we have n=N=6, r=36, m=r-N=30
success=c(0:6)
dhyper(success,6,30,6)


#Poisson distribution - a binomial trial with very low probability, for example p<=0.1; np=lambda=const.
ppois(16,lambda=12)

#Odd=p/q (number of successes divided by number of unsuccesses)


#task5 social sample, 100 people among 600000, f=40%, m=60%
#P(F<=35)=?

phyper(35, 0.4*600000, 0.6*600000, 100)
#phyper(35, 0.4*600000, 0.6*600000, 100, lower.tail = FALSE)
pop=rep(c(0,1), c(360000,240000))
mean(pop)
sample(pop, 100)
sum(sample(pop, 100))
sample(pop, 100)
sum(sample(pop, 100))

s=sapply(1:1000, function(x)(sum(sample(pop, 100))))
#s - vector of 1000 randomly distributed samples
s [s<=35]
length(s [s<=35])

#empirical value:
length(s [s<=35])/1000
#Theoretical probability = 0.1794
#Monte-Carlo


#Marginal probabilities - In the joint distribution of X, Y, sum a row and a column and you get marginal probabilities.



#10.11.2017 
#week6
#task6
#6.1 P(X=2)
dpois(2, lambda=10)
#6.2 P(X<2)
ppois(2, 10, lower.tail = FALSE)
#6.3 P(X<=2)
ppois(2, 10)


#task1 Deck of cards, P(5th card is Ace)=? something/C^4_52
choose(47,3)/choose(52,4)
#solve with distributions?


