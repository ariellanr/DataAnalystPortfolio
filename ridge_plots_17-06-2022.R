# Ridge plots

library(ggplot2)
library(ggridges)
library(tidyverse)

# Read in data
data<-read.csv("beetle_leg-component_sizes.csv")
data<-na.omit(data)
head(data)
data$id<-as.factor(data$ï..id)
data$population<-as.factor(data$population)

# Reshape from wide to long
data.long<-gather(data,segment,size,centroid.size_femur:centroid.size_claw,factor_key=TRUE)
head(data.long)

# Plot
all.size<-ggplot(data.long,aes(x=size,y=population,fill=segment)) +
  geom_density_ridges(scale = 1.6, alpha=0.8) + 
  scale_x_continuous(breaks=c(1:10)) +
  scale_y_discrete(limits = rev) +
  labs(x="Size",y="Population",alt=paste("Measured in units centroid size","Nine populations along a latitudinal gradient")) +
  theme_ridges(center_axis_labels = TRUE) +
  theme(axis.text.x=element_text(size=12),axis.text.y=element_text(size=12))

all.size + scale_fill_discrete(name="Hindleg\nSegment",
                               breaks=c("centroid.size_femur", "centroid.size_tibia", "centroid.size_pretarsus","centroid.size_claw"),
                               labels=c("Femur", "Tibia", "Tarsus","Claw")) +
  theme(legend.text=element_text(size=12))

get_alt_text(all.size)