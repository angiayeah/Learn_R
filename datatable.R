library(data.table)
DT <- data.table(x=rep(c("a","b","c"), each=100), y = rnorm(300))


#quick subset with x value equals to 'a'
setkey(DT,x)
DT['a']


#quickly merge 2 tables
DT1 <- data.table(x=c('a','b','c','d'), y = 1:4)
DT2 <- data.table(x=c('a','c'), z = 1:2)
setkey(DT1,x); setkey(DT2,x)
merge(DT1,DT2)

DTFRAME <-data.frame(DT1)
