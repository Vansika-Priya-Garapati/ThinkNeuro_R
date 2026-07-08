# =========================================================================
# Demo: Geographic Mapping & Synthesis - geographic_demo.R
# R Programming for Bibliometrics | Week 2
# =========================================================================

# Install packages if needed
# install.packages(c("bibliometrix", "dplyr", "readr", "stringr"))

library(bibliometrix)
library(dplyr)
library(readr)
library(stringr)

# INPUTS

bib_file <- "geographic_demo.bib"

# OUTPUT DIRECTORY

project_dir <- "bibliometric_outputs"

dir.create(project_dir, showWarnings = FALSE)

dir.create(file.path(project_dir, "figures"),
           showWarnings = FALSE)

dir.create(file.path(project_dir, "tables"),
           showWarnings = FALSE)

# IMPORT DATA

cat("Reading bibliographic data...\n")

M <- convert2df(
  file = bib_file,
  dbsource = "wos",
  format = "bibtex"
)

# EXTRACT COUNTRY INFORMATION FROM AFFILIATIONS

M <- metaTagExtraction(
  M,
  Field = "AU_CO",
  sep = ";"
)

head(M$AU_CO)

# BASIC SUMMARY

n_papers <- nrow(M)

year_min <- min(M$PY, na.rm = TRUE)
year_max <- max(M$PY, na.rm = TRUE)

timespan <- paste0(year_min, "-", year_max)

summary_text <- paste0(
  "Bibliometric Pipeline Summary\n",
  "=============================\n\n",
  "Total Papers: ", n_papers, "\n",
  "Timespan: ", timespan, "\n",
  "Earliest Year: ", year_min, "\n",
  "Latest Year: ", year_max, "\n"
)

writeLines(
  summary_text,
  file.path(project_dir, "pipeline_summary.txt")
)

# BIBLIOMETRIC ANALYSIS

results <- biblioAnalysis(M)

S <- summary(
  object = results,
  k = 20,
  pause = FALSE
)

capture.output(
  S,
  file = file.path(project_dir, "bibliometric_summary.txt")
)

# COUNTRY COLLABORATION NETWORK

cat("Generating country collaboration network...\n")

png(
  filename = file.path(
    project_dir,
    "figures",
    "country_collaboration_network.png"
  ),
  width = 1800,
  height = 1400,
  res = 200
)

NetMatrix <- biblioNetwork(
  M,
  analysis = "collaboration",
  network = "countries",
  sep = ";"
)

networkPlot(
  NetMatrix,
  normalize = "association",
  weighted = TRUE,
  n = 50,
  type = "fruchterman",
  size = TRUE,
  remove.multiple = FALSE,
  labelsize = 0.8,
  Title = "Country Collaboration Network"
)

dev.off()

# NATIONAL SHARE TABLE

cat("Calculating national publication shares...\n")

# Ensure countries have been extracted
M <- metaTagExtraction(
  M,
  Field = "AU_CO",
  sep = ";"
)

# Split countries into individual entries
country_list <- unlist(
  strsplit(
    M$AU_CO,
    ";"
  )
)

# Remove blanks and NAs
country_list <- trimws(country_list)
country_list <- country_list[
  !is.na(country_list) &
    country_list != ""
]

# Count publications by country
country_table <- as.data.frame(
  sort(
    table(country_list),
    decreasing = TRUE
  )
)

colnames(country_table) <- c(
  "Country",
  "Publications"
)

country_table$Share_Percent <- round(
  country_table$Publications /
    sum(country_table$Publications) * 100,
  2
)

country_table <- country_table[
  order(-country_table$Publications),
]

write_csv(
  country_table,
  file.path(
    project_dir,
    "tables",
    "national_share_table.csv"
  )
)

# CITATION SYNTHESIS TABLE

cat("Creating citation synthesis table...\n")

citation_table <- M %>%
  transmute(
    Title = TI,
    Year = PY,
    Authors = AU,
    Journal = SO,
    Total_Citations = TC,
    DOI = DI
  ) %>%
  arrange(desc(Total_Citations))

write_csv(
  citation_table,
  file.path(
    project_dir,
    "tables",
    "citation_synthesis_table.csv"
  )
)

# TOP CITED PAPERS

top_cited <- citation_table %>%
  slice_max(
    order_by = Total_Citations,
    n = 25
  )

write_csv(
  top_cited,
  file.path(
    project_dir,
    "tables",
    "top_25_cited_papers.csv"
  )
)

# COUNTRY PRODUCTION TABLE

country_results <- metaTagExtraction(
  M,
  Field = "AU_CO",
  sep = ";"
)

country_freq <- sort(
  table(unlist(strsplit(
    country_results$AU_CO,
    ";"
  ))),
  decreasing = TRUE
)

country_freq_df <- data.frame(
  Country = names(country_freq),
  Publications = as.numeric(country_freq)
)

country_freq_df <- country_freq_df %>%
  mutate(
    Share_Percent =
      round(
        Publications /
          sum(Publications) * 100,
        2
      )
  )

write_csv(
  country_freq_df,
  file.path(
    project_dir,
    "tables",
    "country_publication_share.csv"
  )
)

# FINAL REPORT

final_report <- c(
  summary_text,
  "",
  "Generated Outputs",
  "-----------------",
  "pipeline_summary.txt",
  "bibliometric_summary.txt",
  "figures/country_collaboration_network.png",
  "tables/citation_synthesis_table.csv",
  "tables/top_25_cited_papers.csv",
  "tables/national_share_table.csv",
  "tables/country_publication_share.csv"
)

writeLines(
  final_report,
  file.path(
    project_dir,
    "analysis_report.txt"
  )
)

cat("\nAnalysis complete.\n")
cat("Outputs saved to:", project_dir, "\n")