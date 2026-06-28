# =============================================================================
# Lab 4: Descriptive Analysis - 04_descriptive_analysis.R
# R Programming for Bibliometrics | Week 2
# =============================================================================

library (bibliometrix)

# --- SECTION 1: Load Your Data ---
file_path <- "data/sample_export.bib" # Adjust if using your own file
bibliographic_df <- convert2df(
  file = file_path,
  dbsource = "scopus",
  format = "bibtex"
)

# --- SECTION 2: Compute Annual Growth Rate ---
# Count publications by year
pub_by_year <- table (bibliographic_df$PY)
print(pub_by_year)

# Manually compute GR using the formula from Slide 3
# GR = (P_end/ P_start)^(1/y) - 1
years <- as.numeric(names(pub_by_year))
P_start <- as.numeric(pub_by_year[1]) # First year count
P_end <- as.numeric(pub_by_year[length(pub_by_year)]) # Last year count
y <- length(years) - 1 # Span of years
GR <- (P_end/ P_start)^(1/y) - 1
cat("Annual Growth Rate:",round(GR*100,2), "%\n")

# --- SECTION 3: Run Full Bibliometric Summary ---
results <- biblioAnalysis(bibliographic_df)
summary(results, k=10, pause = FALSE)

# --- SECTION 4:Export Author Productivity Bar Chart as PDF ---
# Open a PDF device - vector format, infinitely scalable
pdf("outputs/top_authors.pdf", width=10, height=6)
plot(results, k=10, pause = FALSE) # Renders productivity bar charts
dev.off()  # Closes the PDF device & saves file
cat("Chart saved to outputs/top_authors.pdf\n")

# --- SECTION 5: Verify the File Was Created ---
file.exists("outputs/top_authors.pdf") # Should print TRUE

#My dataset produced an annual growth rate of 0% which is low for a research field. 
#A growth rate of above 10% indicates that research activity is high with new researchers, increased funding and more data produced
#A growth rate of above 10% indicates that a field is emerging and growing, mature fields have 1-3% growth rate (usually)

#With only 3 records, every journal has same number of paper which is one making it impossible to separate into distinct zones
#Results in a flat graph

#As I zoom in to 400%, the text stays sharp in PDF format
png("outputs/top_authors.png", width=10, height=6)
plot(results, k=10, pause = FALSE) # Renders productivity bar charts
dev.off()  # Closes the PDF device & saves file
cat("Chart saved to outputs/top_authors.png\n")

# --- SECTION 5: Verify the File Was Created ---
file.exists("outputs/top_authors.png") # Should print TRUE
#As I zoom into 800%, the text gets blurry and pixelated in PNG format