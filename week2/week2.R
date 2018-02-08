#week2
#Data structures
#Factorization with factor()

#Example:
data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
#Converting:
rdata = factor(data,labels=c("I","II","III"))
levels(fdata) = c('I','II','III')

mons = c("March","April","January","November","January",
            "September","October","September","November","August",
            "January","November","November","February","May","August",
            "July","December","August","August","September","November",
            "February","April")
mons = factor(mons)
Tab=table(mons)
is(Tab)
is(mons)


mons = factor(mons,levels=c("January","February","March",
                               "April","May","June","July","August","September",
                               "October","November","December"),ordered=TRUE)
mons[1] < mons[2]
table(mons)


fert = c(10,20,20,50,10,20,10,50,20)
fert = factor(fert,levels=c(10,20,50),ordered=TRUE)
mean(as.numeric(levels(fert)[fert]))
t=table(mons)
prop.table(t)

#Lists - a data structure that can contain in itself structures of any type.
mylist <- list (a = 1:5, b = "Hi There", c = function(x) x * sin(x))
mylist
mylist[[6]] = c(2,3,4,4,3)
mylist
mylist[[2]][1] 
unlist(mylist)


#Data frames - a list in which all the vectors are of the same size.
n = c(2, 3, 5)
s = c("aa", "bb", "cc")
b = c(TRUE, FALSE, TRUE)
df = data.frame(n, s, b)
df
head(df)
tail(df)


#Input and output
#Input - libraries, datasets with data(), .dat, .txt, .csv, .xlsx ..., SQL, Hadoop, .Rdata
#read functions - scan(), read.table(), read.csv(), ...
#write.table() ...


#Descriptive statistics and graphical representation
#plot(), barplot(), pie(), histogram(), boxplot()
x = c(5, 5, 5, 13, 7, 11, 11, 9, 8, 9)
y = c(11, 8, 4, 5, 9, 5, 10, 5, 4, 19)
boxplot(x,y)


#task1
#1.1
x = list(1, 2, 3, 4)
x2 = list(1:4)
x; x2
#1.2
x = list(1, 2, 3, 4)
x[1]
x[[1]]
  

#task2
data.frame(mtcars)
names(mtcars)
is.data.frame(mtcars)
mtcars[mtcars$cyl==8,] 
#2.1
mean(mtcars[mtcars$gear==5,]$mpg)
median(mtcars[mtcars$gear==5,]$mpg)

  
#task3 MASS package
#3.1
install.packages("MASS")
library("MASS")
data(survey)
head(survey)
attach(survey)
factor(Sex)
factor(Smoke)
factor(Pulse)
table(survey$Sex, survey$Smoke)
#3.1
barplot(table(survey$Sex, survey$Smoke))
names(survey)
#3.2
pie(table(survey$Sex, survey$Smoke))
#3.3
hist(survey[!is.na(survey$Pulse),]$Pulse, probability = TRUE)
t=survey[!is.na(survey$Pulse), ]$Pulse
lines(density(t))
plot(density(survey[!is.na(survey$Pulse),]$Pulse))
#3.4
head(survey)
table(survey$Smoke, survey$Age)
barplot(table(survey$Smoke, survey$Age))
