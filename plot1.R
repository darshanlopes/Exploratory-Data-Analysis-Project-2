# Exploratory Data Analysis - Week 4 - Question 1 - Plot1.R

# Read the data files
SummarySCCPM25 <- readRDS("summarySCC_PM25.rds")
SourceClassCode <- readRDS("Source_Classification_Code.rds")


# Aggregate
TotalEmissions <- aggregate(Emissions ~ year,SummarySCCPM25, sum)

# Generate the graph using base plotting system
png(filename='plot1.png')

barplot(TotalEmissions$Emissions/1000, names.arg=TotalEmissions$year, 
        main=expression('Total PM2.5 emission from all sources'),
        xlab='Year', ylab='PM2.5 Emissions (Kilo Tons)')

dev.off()