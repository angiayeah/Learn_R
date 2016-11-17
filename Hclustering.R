
#this is to set a fake random which can be reproduced
set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x+0.05, y+0.05, labels = as.character(1:12))
data <- data.frame(x=x,y=y)
distxy <- dist(data)

#cluster the points
hClustering <- hclust(distxy)  
plot(hClustering)
plot(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

#Heatmap
set.seed(143)
dataMatrix <- as.matrix(data)[sample(1:12), ]
heatmap(dataMatrix)

set.sead(678910)
dataMatrix <- matrix (rnorm(400), nrow = 40)
for (i in 1:40)
{
  #flip a coin
  coinFlip <- rbinom(1, size = 1, prob = 0.5)
  if (coinFlip)
  {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,3), each = 5)
  }
}
par(mar = rep(0.2, 4))
heatmap(dataMatrix)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
heatmap(dataMatrix)

#kmeans
kmeansObj <- kmeans(data, centers = 3)
names(kmeansObj)
kmeansObj$cluster
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col=1:3, pch = 3, cex =3, lwd = 3)


#grDevice is a good color package
pal <- colorRamp(c("red", blue))