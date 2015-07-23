## Change current working dictionary 
setwd("~/GitHub/ExData_Assgn_2/exdata_data_NEI_data")
## Load Datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Show the total emission for each of the years 1999, 2002, 2005, and 2008
us_emission <- tapply(NEI$Emissions, NEI$year, sum)
## barplot of Emission on a base plotting system
png("plot1.png", width = 480, height = 480)
barplot(us_emission, col = "red", main = "US Total Emissions of PM2.5", xlab = "Year", ylab = "PM 2.5 Emission")
dev.off ()
