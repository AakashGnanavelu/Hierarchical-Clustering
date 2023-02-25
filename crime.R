library(readxl)

data <- read.csv(file.choose())
data <- data[,c(2:5)]

normalized_data <- scale(data)
dist <- dist(normalized_data, method = "euclidean")

fit <- hclust(dist, method = "complete")

plot(fit) # Display dendrogram

plot(fit, hang = -1)
groups <- cutree(fit, k = 4) # Cut tree into 3 clusters

rect.hclust(fit, k = 4, border = "red")
clust <- as.matrix(groups)

final <- data.frame(clust, data)

aggregate(data[], by=list(final$clust), FUN = mean)

library(readr)
write_csv(final, "crime output.csv")

getwd()
