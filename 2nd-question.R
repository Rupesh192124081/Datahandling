id<-c(1,2,3,4,5)
age<-c(25,30,35,28,40)
score<-c(4,5,3,4,5)
data<-data.frame(id,age,score)
data
hist(age,main = "Customer feedback analysis",col="red")
pie(score,main="Customer feedback analysis",col = rainbow(length(x)))

library(RColorBrewer)  
age<-c(25,30,35,28,40)
score<-c(4,5,3,4,5)
Values <- matrix(c(21,32,33,14,95,46,67,78,39,11,22,23,94,15,16),
                 nrow = 3, ncol = 5, byrow = TRUE)
color=c("cadetblue3","deeppink2","goldenrod1")
barplot(Values, main = "Total Revenue", names.arg = score, xlab = "Month",
        ylab = "Revenue", col =color)  
legend("topleft",age,cex = 1.3,fill=color)