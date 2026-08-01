# Group 4 - Healthcare Access and Disparities - ThinkNeuro
# Creating Figure 7 - Vansika Priya Garapati


# Load bibliometrix
library(bibliometrix)


# Define color palette
blue       <- "#2C7FB8"
light_blue <- "#DCEEF7"
final_blue <- "#E6F2F8"
dark_blue  <- "#1F5F8B"
gray_text  <- "gray35"

# 1. Load data
bib_df <- convert2df("data/ThinkNeuro_Group4_Top100_Biblioshiny_Ready.txt", dbsource = "wos", format = "plaintext")

# 2. Build Keyword Co-occurrence Network
NetMatrix_kw <- biblioNetwork(
  bib_df,
  analysis = "co-occurrences",
  network = "keywords",
  sep = ";"
)

# Plot the network
networkPlot(
    NetMatrix_kw,
    n = 40,
    Title = "Author Keyword Co-Occurrence Network",
    type = "kamada",
    size = 3,
    labelsize = 0.7,
    label.color = TRUE,
    cluster = "louvian" # Apply Louvian 
  )
  
# Subtitle
mtext(
    "Relationships Among Frequently Occurring Author Keywords in the Top 100 Literature Collection",
    side = 3,
    line = 0.5,
    adj = 0.5,
    col = gray_text,
    font = 3,
    cex = 0.85
  )


# Save whatever plot is currently showing in my Plots pane as PDF
dev.copy2pdf(file = "Figure7_Author_Keyword_Cooccurrence_Network.pdf", width = 10, height = 8)

cat("Saved directly from your Plots pane!\n")
