pollution <- read.csv("K:/GoogleDrive/R_practice/pm25.csv",  colClasses = c("numeric", "character",
          "factor", "numeric", "numeric"))

head(pollution)
summary(pollution)

boxplot(pollution$pm25)
hist(pollution$pm25)
rug(pollution$pm25)
hist(pollution$pm25, breaks = 100)

boxplot(pollution$pm25)
abline(h = 12)

hist(pollution$pm25)
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")
#multiple boxplot based on region
boxplot(pm25 ~ region, data = pollution, col = "red")

#multiple histograms
par(mfrow = c(2,1))
hist(subset(pollution, region=="east")$pm25, col = "green")
hist(subset(pollution, region=="west")$pm25, col = "green")

par(mfrow = c(1,1))
with(pollution, plot(latitude, pm25, col = region)) #add color based on different regions
abline(h = 12, lwd = 2, lty = 2)

par(mfrow = c(1,2))
with(subset(pollution, region=="west"), plot(latitude, pm25, main = "west"))
with(subset(pollution, region=="east"), plot(latitude, pm25, main = "east"))