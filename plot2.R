# Exploratory Data Analysis - Week 4 - Question 2 - Plot2.R

# Read the data files
SummarySCCPM25 <- readRDS("summarySCC_PM25.rds")
SourceClassCode <- readRDS("Source_Classification_Code.rds")


# Subset the data by Baltimore.
baltimorePM25 <- SummarySCCPM25[SummarySCCPM25$fips=="24510",]

# Aggregate
baltimoreEmissions <- aggregate(Emissions ~ year,baltimorePM25, sum)

# Generate the graph using base plotting system
png(filename='plot2.png')

barplot(baltimoreEmissions$Emissions, names.arg=baltimoreEmissions$year, 
        main=expression('Total PM2.5 emission from Baltimore'),
        xlab='Year', ylab='PM2.5 Emissions (Tons)')

dev.off()