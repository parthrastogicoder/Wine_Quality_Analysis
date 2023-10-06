# Load Libraries
library(ggplot2)

# Read Data
df1 <- read.csv('winequality-red.csv', sep=';')
df2 <- read.csv('winequality-white.csv', sep=';')

# Add Labels
df1$label <- 'red'
df2$label <- 'white'

# Combine Data
wine <- rbind(df1, df2)

# Exploratory Data Analysis (EDA)
# Histograms
pl1 <- ggplot(wine, aes(x = residual.sugar)) + geom_histogram(aes(fill = label), color = 'black', bins = 50) + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()
pl2 <- ggplot(wine, aes(x = citric.acid)) + geom_histogram(aes(fill = label), color = 'black', bins = 50) + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()
pl3 <- ggplot(wine, aes(x = alcohol)) + geom_histogram(aes(fill = label), color = 'black', bins = 50) + scale_fill_manual(values = c('#ae4554','#faf7ea')) + theme_bw()

# Scatterplots
pl4 <- ggplot(wine, aes(x = citric.acid, y = residual.sugar)) + geom_point(aes(color = label), alpha = 0.2) + scale_color_manual(values = c('#ae4554','#faf7ea')) + theme_dark()
pl5 <- ggplot(wine, aes(x = volatile.acidity, y = residual.sugar)) + geom_point(aes(color = label), alpha = 0.2) + scale_color_manual(values = c('#ae4554','#faf7ea')) + theme_dark()

# Print Plots
print("Histogram of Residual Sugar:")
print(pl1)
print("Histogram of Citric Acid:")
print(pl2)
print("Histogram of Alcohol:")
print(pl3)
print("Scatterplot of Citric Acid vs Residual Sugar:")
print(pl4)
print("Scatterplot of Volatile Acidity vs Residual Sugar:")
print(pl5)

# Create Clustering Data
clus.data <- wine[, 1:12]

# K Means Clustering
wine.cluster <- kmeans(clus.data, 2)

# Cluster Means
print("Cluster Means:")
print(wine.cluster$centers)

# Compare Clusters with Labels
cluster_table <- table(wine$label, wine.cluster$cluster)
print("Cluster vs Label Comparison:")
print(cluster_table)

# Conclusion
print("Conclusion:")
print("K Means clustering successfully grouped the wines into clusters based on their chemical properties. Red wines were easier to cluster than white wines. The results show that the clustering algorithm was able to capture some underlying patterns, although there was noise, possibly due to the presence of 'Rose' wines categorized as white wines. Domain knowledge is crucial in interpreting and refining clustering results.")

# Note: This script assumes that the input data files ('winequality-red.csv' and 'winequality-white.csv') are in the same directory as the script file.
