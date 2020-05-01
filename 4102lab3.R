#ABCT4102 lab 3 - ELISA assay
#Experiment notes
#Dilute the IgG samples from lab 2 using *coating buffer*

#Data entry
#Group 1
IgG <- c(0.6,0.3,0.15,0.075,0.0375,0.01875,0.009375,0)
OD4501A <- c(2.349,2.385,1.454,0.601,0.446,0.336,0.278,0.251)
OD4501B <- c(2.562,2.097,1.179,0.639,0.451,0.326,0.29,0.247)
mean1 <- c(2.456,2.241,1.317,0.620,0.449,0.331,0.284,0.249)
sd1 <- c(0.151,0.204,0.194,0.027,0.004,0.007,0.008,0.003)
Group1 <- data.frame(IgG,OD4501A,OD4501B,mean1,sd1)
colnames(Group1$sd1, sd)
#Group 2
IgG <- c(0.6,0.3,0.15,0.075,0.0375,0.01875,0.009375,0)
OD4502A <- c(2.47,1.958,1.207,0.654,0.373,0.208,0.131,0.098)
OD4502B <- c(2.55,1.96,1.007,0.53,0.309,0.173,0.133,0.11)
mean2 <- c(2.510,1.959,1.107,0.592,0.341,0.191,0.132,0.104)
sd2 <- c(0.057,0.001,0.141,0.088,0.045,0.025,0.001,0.008)
Group2 <- data.frame(IgG,OD4502A,OD4502B,mean2,sd2)
#Group 3
IgG <- c(0.6,0.3,0.15,0.075,0.0375,0.01875,0.009375,0)
OD4503A <- c(2.235,1.630,1.106,0.634,0.357,0.232,0.191,0.146)
OD4503B <- c(2.189,1.674,1.080,0.604,0.346,0.233,0.193,0.154)
mean3 <- c(2.212,1.652,1.093,0.619,0.352,0.233,0.192,0.150)
sd3 <- c(0.033,0.031,0.018,0.021,0.008,0.001,0.001,0.006)
Group3 <- data.frame(IgG,OD4503A,OD4503B,mean3,sd3)

#Data analysis - Normal Curve
library(ggplot2)
n1 <-   ggplot(Group1, aes(IgG, OD4501A)) +
  ggtitle("Group 1 IgG concentration against absorption (450nm)") +
  labs(x = "IgG concentration (µg/mL) ", y = "Absorption (450nm)") + geom_line(aes(y = OD4501B), color = "orange") + geom_point(aes(y= OD4501B))+
  geom_line(color = "red") + geom_point() +
  scale_x_continuous (lim = c(0,0.6), breaks = seq(0,0.6,0.02)) +
  scale_y_continuous (breaks = seq(0,2.8, by = 0.10)) +
  theme_bw()+
  theme(axis.text.x=element_text(size=12, angle=90),
        axis.text.y=element_text(size=12),
        plot.title=element_text(face="bold",vjust = 1,hjust = 0.5)) +
  annotate("text", x = 0.4, y = 1.0, label = "red = OD450(1), orange = OD450(2)")

n2 <- ggplot(Group2, aes(IgG, OD4502A)) +
  ggtitle("Group 2 IgG concentration against absorption (450nm)") +
  labs(x = "IgG concentration (µg/mL) ", y = "Absorption (450nm)") + geom_line(aes(y = OD4502B), color = "yellow") + geom_point(aes(y= OD4502B))+
  geom_line(color = "green") + geom_point() +
  scale_x_continuous (lim = c(0,0.6), breaks = seq(0,0.6,0.02)) +
  scale_y_continuous (breaks = seq(0,2.8, by = 0.10)) +
  theme_bw()+
  theme(axis.text.x=element_text(size=12, angle=90),
        axis.text.y=element_text(size=12),
        plot.title=element_text(face="bold",vjust = 1,hjust = 0.5)) +
  annotate("text", x = 0.4, y = 1.0, label = "green = OD450(1), yellow = OD450(2)")

n3 <- ggplot(Group3, aes(IgG, OD4503A)) +
  ggtitle("Group 3 IgG concentration against absorption (450nm)") +
  labs(x = "IgG concentration (µg/mL) ", y = "Absorption (450nm)") + geom_line(aes(y = OD4503B), color = "purple") + geom_point(aes(y= OD4503B))+
  geom_line(color = "blue") + geom_point() +
  scale_x_continuous (lim = c(0,0.6), breaks = seq(0,0.6,0.02)) +
  scale_y_continuous (breaks = seq(0,2.8, by = 0.10)) +
  theme_bw()+
  theme(axis.text.x=element_text(size=12, angle=90),
        axis.text.y=element_text(size=12),
        plot.title=element_text(face="bold",vjust = 1,hjust = 0.5)) + 
annotate("text", x = 0.4, y = 1.0, label = "blue = OD450(1), purple = OD450(2)")

#Data analysis - Standard curve

library(dplyr)
s1 <-   ggplot(Group1, aes(IgG, mean1)) +
        ggtitle("Group 1 IgG concentration against the mean absorption (450nm)") +
        labs(x = "IgG concentration (µg/mL) ", y = "Absorption (450nm)") +
        geom_line(color = "red") + geom_point() +
        scale_x_continuous (lim = c(0,0.3), breaks = seq(0,0.3,0.01)) +
        scale_y_continuous (breaks = seq(0,2.5, by = 0.10)) +
        theme_bw()+
        theme(axis.text.x=element_text(size=12, angle=90),
              axis.text.y=element_text(size=12),
              plot.title=element_text(face="bold",vjust = 1,hjust = 0.5))
        
        
s2 <- ggplot(Group2, aes(IgG, mean2)) +
  ggtitle("Group 2 IgG concentration against the mean absorption (450nm) ") +
  labs(x = "IgG concentration", y = "Absorption (450nm)") +
  geom_line(color = "green") + geom_point() +  
  scale_x_continuous (lim = c(0,0.15), breaks = seq(0,0.15,0.01)) +
  scale_y_continuous (breaks = seq(0,2.5, by = 0.10)) +
  theme_bw()+
  theme(axis.text.x=element_text(size=12, angle=90),
        axis.text.y=element_text(size=12),
        plot.title=element_text(face="bold",vjust = 1,hjust = 0.5))

s3 <- ggplot(Group3, aes(IgG, mean3)) +
  ggtitle("Group 3 IgG concentration against the mean absorption (450nm)") +
  labs(x = "IgG concentration", y = "Absorption (450nm)") +
  geom_line(color = "blue") + geom_point() + 
  scale_x_continuous (lim = c(0,0.15), breaks = seq(0,0.15,0.01)) +
  scale_y_continuous (breaks = seq(0,2.5, by = 0.10)) +
  theme_bw()+
  theme(axis.text.x=element_text(size=12, angle=90),
        axis.text.y=element_text(size=12),
        plot.title=element_text(face="bold",vjust = 1,hjust = 0.5)) 
  
#Plot absorbance graph with two absorptions measured
n1
n2
n3
#Plot standard graph with linear limits on each group
s1 
s2
s3


