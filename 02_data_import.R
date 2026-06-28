# =========================================================
# Lab 2: Bibliographic Data Import - 02_data_import.R
# R Programming for Bibliometrics | Week 1
# =========================================================

# --- SECTION 1: Install & Load bibliometrix ---
# Run install.packages (_) ONCE, then comment it out(#)
install.packages("bibliometrix")
library(bibliometrix)

# --- SECTION 2: Define the File Path ---
# The path is RELATIVE to your R project root folder
file_path <-"data/sample_export.bib"

# --- SECTION 3:Convert Raw BibTeX to a Data Frame ---
# dbsource must match where the file was exported from
# format must match the file type (.bib = "bibtex")
bibliographic_df <- convert2df(
  file = file_path,
  dbsource = "scopus",
  format = "bibtex"
)

# --- SECTION 4: Structural Audit ---

#4a. Check the [N x M] dimensions
dim(bibliographic_df)
# Output: Two numbers - rows (N papers) and columns (M metadata fields)

#4b. Preview the first 3 records
head(bibliographic_df, n=3)

#4c. List all metadata column names (AU,TI,SO,CR,etc.)
colnames(bibliographic_df)

# ---SECTION 5: Extract a Single Column ---
# Use the $ operator to access a specific metadata field
bibliographic_df$TI #Print all paper titles
bibliographic_df$AU #Print all author strings

# 3 documents and 21 metadata variables
# N = 3 which is the number of distinct documents/publications
# M = 21 which is metadata tags associated with publications (authors, keywords)
bibliographic_df$PY #Print all publication years
range(bibliographic_df$PY, na.rm = TRUE)
# The range gives you the oldest publication year
# and the most recent publication year in the data set
range(bibliographic_df$SO)
range(bibliographic_df$SO, na.rm = TRUE)
# the range picks the journal name closest to A first
# and journal name closest Z next
# to fulfill the minimum and maximum value that range() gives