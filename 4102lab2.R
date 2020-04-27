#Experiment notes#
#Protein A column will bind to IgG inside bovine serum 
#Desalt column will further purify IgG
#Equilibration buffer -> Rinse + prepare the environment within the column
#Tris-Cl buffer + Distill water + ethanol --> Rinse column 
#Dilution buffer --> 2 fold dilution for ODI.


#Data entry - IgG isolation from Fetal calf serum #
Fraction <- c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0)
Volume <- c(1,2,3,4,5,6,7,8,9,10)
gp1A280 <- c(0.029,0.008,0.072,0.113,0.053,0.026,0.015,0.014,0.035,0.011)
gp2A280 <- c(0.004,0.005,0.069,0.223,0.080,0.044,0.005,0.005,0.004,0.004)
gp3A280 <- c(0.015,0.018,0.139,0.032,0.014,0.013,0.014,0.015,0.020,0.015)


Group1 <- data.frame(Fraction,Volume,gp1A280)
Group2 <- data.frame(Fraction,Volume,gp2A280)
Group3 <- data.frame(Fraction,Volume,gp3A280)

#get highest concentration fraction for 2-fold serial dilution#
max1A280<-max(gp1A280)
max2A280<-max(gp2A280)
max3A280<-max(gp3A280)


#Data visualization - Absorption against fraction# 
library(ggplot2)
#Group 1
p1 <- ggplot (Group1, aes (x = Fraction, y = gp1A280)) + 
ggtitle("Group 1 Absorption against Fraction") + xlab("Fraction") + ylab ("Absorption (A280)") +
geom_point() + scale_x_continuous(breaks = c(1:10)) + scale_y_continuous(breaks = c(0.025,0.05,0.075,0.1,0.125,0.15)) +
geom_line (mapping = aes(color = "Red"))

#Group 2
p2 <- ggplot (Group2, aes (x = Fraction, y = gp2A280)) + 
  ggtitle("Group 2 Absorption against Fraction") + xlab("Fraction") + ylab ("Absorption (A280)") +
  geom_point() + scale_x_continuous(breaks = c(1:10)) + 
  geom_line (mapping = aes(color = "Red"))

#Group 3
p3 <- ggplot (Group3, aes (x = Fraction, y = gp3A280)) + 
  ggtitle("Group 3 Absorption against Fraction") + xlab("Fraction") + ylab ("Absorption (A280)") +
  geom_point() + scale_x_continuous(breaks = c(1:10)) + scale_y_continuous(breaks = c(0.025,0.05,0.075,0.1,0.125,0.15)) + 
  geom_line (mapping = aes(color = "Red"))

#Plot Graph
p1
p2
p3

#Data analysis - Calculate concentration of IgG from max(absorbption)
#Beer's law: A = epsilon (extinction coef.) * b(path length) * c (analyte concentration)
#Hence C = A/(episilon * b) * dilution factor

gp1conc <- round((max1A280/(1.33*1*1)),3)
gp1yield <- gp1conc*1

gp2conc <- round((max2A280/(1.33*1*1)),3)
gp2yield <- gp2conc*1

gp3conc <- round((max3A280/(1.33*1*1)),3)
gp3yield <- gp3conc*1

Group <- c(1,2,3)
Concentration <- c(gp1conc,gp2conc,gp3conc)
Yield <- c(gp1yield,gp2yield,gp3yield)

Result <- data.frame(Group,Concentration,Yield)

-end-
