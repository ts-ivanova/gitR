#Homework2, Probability and Statistics
#Tsvetelina Ivanova, 25777, MP-VaS, FMI 2018



#################
#zadacha1
#Proverka na kazino za manipuliranost
#Za celta - binarni opiti.
#Kazinoto se zatvarya, ako zagubite ot razigravaniyata za klientite prehvurlyat chestota ot 2/3 
#pri nivo na doveritelnost ot 90% pri napraveni 500 opita.
#Kakvo shte stane s kazinoto, ako rezultatite ot testa sa 350?
trials=500

significance.level=0.1
P=2/3 #veroyatnost za zaguba pri edin opit
P
R=rbinom(350,500,prob=2/3) #binomno razpredelenie - za uspeh se schita zagubata s veroyatnost 2/3.
R

D=dbinom(R, 500, prob=2/3, log=FALSE)
plot(R,D)
x=c(350,150)

#Intervalna ocenka
#kvantil i standard error pri binom
#srednoto go znaem
#sredno +- z* .SE
#p=pbinom(350, 500, prob=2/3, log=FALSE)
#p
#q= qnorm(350/500, mean=0, sd=1)
#q



#################
#zadacha2
#Imame 25 izmervaniya. Da se proveri analitichno i graficheski dali logaritmite sa normalno razpredeleni s nivo na dostovernost 95%.
#Nuleva hipoteza H_0 e, che x=log(y) e razpredeleno normalno.
y=c(5.46,5.14,7.46,4.67,4.03,5.3,4.71,6.3,5.24,5.6,2.47,4.47,4.81,5.54,3.44,5.19,3.81,5.02,6.49,4.65,4.37,5.7,5.93,6.38,5.79)
x=log(y)
x
mean(x)
is(x)
length(x)

#Analitichen test za normalnost:
S=shapiro.test(x) 
S
alpha=0.05
p.val=S$p.value
p.val>alpha
#Tova oznachava, che nulevata hipoteza ne se othvurlya.
S$statistic
#Izvod: Dannite x=log(y) sa razpredeleni normalno.

#p=pnorm(x)
#plot(x, p)

#Graficheski test se pravi po sledniya vuzmojen nachin:
plot(qqnorm(x), type="p", col="blue")
Q=qqline(x, distribution = qnorm, col=123)



#################
#zadacha3
#Hvurlyat se 7 moneti ednovremenno. Broi opiti br.o = 1536.
#Da se proveri s dostovernost 95% dali monetata e chestna, t.e. p(ezi)=1/2
#X e broi polucheni ezi
#m.i e na kolko moneti suotvetno sa se padnali ezi
br.o=1536
X=c(0,1,2,3,4,5,6,7)
m.i=c(12,78,270,456,386,252,69,13)
sum(m.i)
data=cbind(X, m.i)
data

sum(m.i)

p.i=m.i/br.o #empirichni veroyatnosti
DBINOM = dbinom(X, 7, prob = 0.5)


ChiSq = chisq.test(p.i, DBINOM)
ChiSq
alpha=0.05
pvalue = ChiSq$p.value
pvalue
pvalue>alpha
#Tova pokazva, che monetata e chestna.


#################
#zadacha4
#Imame danni ot izsledvane na pazara na gaz vuv Finlandia
#4.1 Da se analizirat tezi danni 
#i da se prognozira konsumatsiyata na gaz pri vektor ot prediktori p (napisan po-dolu).
data = read.csv(url("http://www.math.bas.bg/statlab/tchorbadjieff/Fin_gas_prices.csv"))
length(data) #imame 7 velichini
data

Y   = (data$Year); Y #year
C   = (data$Consumption); C #consumption
p1  = log(data$Price_1) #gas price
p2  = log(data$Price_2) #gas oil price
p3  = log(data$Price_3) #electricity price
I   = (data$Income) #per capita income
hdd = (data$HDD) #energy index

cor(data)
#Ot korelacionnata matrica se vijda, che Price_1 i Price_2 silno korelirat, zatova premahvame ednoto.

#Test za normalnost pri dannite za konsumaciya:
shapiro.test(C)
alpha=0.05
p.val=S$p.value
p.val>alpha
#tova oznachava, che C e normalno razpredelena


L=lm(C~p2+p3+I+hdd)
summary(L)

L$coefficients
coeff=c(L$coefficients[1],L$coefficients[2], L$coefficients[3],L$coefficients[4], L$coefficients[5], L$coefficients[6])
coeff
#Predictor P
P=c(320,1000,1500,17,5300)
p=7.48835+coeff[1]*P[1]+coeff[2]*P[2]+coeff[3]*P[3]+coeff[4]*P[4]+coeff[5]*P[5]
p

plot(C, p2+p3+I+hdd)
abline(L)
anova(L)


#4.2 Podobrenie na modela:
M1=lm(C~I+p3+hdd)
summary(M1)
plot(C,I+p3+hdd)
abline(M1)

anova(M1)

M2=lm(C~p3+hdd)
summary(M2)
plot(C,p3+hdd)
abline(M2)
anova(M2)

M3=lm(C~hdd)
summary(M3)
plot(C,hdd)
abline(M3)

anova(M3)
#




