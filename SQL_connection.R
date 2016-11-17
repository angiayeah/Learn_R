install.packages("RMySQL")
library(RMySQL)
ucscdb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscdb, "show databases;")
dbDisconnect(ucscdb)

hg19 <- dbConnect(MySQL(),user="genome",db = "hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
dbListFields(hg19,"affyU133Plus2")  #show the columns of a specific table
dbGetQuery(hg19, "select count(*) from affyU133Plus2")


table <- dbReadTable(hg19, "affyU133Plus2")
head(table)

#when you don't want that big table returned from remote server
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches = 1")
fetch <- fetch(query, n =5) 
quantile(fetch$misMatches)
dbClearResult(query)
dbDisconnect(hg19)
