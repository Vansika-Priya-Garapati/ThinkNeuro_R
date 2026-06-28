# =========================================================================
# Lab 6: Geographic Mapping & Synthesis - 06_geographic_synthesis.R
# R Programming for Bibliometrics | Week 2
# =========================================================================

library(bibliometrix)
library(dplyr)
#install.packages('dplyr')

# --- SECTION 1: Country Co-Authorship Network ---
library(bibliometrixData)

#Option 1
# data("scientometrics")
# bib_df <- "scientometrics"

# Convert raw .bib file into a data frame
  file_path <-"geographic_demo.bib"

  bibliographic_df <- convert2df(
    file = file_path,
    dbsource = "wos",
    format = "bibtex"
)
  
# === CRITICAL MISSING STEP ===
# Extract country metadata from the author addresses (C1 field)
bibliographic_df <- metaTagExtraction(bibliographic_df, Field = "AU_CO", sep = ";")


# Build country collaboration network
NetMatrix_co <- biblioNetwork(
  bibliographic_df,
  analysis = "collaboration",
  network = "countries",
  sep = ";",
)
pdf("outputs/country_network.pdf", width = 14, height = 10)
networkPlot(
  NetMatrix_co,
  n=30,
  Title = "Country Collaboration Network",
  type = "sphere",
  size = TRUE,
  labelsize = 0.7
)
dev.off()
cat("Country network saved.\n")

# --- SECTION 2: Citation Synthesis Table ---
# Get the most-cited papers in the dataset
results <- biblioAnalysis(bibliographic_df)
top_papers <- citations(bibliographic_df, field = "article", sep = ";")

# Display the top 10 most locally cited papers
print(head(top_papers$Cited,10))

# --- SECTION 3: Compute Relative National Share (S_i) ---
# Count publications per country from the CO1 (country) field
#Note: CO1 availability depends on your database export
if("CO1"%in% colnames(bibliographic_df)){
  country_counts <- table(bibliographic_df$CO1)
  total_pubs <- sum(country_counts)
  S_i <- country_counts/total_pubs
  top_10_share <- sort(S_i, decreasing = TRUE)[1:10]
  print(round(top_10_share * 100,2)) # Print as percentages
} else {
  cat("CO1 field not found. Run Biblioshiny for country analysis.\n")
}

# Check for the correct field name "AU_CO"
if ("AU_CO" %in% colnames(bibliographic_df)) {
   q
  # Calculate counts using your correct dataframe and column name
  country_counts <- table(bibliographic_df$AU_CO)
  total_pubs <- sum(country_counts)
  S_i <- country_counts / total_pubs
  top_10_share <- sort(S_i, decreasing = TRUE)[1:10]
  
  cat("--- Top 10 Countries by Publication Share (%) ---\n")
  print(round(top_10_share * 100, 2)) # Print as percentages
  
} else {
  cat("AU_CO field not found. Make sure you ran metaTagExtraction first!\n")
}

# --- SECTION 4: Final Project Summary ---
cat("\n===WEEK 2 PROJECT SUMMARY===")
cat("\nTotal documents analyzed:", nrow(bibliographic_df))
cat("\nTimespan:", min(bibliographic_df$PY, na.rm =T), "to", max(bibliographic_df$PY, na.rm=T))
cat("\nOutputs generated: Check your outputs/ folder.\n")
list.files("outputs/")
  