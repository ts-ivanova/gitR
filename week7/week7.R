#10.11 
#week7

#Example: Generate 100 uniformly distributed random numbers.
x=runif(100,0,2)
hist(x, probability = TRUE, col=gray(.9), main="uniform on [0,2]")
curve(dunif(x,0,2),add=T)

#negative binomial - counts the number of failiures until we have a fixed number of successes.
#Exp distribution - continuous; Poisson distribution - discrete.
#Exponential distribution is a Poisson distribution with k=0
#(exp - when calculating the necessary time.)

#Example - light bulb
x=rexp(100,1/2500)
hist(x, probability = TRUE, col=gray(.9), main="exponential mean=2500")
curve(dexp(x,1/2500), add=T)


#Gauss/ Normal distribution N(mu, sigma^2), 
#sigma^2 - variance, sigma - standard deviation 
#N(0,1) - standard normal distribution

x=c(1:200)
plot(dnorm(x,100,10), ylim=c(0,0.1))
lines(dnorm(x,100,5), col="red")
lines(dnorm(x,130,10), col="blue")
#mu, sigma^2
#Transformation (from normal to standard normal distr): (X_i-mu)/sigma



#task 1
#Basketball player - geometrical distribution
Y=0:10
plot(Y, dgeom(Y, 1/3), type="l", col="green", ylim = c(0,1))
lines(dgeom(Y, 2/3), col="red")
lines(dgeom(Y, 1/2), col="blue")


#task2
#Fix an automobile; exp distr
#lambda=1/5
#Calculate P(X<=30)
X=1:30
pexp(30,1/5)
1-pexp(30,1/5)
plot(X, 1-pexp(X, 1/5), type="l", col="blue", xlim=c(0,31))
plot(X, dexp(X, 1/5), type="l", col="blue", xlim=c(0,31))


#task3
x=rnorm(500,5,sqrt(5))
hist(x, col=gray(.9), main="N(5,5)")
z=(x-5)/sqrt(5)
hist(z, col=gray(.9), main="N(5,5)")


#task4
#Z=N(0,1)
pnorm(z)
#z>0.92
pnorm(0.92, lower.tail = FALSE)
#z<0.92
pnorm(0.92, lower.tail = TRUE)
#z>-0.5
pnorm(-0.5, lower.tail = FALSE)
pnorm(0.5)
#normal distr is symmetrical
#P(-0.64<z<0.43):
a=pnorm(-0.64, lower.tail = FALSE)
b=pnorm(0.43, lower.tail = TRUE)
p=a-(1-b)
p


#task5
pnorm(6.2, 3,2, lower.tail = TRUE)


#task6
pnorm(3100, 3500,500, lower.tail = TRUE)


#task7
x1=pnorm(80,10)
y1=pnorm(78,13)
pnorm(x1-y1>0, 2, sqrt(269), lower.tail = FALSE)
#x1=N(mu1, sigma1^1); y1=N(mu2, sigma2^2)
#for independent x1, y1: x1-y1 = N(mu1-mu2, sigma1^2+sigma2^2)
sqrt(10^2+ 13^2)
sqrt(269)

