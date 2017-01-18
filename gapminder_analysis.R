#Notes from Software Carpentry Workshop 20170117
#Date: January 17-18 2017
#load necessary packages:
#test lines and stuff mer mer mer. 
library(ggplot2)
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "gapminder-FiveYearData.csv")
gapminder <- read.csv("gapminder-FiveYearData.csv")
#take a look at how these data are set up, etc:
head(gapminder)
#look at columns:
colnames(gapminder)
#gives structure of dataframe (aka summary of types ofdata we have):
str(gapminder)
#more functions to learn about our data:
dim(gapminder)
#above gives rows and columns
nrow(gapminder)
ncol(gapminder)
summary(gapminder)
#summary above gives stats for "type" of data (depending on is numerical, etc)
View(gapminder)
#View shows in a spreadsheet
#to manipulate stuff: gapminder[row, column]
# so to call column three, for example, you would do:
gapminder[,3]
#or by column name
gapminder[,"pop"]
#or $pop 
#create new dataframe with country, year, and pop:
gapminder[,c("country", "year", "pop")]
#to pull out first five rows of gapminder:
gapminder[1:5,]

#createnew variable for next stuff:
is_long_lifeExp <- gapminder$lifeExp > 80
head(is_long_lifeExp)
gapminder[is_long_lifeExp,]

#exercise: "What is the life expectancy of countries in Africa in 2007?"
#good idea to write out in "pseudocode":
# African countries' life expectancies for 2007
#step 1: get 2007 data
is_2007 <- gapminder$year == 2007
#step 2: get Africa data
is_Africa <- gapminder$continent == "Africa"
#step 3: pull 2007 and Africa from gapminder
africa_2007 <- gapminder[is_2007 & is_Africa,]
#then look at data
africa_2007
#now can look at life expectancy by country:
africa_2007 <- gapminder[is_2007 & is_Africa, c("country", "lifeExp")]
#take a look now:
africa_2007

#order this dataframeby life expectancy
o <- order(africa_2007$lifeExp)
africa_2007[o, ]

#added stuff on day 2:
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + geom_point() + facet_grid(. ~continent)
#to save plot above:
ggsave(filename = "year_vs_lifeExp_byContinent.png", width = 5, height = 4, units = "in")

#sometest text
