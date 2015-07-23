## Change current working dictionary 
setwd("~/GitHub/ExData_Assgn_2/exdata_data_NEI_data")
## Load Datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## find the Baltimore city from NEI
NEI_B <-NEI[which(NEI$fips == "24510"),]
## load ggplot2
library(ggplot2)
##Subset SCC & NEI
Vehicle_SCC <- SCC[grep("Vehicle", SCC$EI.Sector, ignore.case = T),]
Vehicle <- NEI_B[NEI_B$SCC %in% Vehicle_SCC$SCC,]

#ggplot2
png("plot5.png", width = 480, height = 480)
g <- ggplot(Vehicle, aes(year, Emissions))
g <-g+ geom_point(stat = "summary", fun.y = "sum")
g <-g+ geom_line (stat = "summary", fun.y = "sum")
g <-g+ labs(title = "Motor Vehicles-related Emissions of PM2.5")+ ylab(expression('PM2.5'))
g <-g+ scale_x_continuous(breaks = seq(1, 2008, 3))
g
dev.off()

