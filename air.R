library(readxl)

data <- read_excel(file.choose())
data <- data[-1]

normalized_data <- scale(data)
dist <- dist(normalized_data, method = "euclidean")

fit <- hclust(dist, method = "complete")

plot(fit) # Display dendrogram

plot(fit, hang = -1)
groups <- cutree(fit, k = 3) # Cut tree into 3 clusters

rect.hclust(fit, k = 3, border = "red")
clust <- as.matrix(groups)

final <- data.frame(clust, data)

out <- aggregate(data[], by=list(final$clust), FUN = mean)

library(readr)
write_csv(final, "hclustoutput.csv")

getwd()
