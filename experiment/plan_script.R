plan <- read.csv("data/plan.csv")
plan$distance <- as.factor(plan$distance) 
plot(plan[, c('object', 'distance', 'ambient')], pch=20, cex=0.8, col=plan$distance)
model <- lm(data = plan, object ~ ambient + distance)
summary(model)
#KTc 95% cho cac tham so hoi quy
confint(model, level=0.95)
#Hieu ung tuong tac giua distance & ambient
library(car)
scatterplot(data = plan, object ~ ambient|distance, smooth = F)
summary(model1 <- lm(data=plan, object ~ ambient * distance))


