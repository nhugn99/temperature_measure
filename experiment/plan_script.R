> plan <- read.csv("data/plan.csv")
> plan$distance <- as.factor(plan$distance) 
> plot(plan[, c('object', 'distance', 'ambient')], pch=16, cex=0.8, col=plan$distance)
> model <- lm(data = plan, object ~ ambient + distance)
> summary(model)

Call:
lm(formula = object ~ ambient + distance, data = plan)

Residuals:
     Min       1Q   Median       3Q      Max 
-13.7908  -1.0980   0.1544   1.1515   6.8292 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  -126.3554    29.2201  -4.324 2.73e-05 ***
ambient         4.6711     1.1199   4.171 5.03e-05 ***
distance0.08   10.1160     0.6102  16.579  < 2e-16 ***
distance0.25   26.3225     0.6092  43.210  < 2e-16 ***
distance0.6    29.4874     0.6112  48.244  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.724 on 155 degrees of freedom
Multiple R-squared:  0.9534,	Adjusted R-squared:  0.9522 
F-statistic: 793.4 on 4 and 155 DF,  p-value: < 2.2e-16

> #KTc 95% cho cac tham so hoi quy
> confint(model, level=0.95)
                   2.5 %     97.5 %
(Intercept)  -184.076498 -68.634283
ambient         2.458927   6.883342
distance0.08    8.910628  11.321318
distance0.25   25.119128  27.525859
distance0.6    28.280004  30.694765
> #Hieu ung tuong tac giua distance & ambient
> library(car)
> scatterplot(data = plan, object ~ ambient|distance)
> summary(model1 <- lm(data=plan, object ~ ambient * distance))

Call:
lm(formula = object ~ ambient * distance, data = plan)

Residuals:
     Min       1Q   Median       3Q      Max 
-13.1329  -1.0640   0.2157   0.7923   7.4871 

Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
(Intercept)          -342.950     57.081  -6.008 1.33e-08 ***
ambient                12.973      2.188   5.930 1.97e-08 ***
distance0.08          237.894     78.574   3.028 0.002896 ** 
distance0.25          301.923     79.946   3.777 0.000228 ***
distance0.6           374.934     78.768   4.760 4.47e-06 ***
ambient:distance0.08   -8.731      3.013  -2.898 0.004318 ** 
ambient:distance0.25  -10.564      3.064  -3.447 0.000732 ***
ambient:distance0.6   -13.233      3.017  -4.386 2.14e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.577 on 152 degrees of freedom
Multiple R-squared:  0.9591,	Adjusted R-squared:  0.9572 
F-statistic: 509.6 on 7 and 152 DF,  p-value: < 2.2e-16
