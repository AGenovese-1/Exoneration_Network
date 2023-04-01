library(igraph)
library(tidyverse)

# Import data
edge_data <- read.csv("data.csv")
edge_data$weight <- edge_data$weight + 0.1

graph <- graph_from_data_frame(edge_data, directed = TRUE)

# Set vertex attributes
V(graph)$type <- ifelse(V(graph)$name %in% c("Male", "Female"), "Gender", "Race")
V(graph)$label <- V(graph)$name

# Set edge attributes
E(graph)$label <- E(graph)$weight
E(graph)$arrow.mode <- 0
E(graph)$width <- E(graph)$weight/2

V(graph)$color <- ifelse(V(graph)$type == "Gender", "#FFCC66", "#6699CC")

# Set vertex shapes
V(graph)$shape <- ifelse(V(graph)$type == "Gender", "rectangle", "circle")

# Set layout
layout <- layout_with_fr(graph)

# Plot the graph
plot(graph, layout = layout, vertex.label.dist = 0.5)
