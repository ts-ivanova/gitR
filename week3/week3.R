#week3
#Text
#character() creates a vector of strings
PI = paste("The value of pi is", pi)
PI
IR = paste("Just", "Do", "It", sep = ".")
IR
nchar(PI)

#Sets:
set1 = c("some", "random", "few", "words")
set2 = c("some", "many", "none", "few")
intersect(set1, set2)
setdiff(set1, set2)

#Time data
start.date <- as.POSIXct("2004-01-01 00:00", tz = "GMT")
end.date <- as.POSIXct("2004-12-31 23:00", tz = "GMT")

#if(), else() operators
#for(i in 1:n)
#{ ... Body ... }
#while(true)
#{ ... Body ... }

#Functions
perpelet <- function(x)
#{ ... BODY body
#  return(ret)}
x=5
foo=function(a)
{
  x= 4
  return (a+x)
}
foo(2)
x


#tasks
#Shares_price_ts.csv
data = read.csv(url("http://www.math.bas.bg/statlab/tchorbadjieff/Shares_price_ts.csv"))
head(data)
plot(data)
data$Timestamp=as.POSIXct(data$Timestamp)
#convert to datetime object
start.date=as.POSIXct("2012-01-12 12:00:00")
end.date=as.POSIXct("2012-01-12  14:00")
#data[data$Timestamp >= start.date & data$Timestamp<=end.date]

