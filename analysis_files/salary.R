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

library(ggflags) # To give us flags for graphing
library(countrycode) # to switch between country name and country code

df_data <- read.csv("data/salary.csv")

df_data$country_code <- str_to_lower(countryname(df_data$country,
                                              destination="iso2c"))
df_data$gender <- factor(df_data$gender,
                                   levels=c("Women","Men"))
df_data$country <- factor(df_data$country,
                                    levels=c("United Kingdom","United States","Germany",
                                             "France"))

g1 <- ggplot(aes(x=gender,y=salary,fill=gender),data=df_data) +
  geom_col(position="dodge") +
  facet_wrap(vars(country),axes="all_x",scales="free_y") +
  geom_flag(aes(x=1,y=0.9*salary,country=country_code),size=8,,data=df_data[which(df_data$gender=="Men"),]) +
  geom_text(aes(label=league_name),size=1.5,y=0,vjust=-1) +
  scale_x_discrete(labels=NULL,name=NULL) +
  scale_y_continuous(labels=dollar,name=NULL) +
  scale_fill_manual(values=c("Men"="#7EBCE6","Women"="#FECEE9"),name=NULL)  +
  theme_classic() +
  theme(axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        #axis.line.y = element_blank(),
        #axis.ticks.y = element_blank(),
        legend.position="bottom",
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0.5,size=5),
        strip.background = element_blank(),
  strip.text.x = element_blank()) +
  labs(title="Average salary of pro football players by league",
       subtitle = paste0("Note: vertical axes vary between graphs"),
       caption="Analysis by SheFootball (www.she.football)\nusing data from Sporting Intelligence")
  
ggsave("results/graph_salary.png",g1,width=6,height=6)
