library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)

#convert to json
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

#go back to Json again
iris2 <- fromJSON(myjson)
