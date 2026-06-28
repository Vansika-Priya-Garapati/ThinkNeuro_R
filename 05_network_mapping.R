# ============================================================================
# Lab 5: Network Mapping - 05_network_mapping.R
# R Programming for Bibliometrics | Week 2
# ============================================================================

install.packages("bibliometrixData")
library(bibliometrixData)
data("scientometrics")

library(bibliometrix)

# --- SECTION 1: Load Data ---
# Option A: Use your own .bib file
bib_df <- convert2df("data/sample_export.bib", dbsource = "scopus", format = "bibtex")

# Option B: Use the built-in scientometrics dataset (Recommended for this lab)
data("scientometrics")
bib_df <- scientometrics
cat("Dataset loaded. Dimensions:", dim(bib_df),"\n")

# --- SECTION 2: Build a Co-Authorship Network ---
# This creates a weighted igraph object G = (V,E)
NetMatrix <- biblioNetwork(
  bib_df,
  analysis = "collaboration", #Type of network
  network = "authors", #Node type: authors, countries, universities
  sep = ";" # Field seperator in metadata
)

#Inspect the matrix
cat("Network matrix dimensions:", dim(NetMatrix), "\n")

# --- SECTION 3: Plot Co-Authorship Network ---
net1 <- networkPlot(
  NetMatrix,
  n = 30, # Number of top nodes to display
  Title = "Co-Authorship Network",
  type = "fruchterman", # Layout: 'fruchterman' or 'kamada'
  size = 5, # Base node size
  size.cex = TRUE, # Scale node size by publication count
  labelsize = 0.7,
  curved = FALSE
)

# Save as a vector PDF
pdf("outputs/coauthorship_network.pdf", width = 12, height = 10)
networkPlot(NetMatrix, n=30, Title = "Co-Authorship Network",
type = "fruchterman", size = 5, size.cex = TRUE)
print(net1$nodeDegree)
dev.off()
cat("Co-authorship network saved.\n")

# --- SECTION 3: Plot Co-Authorship Network --- AGAIN
net1 <- networkPlot(
  NetMatrix,
  n = 30, # Number of top nodes to display
  Title = "Co-Authorship Network 2",
  type = "kamada", # Layout: 'fruchterman' or 'kamada'
  size = 5, # Base node size
  size.cex = TRUE, # Scale node size by publication count
  labelsize = 0.7,
  curved = FALSE
)

# Save as a vector PDF
pdf("outputs/coauthorship_network2.pdf", width = 12, height = 10)
networkPlot(NetMatrix, n=30, Title = "Co-Authorship Network 2",
            type = "kamada", size = 5, size.cex = TRUE)
dev.off()
cat("Co-authorship network 2 saved.\n")

# --- SECTION 4: Keyword Co-Occurrence Network ---
# Build the network using author keywords (DE field)
NetMatrix_kw <- biblioNetwork(
bib_df,
analysis = "co-occurrences",
network = "keywords",
sep = ";"
)

# Plot with pruning (only keep top 40 keywords, min freq threshold)
pdf("outputs/keyword_network.pdf", width=12, height=10)
networkPlot(
NetMatrix_kw,
n = 40,
Title = "Keyword Co-Occurence Network",
type = "kamada",
size = 3,
labelsize = 0.6,
cluster = "louvian" # Apply Louvian community detection
)
dev.off()
cat("Keyword network saved.\n")


#In fruchterman, the closer co-authorship is linked together whereas the unrelated author is away from the core network
#In kamada, all the authorship connections are present as a whole in equal distance and symmetry
#Fruchterman makes it easy to identify distinct research clusters
#Kamada is better to see the overall network structure

#huang mh (had the highest co-authorship network & made huge contributions)
#A high degree centrality means that the researcher is highly active
#Collaborates with many other researchers to publish discoveries and grow the field
#Very important to the research field and central of co-authorship networks

# Pink cluster represents evolution and research growth of science and technology. Shows impact of new fields
# Blue cluster represents analysis of journals and citation mapping of informatics in research
# Green cluster represents foundational framework of a field