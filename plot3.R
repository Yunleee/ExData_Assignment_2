## Change current working dictionary 
setwd("~/GitHub/ExData_Assgn_2/exdata_data_NEI_data")
##load ggplot2
library (ggplot2)
## Load Datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## find the Baltimore city from NEI
NEI_B <-NEI[which(NEI$fips == "24510"),]

##ggpolt
png("plot3.png", width = 480, height = 480)
g <- ggplot(NEI_B, aes(year, Emissions, col = type))
g <-g+ geom_point(stat = "summary", fun.y = "sum")
g <-g+ geom_line (stat = "summary", fun.y = "sum")
g <-g+ labs(title = "Baltimore Emissions of PM2.5")+ ylab(expression('PM2.5'))
g <-g+ facet_grid(.~type, scales = 'free')
g <-g+ scale_x_continuous(breaks = seq(1, 2008, 3))
g
dev.off()
