# =========================================================
# Lab 3: Launching Biblioshiny - 03_biblioshiny.R
# R Programming For Bibliometrics | Week 1
# =========================================================

# ---SECTION 1: Pre-Convert & Save Data (Best Practice) ---

library(bibliometrix)

# Point to your .bib file (same as Lab 2)
file_path <- "data/sample_export.bib"

# Convert to structured data frame
bibliographic_df <-convert2df(
  file = file_path,
  dbsource = "scopus",
  format = "bibtex"
)

# Save the data frame as an R environment file for Biblioshiny
# This creates a file called "mydata.RData" in your project folder
save(bibliographic_df, file = "mydata.RData")

# Confirm the file was created successfully
file.exists("mydata.RData") #Should print: TRUE

# --- SECTION 2: Launch Biblioshiny ---
# This will lock your Console and open the browser dashboard
# Press Esc or click the red stop button to exit when done
biblioshiny()

# ---SECTION 3: Troubleshooting (run if needed) ---
# If the app freezes or your port is blocked, restart R session:
# Go to: Session > Restart R (Ctrl+Shift+F10 on Windows)

# If the browser does not open automatically, manually navigate to:
# http://127.0.0.1:1:3838 (or whatever port appears in your Console)

#Total number of documents is 3 and this matches with N from Lab 2
range(bibliographic_df$PY)
#yes, the values match as biblioshiny computed (2020:2022)

#R studio runs and computes the raw data from inputted codes
#Biblioshiny provides a clean web page to collect results from raw data
#Advantage of R studio is full control over code and to trace errors/mistakes
#Limitation of R Studio is time required to master code for beginners and understand results
#Advantage of biblioshiny is clear results organized in simple web page for beginners
#Limitation of biblioshiny is troubleshooting code errors and losing active access to R studio in active listening mode
