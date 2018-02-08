#homework1, R statistics, Tsvetelina Ivanova, Magisturska programa po Veroyatnosti i Statistika

#zadacha za n kletki s k>n topcheta
#Bernoulli trials until success
#Bose-Einstein distribution


x=(-20000:100000)/1000 #energiya, zaviseshta ot impulsa
mean(x) #sredna stoynost za energiyata da e 40, kakto e zadadeno i v statiyata.
length(x)
z=(0:2000000)/1000 #velichina, izpolzvana po-dolu za plot-vane na exp distr za sravnenie
y=0:200 #velichina, izpolzvana za plot(dgeom)

l=(0:20000)/1000 #l e nomer na energetichnoto nivo
mean(l)
length(l)
n=(0:20000)/1000 #n e broi chastitsi
mean(n)
length(n)

n_i = 1/(exp(x)-1) #razpredelenie na broya chastitsi v zavisimost ot energiyata.
#n_40 = 1/(exp(40)-1)
length(n_i)
#Vijda se, che chastitsite se stremyat kum osnovno sustoyanie, t.e. nai-mnogo sa tezi s minimalna energiya.
plot(x, n_i, type="l", col="blue", xlim=c(0,10), ylim = c(0,10), main="Зависимост на броя частици от енергията", xlab="Енергия", ylab = "Брой частици")

#n1=abs(rnorm(10000,0))/2
#p_n1 = (n_40)^n1/(1+n_40)^(n1+1)

p_n = ((n)^l)/((1+n)^(l+1)) #p_n - veroyatnost
p_n_10_5 = ((10)^5)/((1+10)^(5+1))
p_n_10_5 #test veroyatnost za 10 chastici v 5-to nivo


plot(n, p_n, type="l", col="blue", xlim=c(0,10), ylim = c(0,1), main = "B-E in blue, Geom in red, Exp in green")
lines(dgeom(y, 0.59), type="l", col="red", xlim=c(0,10), ylim=c(0,1))
lines(z, dexp(z,0.9),type="l", col="dark green", xlim=c(0,10), ylim=c(0,1))

