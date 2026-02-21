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

participation_iran <- read.csv("data/participation_iran.csv")
participation_england <- read.csv("data/participation_england.csv",skip=5)
participation_germany <- read.csv("data/participation_germany.csv",skip=5)
participation_denmark <- read.csv("data/participation_denmark.csv",skip=2)

participation_england$gender <- factor(participation_england$gender,
                                       levels=c("female","other gender","male"))
g_england <- ggplot(aes(x=gender,y=participation,group=religion,fill=religion),data=participation_england) +
  geom_col(position="dodge") +
  scale_x_discrete(name=NULL,labels=c("Female","Non-binary","Male")) +
  scale_y_continuous(name=NULL,labels=percent) +
  scale_fill_discrete(name=NULL,labels=c("All adults","Muslim adults")) +
  labs(title="Participation — England",
       subtitle="Percent of adults playing football in 2023-24",
       caption="Data from SportEngland") +
  theme(legend.position="bottom",
        legend.direction = "horizontal",
        legend.key.spacing.x = unit(1,"cm"),
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
        legend.background = element_rect(colour='#252a34',fill='#252a34'))
g_england

participation_germany$background <- factor(participation_germany$background,
                                       levels=c("no migratory background","migratory background"))
g_germany <- ggplot(aes(x=gender,y=minutes,group=background,fill=background),data=participation_germany) +
  geom_col(position="dodge") +
  scale_x_discrete(name=NULL,labels=c("Female","Male")) +
  scale_y_continuous(name=NULL) +
  scale_fill_discrete(name=NULL,labels=c("No migratory background","Migratory background")) +
  labs(title="Participation — Germany",
       subtitle="Minutes of physical activity of adolescents across all sports",
       caption="Data from Rittsteiger et al 2021") +
  theme(legend.position="bottom",
        legend.direction = "horizontal",
        legend.key.spacing.x = unit(1,"cm"),
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
        legend.background = element_rect(colour='#252a34',fill='#252a34'))
g_germany

participation_denmark$ethnic_group <- factor(participation_denmark$ethnic_group,
                                       levels=c("danish","immigrants second generation","immigrants first generation"))
g_denmark <-  ggplot(aes(x=gender,y=participation,group=ethnic_group,fill=ethnic_group),data=participation_denmark) +
  geom_col(position="dodge") +
  scale_x_discrete(name=NULL,labels=c("Female","Male")) +
  scale_y_continuous(name=NULL,labels=percent) +
  scale_fill_manual(name=NULL,labels=c("Danish","Immigrants (2nd Gen)","Immigrants (1st Gen)"),
                    values=c("danish"="#F8766D","immigrants first generation"="#00BFC4",
                             "immigrants second generation"="#C77CFF")) +
  labs(title="Participation — Denmark",
       subtitle="Participation of adolescent students across all sports",
       caption="Data from Agergaard 2008") +
  theme(legend.position="bottom",
        legend.direction = "horizontal",
        legend.key.spacing.x = unit(0.8,"cm"),
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
        legend.background = element_rect(colour='#252a34',fill='#252a34'))
g_denmark

g_iran <- ggplot(aes(x=year,y=participation),data=participation_iran) +
  geom_line(color="#eaeaea") +
  geom_point(color="#eaeaea")+
  scale_x_continuous(name=NULL) +
  scale_y_continuous(name=NULL,labels=comma) +
  labs(title="Participation — Iran",
       subtitle="Participation of women across all sports",
       caption="Data from Statistical Centre of Iran & Ziaee et al 2022") +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5,size=5),
        text = element_text(color="#eaeaea"),
        axis.line.x = element_line(color="#eaeaea"),
        axis.ticks.x = element_line(color="#eaeaea"),
        axis.line.y = element_line(color="#eaeaea"),
        axis.ticks.y = element_line(color="#eaeaea"),
        plot.background=element_rect(colour='#252a34',fill='#252a34'),
        panel.background=element_rect(colour='#252a34',fill='#252a34'),
        legend.background = element_rect(colour='#252a34',fill='#252a34'))
g_iran

g_participation <- grid.arrange(g_germany,g_denmark,g_england,g_iran,
                                nrow=4)
ggsave("results/graph_participation.png",g_participation,width=5,height=16)
