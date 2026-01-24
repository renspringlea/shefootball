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

library(terra) #For spatial data analysis
library(sf) #For spatial data analysis
library(tidyterra) #For graphing spatial data
library(rnaturalearth) #For spatial datasets
library(usmap) #For US-specific spatial datasets
library(ggrepel)

df_countries <- read.csv("data/countries.csv")

sv_countries <- vect(ne_countries(scale="small"))
sv_countries <- merge(sv_countries,df_countries,
                      by.x="name",by.y="country",
                      all=T)
sv_countries <- project(sv_countries,"+proj=eqearth")
sv_countries$map_label <- ifelse(is.na(sv_countries$status),
                                 NA,
                                 sv_countries$name)
sv_countries$status <- factor(sv_countries$status,
                              unique(df_countries$status))

sv_countries$label_x <- geom(centroids(sv_countries))[,3]
sv_countries$label_y <- geom(centroids(sv_countries))[,4]

sv_countries_red <- sv_countries[which(!is.na(sv_countries$status)),]

palette_map <- c("#44001A",
                 "#D81E5B",
                 "#F0544F",
                 "#FFE156")


g_map <- ggplot(data=sv_countries_red) +
  geom_spatvector(data=sv_countries,fill="grey50",color=NA) +
  geom_spatvector(aes(fill=status),color=NA) +
  geom_label_repel(aes(x=label_x,y=label_y,label=map_label),
                  size=2,
                  segment.size=0.2,
                  label.padding=0.2,
                  max.overlaps=NA,
                  min.segment.length=0.1,
                  force_pull=0.3,
                  fill="#252a34",
                  color="#eaeaea") +
  scale_fill_manual(values=palette_map,
                    name=NULL,
                    breaks=unique(df_countries$status),
                    labels=c("Women banned from playing sport",
                             "No national football team",
                             "No national matches in 2+ years",
                             "Restrictions on women spectators")) +
  labs(title="Barriers facing women in football",
       caption="Analysis by SheFootball (www.she.football)\nusing data from Wikipedia, FIFA, MSN") +
  theme_void() +
  theme(legend.position=c(0.2,0.2),
        legend.text = element_text(size=5),
        legend.key.size = unit(0.4,"cm"),
        legend.direction = "vertical",
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5,size=5),
        text = element_text(color="#eaeaea"),
        plot.background=element_rect(colour='#252a34',fill='#252a34'),
        panel.background=element_rect(colour='#252a34',fill='#252a34'),
        legend.background = element_rect(colour='#252a34',fill='#252a34'))
ggsave("results/countries_map.png",g_map,width=6,height=4)
