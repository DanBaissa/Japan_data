# Japan 2 -------------------------------------------------

#clear workspace
rm(list = ls())

#packages
library(tidyverse)
library(readxl)
library(gtools)
library(votingpower)

Japan2<-read_excel("JapanClean2.xlsx")

Japan2$LDPCombined<-0

Japan2$LDPCombined[which(Japan2$party_id==1 | Japan2$party_id==1.5)]<-1
summary(Japan2$LDPCombined)

sum(Japan2$ku_voteshare[which(Japan2$LDPCombined==1)])


dist<- unique(Japan2$kucode)

year <- unique(Japan2$year)

Japan2$Test <- 0

Japan2$Test[which(Japan2$kucode == dist[1] & Japan2$year == year[1])] <- sum(Japan2$ku_voteshare[which(Japan2$LDPCombined==1 & Japan2$year == year[1] & Japan2$kucode == dist[1])])

# All that needs to be done now is turn the code in line 28 into a for loop. dist[1] would be replaced with dist[i] and year [1] replaced with year[j].


for (j in 1:length(year)) {
  
  for (i in 1:length(dist)) {
    
    Japan2$Test[which(Japan2$kucode == dist[i] & Japan2$year == year[j])] <- sum(Japan2$ku_voteshare[which(Japan2$LDPCombined==1 & Japan2$year == year[j] & Japan2$kucode == dist[i])])
  
  }
  
}