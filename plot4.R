# Exploratory Data Analysis - Week 4 - Question 4 - Plot4.R


#load ggplot2
library(ggplot2)

# Read the data files
SummarySCCPM25 <- readRDS("summarySCC_PM25.rds")
SourceClassCode <- readRDS("Source_Classification_Code.rds")

PM25SCC <- merge(SummarySCCPM25, SourceClassCode, by="SCC")

#Subet the coal data
coalGrep  <- grepl("Coal", PM25SCC$Short.Name, fixed = TRUE)
CoalSubset <- PM25SCC[coalGrep, ]

#Agregrate coal emissions
TotalCoalEmission <- aggregate(Emissions ~ year, CoalSubset, sum)



# Generate the graph using ggplotg system
png(filename='plot4.png')


gPlot <- ggplot(TotalCoalEmission, aes(year, Emissions))

gPlot <- gPlot + geom_line() +
  xlab("year") +
  ylab(expression('Total PM25 Emissions')) +
  ggtitle('Total Coal Emissions from 1999-2008')
print(gPlot)
dev.off()

