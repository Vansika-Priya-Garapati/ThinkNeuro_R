# ==============================================================
# Lab 1: Workspace Setup-01_workspace_setup.R
# R programming for Bibliometrics | Week 1
# ==============================================================

# --- SECTION 1: Basic Arithmetic ---
# R evaluates expressions and prints results to the Console
2+2 #Addition
10 *3 #Multiplication
100/4 #Division
2 ^8 #Exponentiation (2 to the power of 8)

# ---SECTION 2: Variable Assignment ---
# Use the <- operator to store values in memory
total_publications <- 500
total_citations <- 3200

# ---SECTION 3: Recall and Inspect Variables ---
# Type the variable name or use print() to display it
total_publications
print(total_citations)

# --- SECTION 4: Compute the CPP Metric ---
# CPP = Citations Per Publication (average citation impact)
CPP <- total_citations / total_publications
CPP # Expected output: 6.4

# --- SECTION 5: Comment Your Logic ---
# Comments (lines starting with #) are ignored by R
# Good comments explain WHY, not just WHAT the code does
# Example: CPP above uses the bibliometric formula C/P (Slide 6)

# --- SECTION 6: View Your Environment ---
# List all objects currently stored in memory

total_publications <- 820
total_citations <- 6150

# --- REPEAT OF SECTION 4: Compute the CPP Metric ---
# CPP = Citations Per Publication (average citation impact)
CPP <- total_citations / total_publications
CPP # Expected output: 7.5

study_years <- 23
avg_papers_per_paper <- 58

Calculation <- total_publications / study_years
Calculation # Expected output: 35.652173913043478260

# CPP is no. of citations / no. of publications
# No. of citations is how times other scholars have referenced this research paper
# No. of publications is the count of papers published by the author
# A high CPP means that is referenced many times meaning it is of high quality
# of high impact and it is a key document in the field