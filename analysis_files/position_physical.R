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

library(metafor)

position_reaction <- read.csv("data/position_reaction.csv",skip=3)
position_speed <- read.csv("data/position_speed.csv",skip=3)

position_reaction_analysis <- position_reaction[which(position_reaction$Leg=="Right leg" &
                                                        position_reaction$Variable=="Acoustic"),]
position_reaction_analysis <- position_reaction_analysis[,c("Variable","Position","Mean","sd","n")]
position <- rbind(position_reaction_analysis,
                  position_speed)
position$Position <- factor(position$Position,levels=c("Goalkeeper","Defender","Midfielder","Forward"))
position$Variable <- str_replace_all(position$Variable,"Acoustic",
                                     "Reaction time (s)\nRight leg, acoustic stimulus, teenage academy players")
position$Variable <- str_replace_all(position$Variable,"ball_speed_dominant",
                                     "Ball speed (km/h)\nDominant leg, adult amateurs")
position$Variable <- str_replace_all(position$Variable,"sprint_30m",
                                     "Sprint time (s)\n30 m, adult amateurs")

g_position <- ggplot(aes(x=Position,y=Mean),data=position) +
  facet_wrap(vars(Variable),
             nrow=3,
             scales="free_y") +
  geom_col(position="dodge",fill="#FECEE9") +
  geom_errorbar(aes(ymin=Mean,ymax=Mean+sd),
                width=0,color="#FECEE9") +
  scale_x_discrete(name=NULL) +
  scale_y_continuous(name=NULL) +
  labs(title="Physical ability by position",
       caption="Data from Hernandez-Martinez et al 2024 & Trandafirescu et al 2024") +
  theme(legend.position="bottom",
        legend.direction = "vertical",
        legend.box.background = element_rect(fill=NA,color=NA),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5,size=5),
        text = element_text(color="#eaeaea"),
        axis.line.x = element_line(color="#eaeaea"),
        axis.ticks.x = element_line(color="#eaeaea"),
        axis.line.y = element_line(color="#eaeaea"),
        axis.ticks.y = element_line(color="#eaeaea"),
        plot.background=element_rect(colour='#252a34',fill='#252a34'),
        panel.background=element_rect(colour='#252a34',fill='#252a34'),
        legend.background = element_rect(colour='#252a34',fill='#252a34'),
        strip.background = element_rect(fill="#252a34",color="#252a34"),
        strip.text = element_text(color="#eaeaea"))
ggsave("results/graph_position.png",g_position,width=5,height=5)


