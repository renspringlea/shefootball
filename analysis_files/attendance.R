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

library(ggflags)
library(countrycode)

df_attendance <- read.csv("data/attendance.csv")
df_attendance_clubs <- df_attendance[which(df_attendance$country!="International"),]
df_attendance_clubs$league_country <- paste0(df_attendance_clubs$country,
                                             " (",df_attendance_clubs$league,")")



graph_order <- aggregate(attendance_mean~league_country,FUN=mean,data=df_attendance_clubs)
graph_order <- graph_order[order(graph_order$attendance_mean,decreasing=T),]
graph_order <- graph_order$league_country

df_attendance_clubs$league_country <- factor(df_attendance_clubs$league_country,
                                     levels=graph_order)

g_attendance <- ggplot(aes(x=year,y=attendance_mean,color=league_country,shape=league_country),data=df_attendance_clubs) +
  geom_line() +
  geom_point() +
  scale_x_continuous(name=NULL,breaks=seq(min(df_attendance_clubs$year),2025,1)) +
  scale_y_continuous(labels=comma,name=NULL) +
  labs(title="Attendance at women's top-flight club football",
       subtitle="Average number of attendees per match",
       caption="Analysis by SheFootball (www.she.football)\nusing data from Wikipedia & footballwebpages.co.uk") +
  scale_color_manual(values=c("#3F0D12","#009ddc","#f26430","#6761a8","#009b72"),
                     name=NULL) +
  scale_shape_discrete(name=NULL) +
  theme(legend.position=c(0.2,0.24),
        legend.text = element_text(size=6),
        legend.background = element_rect(fill=NA,color=NA),
        legend.box.background = element_rect(fill=NA,color=NA),
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5,size=5))
ggsave("results/graph_attendance.png",g_attendance,width=6,height=4)


df_attendance_clubs$country_code <- countrycode(sourcevar=df_attendance_clubs$country,
                                                origin="country.name",
                                                destination="iso2c")
df_attendance_clubs[which(df_attendance_clubs$country=="England"),]$country_code <- "EN"