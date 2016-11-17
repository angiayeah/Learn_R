install.packages("XML")
library(XML)
fileURL <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileURL,useInternal = TRUE)
#search in the xml tagged with "price"
prices <- xpathSApply(doc,"//price", xmlValue)