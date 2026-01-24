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


df_age <- data.frame("Age_group"=c("15 - 17","18 - 24","25 - 34","35 - 44","45 - 54","55 - 64","65 +"),
                     "Participation"=c(180541,317136,338723,242311,117051,31260,6335))
df_age$percent <- df_age$Participation/sum(df_age$Participation)
g_age <- ggplot(aes(x=Age_group,y=percent),data=df_age) +
  geom_col(fill="#FECEE9") +
  scale_y_continuous(name=NULL,labels=percent,breaks=seq(0,0.3,0.05)) +
  scale_x_discrete(name="Age group") +
  labs(title="Women's football participation by age group",
       subtitle="Australia — 2023 - 25",
       caption="Data: Australian Sports Commission / AusPlay") +
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
  
ggsave("results/graph_age.png",g_age,width=6,height=4)
