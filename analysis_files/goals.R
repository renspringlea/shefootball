#Set up environment
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #Set working directory (sue me)
rstudioapi::filesPaneNavigate(getwd()) #Set files pane in RStudio to working directory
library(ggplot2) #For graphing
theme_set(theme_classic()) #Because I'm fashionable
library(measurements) #For converting units
library(stringr) #For manipulating text
library(usdata) #For United States data
library(scales) #For converting units
library(viridis) #To help graphing
library(gridExtra) #To help graphing
library(gt) #For generating tables
library(gridExtra) #To help graphing
library(ggrepel) #To help graphing
library(gt) #To generate tables
library(ggsflabel) #To help graphing
library(readxl) #For importing .xlsx files
library(usdata) #For helpful US data and functions
theme_update(plot.title = element_text(hjust = 0.5),
plot.subtitle = element_text(hjust = 0.5),
plot.background=element_rect(colour='white',fill='white'),
panel.background=element_rect(colour='white',fill='white')) #because I'm fashionable
#theme_update(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) #optional for more fashion

df_goals <- read.csv("data/goals.csv")

g_goals <- ggplot(aes(x=Save_percent,y=Goals_against),data=df_goals) +
  geom_point(color="#eaeaea",size=2) +
  geom_smooth(method="lm",se=F,color="#eaeaea30",linewidth=0.5,linetype="dashed") +
  geom_text_repel(aes(label=Team),color="#eaeaea",size=2) +
  labs(title="Goalkeeping in the A-League Women",
       subtitle="2024-25 season",
       caption="Analysis by SheFootball\nusing data from FBref.com and Wikipedia") +
  scale_y_continuous(limits=c(0,70),name="Goals against",breaks=seq(0,70,10)) +
  scale_x_continuous(labels=percent,name="Shots saved (percent)") +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5,size=5),
        text = element_text(color="#eaeaea"),
        axis.line.y = element_line(color="#eaeaea"),
        axis.ticks.y = element_line(color="#eaeaea"),
        axis.line.x= element_line(color="#eaeaea"),
        axis.ticks.x = element_line(color="#eaeaea"),
        plot.background=element_rect(colour='#252a34',fill='#252a34'),
        panel.background=element_rect(colour='#252a34',fill='#252a34'),
        legend.background = element_rect(colour='#252a34',fill='#252a34'))
ggsave("results/graph_goals.png",g_goals,width=6,height=4)

cor.test(df_goals$Goals_against,df_goals$Save_percent)

summary(lm(Goals_against~Save_percent,data=df_goals))
