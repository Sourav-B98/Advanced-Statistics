getwd()
library("readxl")
data <- read_excel("Data.xlsx")

anova = aov(X ~ location + pic, data = data)
summary(anova)

fitx = lm(X ~ 0 + location + pic, data = data)
fitx$coefficients

fity = lm(Y ~ 0 + location + pic, data = data)
fity$coefficients

names <- levels(factor(data$location))
df = data.frame(locations = names, x_global = fitx$coefficients[1:58], y_global = fity$coefficients[1:58])

write.csv(df, '/home/nilabja/Desktop/Statistics-2/project/output.csv', row.names = FALSE)


