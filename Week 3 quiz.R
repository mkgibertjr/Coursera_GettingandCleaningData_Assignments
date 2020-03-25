library("tidyverse")
agriculture <- read.csv("getdata_data_ss06hid.csv")
agricultureLogical <- agriculture$ACR == 3 & agriculture$AGS == 6
which(agricultureLogical)  
jpeg(filename = "getdata_jeff.jpg")
GDP <- read_csv("getdata_data_GDP.csv",col_types = "???n")
GDP <- GDP %>% filter(Ranking>0)
EDU <- read.csv("getdata_data_EDSTATS_Country.csv") 


GDP_EDU <- inner_join(GDP,EDU,by="CountryCode")

mean(GDP_EDU$Ranking[which(GDP_EDU$Income.Group == "High income: OECD")])
mean(GDP_EDU$Ranking[which(GDP_EDU$Income.Group == "High income: nonOECD")])
GDP_EDU2 <- GDP_EDU %>% mutate(percentile = percent_rank(`Millions of US Dollars`)) %>% filter(percentile > 0.80 & Income.Group == "Lower middle income")
