library(lattice)
library(datasets)

xyplot(Ozone ~ Wind, data = airquality)
airquality <- transform(airquality, Month = factor(Month))
p <-xyplot(Ozone ~ Wind| Month, data = airquality, layout = c(5,1))
print(p)   #show the plot after print
