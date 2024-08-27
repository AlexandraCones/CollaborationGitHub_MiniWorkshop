#### SHH HE IS SLEEPING ######

      |\      _,,,---,,_
ZZZzz /,`.-'`'    -.  ;-;;,_
     |,4-  ) )-,_. ,\ (  `'-'
    '---''(_/--'  `-'\_)  



 ^ ^
(O,O)
(   )
-"-"---dwb-
  
  

#Open the raw data
data=read.csv("data/raw/Example.csv",header=T)


#Create a new column in data using a function. You can edit this function to make whatever you want
myfunction=function (x,y){
  
  return( x +1.5*y)
  
}

data$zdata=myfunction(data$xdata,data$ydata)

#Export the new data
write.csv(data, "data/extracted/data_BC.csv",row.names=F)

#Plot the data
pdf (file="outputs/plots/Plot_BC.jpeg")
plot(data$zdata~data$xdata,type="l", col="seagreen",lwd=2, ylab="z", xlab="x")
dev.off()

#Run a linear model and save it as an object
mod=lm(data$zdata~data$ydata)
summary(mod)
saveRDS(mod, "outputs/models/Model_BC.rds")

#Export the summary table
estimates=summary(mod)$coef
write.csv(estimates,"outputs/tables/Estimates_BC.csv")
