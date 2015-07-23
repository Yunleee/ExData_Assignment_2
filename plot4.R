## Change current working dictionary 
setwd("~/GitHub/ExData_Assgn_2/exdata_data_NEI_data")
##load ggplot2
library (ggplot2)
## Load Datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##Subset NEI & SCC
coal_SCC <- SCC[grep("Coal", SCC$EI.Sector, ignore.case = T),]
coal <- NEI[NEI$SCC %in% coal_SCC$SCC,]
##ggplot
png("plot4.png", width = 480, height = 480)
g <- ggplot(coal, aes(year, Emissions))
g <-g+ geom_point(stat = "summary", fun.y = "sum")
g <-g+ geom_line (stat = "summary", fun.y = "sum")
g <-g+ labs(title = "Coal-related Emissions of PM2.5")+ ylab(expression('PM2.5'))
g <-g+ scale_x_continuous(breaks = seq(1, 2008, 3))
g
dev.off()
