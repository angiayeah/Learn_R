library(ggplot2)

#95% confidence is in the grey zone
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
qplot(displ, hwy, data = mpg) + geom_smooth(method = "lm")   #smooth with linear model
qplot(displ, hwy, data = mpg, color = drv) + geom_smooth(method = "lm") 
qplot(hwy, data = mpg, fill = drv)

# .~ means only column,not specifying the rows, ~. means only specifiying the rows not columns
qplot(displ, hwy, data = mpg, facets = .~drv) + geom_smooth(method = "lm")
qplot(hwy, data = mpg, facets = drv~.)

qplot(displ, hwy, data = mpg, shape = drv, color = drv)

#another way to do things
g <- ggplot(mpg, aes(displ, hwy))
g + geom_point()
g + geom_point() + geom_smooth(method = "lm")
g + facet_grid(.~drv) + geom_point() + geom_smooth(method = "lm") + xlab(expression("hello" *PM[2.5])) + ggtitle("My Graph") + theme_gray()
g + geom_point(color = "steelblue", size = 4, alpha = 0.5) 
g + geom_point(aes(color = drv), size = 4, alpha = 0.5) + labs(x = expression("hello " *PM[2.5]))

#change smooth
g + geom_point(color = "steelblue", size = 4, alpha = 0.5) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE) + theme_bw()

#set y limitation
g + geom_line() + ylim(10, 30)  #datas exceeds the limit will be removed
g + geom_line() + coord_cartesian(ylim = c(10,30))  #this will include the datas which exceeds the limit

#cutpoints
cutpoints <- quantile(mpg$hwy, seq(0,1,length=4), na.rm = TRUE)
mpg$cut <- cut(mpg$hwy, cutpoints)
levels(mpg$cut)


