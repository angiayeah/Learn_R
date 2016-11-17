library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income|region, data = state, layout = c(4,1))

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

library(datasets)
hist(airquality$Ozone)
#draw plots with different colors and legends
with(airquality, plot(Wind, Ozone, main = "airquality", type = "n"))
with(subset(airquality, Month==5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month!=5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "other months"))

#draw plots and fit with regression line
with(airquality, plot(Wind, Ozone, main = "airquality", pch = 20))
model = lm(Ozone ~ Wind, data = airquality)
abline(model, lwd = 2)

#draw boxplot
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, data = airquality, xlab = "month", ylab = "Ozone")


#draw two scatterplots together
par(mfrow = c(1,2), mar = c(5, 4, 4,2), oma = c(0,0,4,0))
with(airquality, {plot(Wind,Ozone, main = "wind and ozone")
  plot(Solar.R, Ozone, main = "solar and ozone")
  mtext("In a Whole", outer = TRUE)})