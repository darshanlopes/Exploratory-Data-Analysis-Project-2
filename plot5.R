# Exploratory Data Analysis - Week 4 - Question 5 - Plot5.R


#load ggplot2
library(ggplot2)

# Read the data files
SummarySCCPM25 <- readRDS("summarySCC_PM25.rds")
SourceClassCode <- readRDS("Source_Classification_Code.rds")


#Subet the road emissions for Baltimore
baltimoreRoad <- subset(SummarySCCPM25, fips == 24510 & type == 'ON-ROAD')
aggregatedBaltimoreRoad <- aggregate(Emissions ~ year, baltimoreRoad, sum)



# Generate the graph using ggplotg system
png(filename='plot5.png')


gPlot <- ggplot(aggregatedBaltimoreRoad, aes(year, Emissions))

gPlot <- gPlot + geom_line() +
  xlab("year") +
  ylab(expression('Total PM25 Emissions')) +
  ggtitle('Total Road Emissions for Baltimore')
print(gPlot)
dev.off()

