pr <- read.csv("PATH HERE/pr2.csv")

library(ggplot2)
library(cowplot)
theme_set(theme_classic())
options(scipen=999)

# Population Counts
g <- ggplot(pr, aes(factor(Age_group2,levels=Age_group2), count_us))
g<- g + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="Puerto Ricans in the United States", 
       subtitle="Population Estimates from the ACS", 
       caption="Source: ACS 2011-2015",x="Age Group",y="Total Population")+
  theme(axis.text.x = element_text(angle=45, vjust=0.6))

p <- ggplot(pr, aes(factor(Age_group2,levels=Age_group2), count_pr))
p<-p + geom_bar(stat="identity", width = 0.5, fill="turquoise") + 
  labs(title="Population of Puerto Rico", 
       subtitle="Population Estimates from the PRCS", 
       caption="Source: PRCS 2011-2015",x="Age Group",y="Total Population")+
  theme(axis.text.x = element_text(angle=45, vjust=0.6))

plot_grid(g, p, labels = "AUTO")

#Percent of the Population
a <- ggplot(pr, aes(factor(Age_group2,levels=Age_group2), percent_us))
a<- a + geom_bar(stat="identity", width = 0.5, fill="tomato2") + 
  labs(title="Puerto Ricans in the United States", 
       subtitle="Population Estimates from the ACS",caption="", 
       x="Age Group",y="Percent of the Population")+
  theme(axis.text.x = element_text(angle=90, vjust=0.6))+ ylim(0, 15.5)

m <- ggplot(pr, aes(factor(Age_group2,levels=Age_group2), percent_pr))
m<-m + geom_bar(stat="identity", width = 0.5, fill="turquoise") + 
  labs(title="Population of Puerto Rico", 
       subtitle="Population Estimates from the PRCS", caption="Source: ACS 2011-2015 and PRCS 2011-2015",
       x="Age Group",y="Percent of the Population")+
  theme(axis.text.x = element_text(angle=90, vjust=0.6))+ ylim(0, 15.5)

plot_grid(a, m, labels = "AUTO")