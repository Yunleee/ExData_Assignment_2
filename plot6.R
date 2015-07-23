## Change current working dictionary 
setwd("~/GitHub/ExData_Assgn_2/exdata_data_NEI_data")
## Load Datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## load ggplot2
library(ggplot2)
##Subset SCC & NEI
Vehicle_SCC <- SCC[grep("Vehicle", SCC$EI.Sector, ignore.case = T),]
Vehicle <- NEI[NEI$SCC %in% Vehicle_SCC$SCC,]
Vehicle_subset <- Vehicle[which(Vehicle$fips == "24510" | Vehicle$fips == "06037"),]
Vehicle_subset$fips[which(Vehicle_subset$fips == "24510")] <- "Baltimore"
Vehicle_subset$fips[which(Vehicle_subset$fips == "06037")] <- "Los Angeles"
##ggpolt
png("plot6.png", width = 480, height = 480)
g <- ggplot(Vehicle_subset, aes(year, Emissions, col = fips))
g <-g+ geom_point(stat = "summary", fun.y = "sum")
g <-g+ geom_line (stat = "summary", fun.y = "sum")
g <-g+ labs(title = "Comparision to Baltimore and LA Emissions of PM2.5")+ ylab(expression('PM2.5'))
g <-g+ facet_grid(.~fips, scales = 'free')
g <-g+ scale_x_continuous(breaks = seq(1, 2008, 3))
g
dev.off()

