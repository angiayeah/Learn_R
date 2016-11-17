compare2 <- compare
compare2[,4] <- compare[,4]/6
par(mfrow = c(2,1), mar = c(2,4,2,2))
plot(compare2[,4],col = "blue", type="l", lwd = 2, xlab = "movie index", ylab = "scores", main = "automatic")
plot(compare[,5], col = "red", type = "l", xlab = "movie index", ylab = "scores", main = "manual")
cor(compare2[,4],compare[,5])
