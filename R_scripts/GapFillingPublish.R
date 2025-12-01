####
library(missMDA)

###fill gaps
b<-read.csv2("/Users/...")
#read the data
c<-matrix(as.numeric(unlist(b)),nrow=nrow(b))
c<-c[1:414,2:46]
#impute the missing values
c<-as.data.frame(c)

## Imputation
res.comp <- imputePCA(c,ncp=2)$completeObs
pcs<-prcomp(res.comp, scale=T, center=T)

#structure the data
sum<-summary(pcs)
eof<-pcs$rotation
pc_ts<-pcs$x

#adding the years
rownames(pc_ts)<- c(1600:2013)

#writing the output
write.csv2(sum$importance,"/Users/...")
write.csv2(eof,"/Users/...")
write.csv2(pc_ts,"/Users/...")
