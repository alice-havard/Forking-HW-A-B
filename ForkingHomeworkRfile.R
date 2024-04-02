library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)

diamonds2<-diamonds  
class(diamonds2)     #Check class
diamonds2<-as.data.table(diamonds2)  #allows data.table coding to work
diamonds2[cut =="Premium" & price > 7000 & price < 10000 , .(carat, cut, price)][order(-carat)][1:20]
