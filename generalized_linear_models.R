
### Generalized linear models ###

## Here I compare among a set of candidate models to identify which trait best determines contest success in duels 
## between male monkey beetles Heterochelus chiragricus.

## Male H. chiragricus fight on the disc-shaped flowerheads that both sexes feed and spend most of their adult lives on. These 
## flowerheads act therefore as contest arenas. Once a male has won reproductive access to a female, he will guard her. At the outset
## of each contest, we termed the guarding male as the 'resident' and the incoming competitor as the 'intruder'.


## The traits investigated are:
# Femur shape
# Femur size
# Tibia shape
# Tibia size
# Overall shape (i.e., femur shape and tibia shape)
# Overall size (i.e., femur size and tibia size)
# Body size

## The shape and size measurements were obtained using geometric morphometrics, a landmark-based approach to the measurement
## of form. This approach decomposes form into 'shape' and 'size'. These variables are mathematically independent of one another.
## This allows for the separate investigation of trends in shape and size, their relationship with one another (i.e., multivariate
## allometric scaling), or their variation across populations, amongst other things. Outside of biology, geometric morphometrics
## is also commonly used in archaeology to measure variation in e.g., stone tool artefacts.

## These analyses comprised part of my doctoral thesis work on sexual selection in monkey beetles and the role that this form of
## selection may have played in their diversification in South Africa. 

## My aim with these analyses was to assess whether males' enlarged, sculptured hind legs confer confer a competitive advantage - 
## this would be a pre-requisite for demonstrating that sexual selection does actually occur in monkey beetles.


# Packages
library(tibble)
library(broom)

# Load data
fights<-read.csv("beetle_fights_chiragricus.csv",header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)
fights<-na.omit(fights) # Remove missing values
head(fights) # Check data

# Run candidate models
#1 Femur shape
fshape<-glm(res.win~diff.fpc1+diff.fpc2+diff.fpc3,family=binomial(logit),data=fights)
summary(fshape)

#2 Tibia shape
tshape<-glm(res.win~diff.tpc1+diff.tpc2+diff.tpc3,family=binomial(logit),data=fights)
summary(tshape)

#3 Overall shape
wholeshape<-glm(res.win~diff.tpc1+diff.tpc2+diff.tpc3+diff.fpc1+diff.fpc2+diff.fpc3,family=binomial(logit),data=fights)
summary(wholeshape)

#4 Femur size
fsize<-glm(res.win~logdiff.fcs,family=binomial(logit),data=fights)
summary(fsize)

#* Tibia size
tsize<-glm(res.win~logdiff.tcs,family=binomial(logit),data=fights)
summary(tsize) 

#5 Overall size
wholesize<-glm(res.win~logdiff.tcs+logdiff.fcs,family=binomial(logit),data=fights)
summary(wholesize)

#6 Body length
bsize<-glm(res.win~logdiff.bodlength,family=binomial(logit),data=fights)
summary(bsize)

# Compare model fits
summ.table <- do.call(rbind, lapply(list(fshape, tshape, wholeshape, fsize, tsize, wholesize,bsize), broom::glance))
model.name<-c("femur.shape","tibia.shape","whole.shape","femur.size","tibia.size","whole.size","body.size")
summ.table %>% add_column(model.name,.before="null.deviance")

### CONCLUSIONS ###
## Model femur.size has lowest AIC (Akaike Information Criterion) indicating that it the model that fits the data best
## Looking at the output summary for this model we see that there is a significant effect of femur size on residents winning.
## Since the values input into the model for femur size is actually the relative difference in femur size between competitors,
## we can infer from these results that residents with larger hind femurs relative to their opponents are more likely to win,
## i.e., it is not absolute femur size that is important, but femur size RELATIVE to your opponent.

# Plot
plot(fights$res.win~fights$logdiff.fcs,main="",ylab="Probability of resident winning",xlab="Relative difference in femur centroid size",las=1)
x <- seq(-0.3588946, 0.3938675, length = 131)
y <- predict(fsize, data.frame(logdiff.fcs=x),type="response")
lines(x,y)

# Standard error
y.se<-predict(fsize, data.frame(logdiff.fcs=x),type="response",se.fit=T)
UL<- y + y.se$se.fit*1.96
LL<- y - y.se$se.fit*1.96

# Confidence interval
# transparent red: polygon(c(rev(x),x),c(rev(UL),LL),col=rgb(1,0,0,0.2),border=F)
polygon(c(rev(x),x),c(rev(UL),LL),col=rgb(0.5,0.5,0.5,0.2),border=F) # transparent grey

# Legend for lines
legend(0.1,0.3, legend=c("Intercept","Equal probability"),lty=c(2,3),bty="n")

# Intercept
yval<-predict(fsize,data.frame(logdiff.fcs=0),type="resp")
xmin<-min(fights$logdiff.fcs)
clip(x1=xmin,x2=0,y1=0,y2=yval)
abline(h=yval,v=0,lty=2)

# Equal probability
# Calculating x value corresponding to y = 0.5
findInt <- function(model, value) {
  function(x) {
    predict(model, data.frame(logdiff.fcs=x), type="response") - value
  }
}
equal<-uniroot(findInt(fsize, .5), range(fights$logdiff.fcs))$root

clip(x1=xmin,x2=equal,y1=0,y2=0.5)
abline(h=0.5,v=equal,lty=3)


