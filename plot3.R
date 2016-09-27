# Exploratory Data Analysis - Week 4 - Question 3 - Plot3.R


#load ggplot2
library(ggplot2)

# Read the data files
SummarySCCPM25 <- readRDS("summarySCC_PM25.rds")
SourceClassCode <- readRDS("Source_Classification_Code.rds")


# Subset the data by Baltimore.
baltimorePM25 <- SummarySCCPM25[SummarySCCPM25$fips=="24510",]

# Aggregate
baltimoreEmissions <- aggregate(Emissions ~ year + type,baltimorePM25, sum)

# Generate the graph using ggplotg system
png(filename='plot3.png')


gPlot <- ggplot(baltimoreEmissions, aes(year, Emissions, color = type))

gPlot <- gPlot + geom_line() +
  xlab("year") +
  ylab(expression('Total PM25 Emissions')) +
  ggtitle('Total Emissions in Baltimore')
print(gPlot)
dev.off()

