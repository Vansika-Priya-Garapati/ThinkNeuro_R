# ThinkNeuro_R
R Code for RStudio Labs and Bibliometric Analysis for ThinkNeuro Research Internship
---
**Part 1: R Code for R Studio**

### R Programming Week 1 (bibliometrics_week1) 
Data - **sample_export.bib** found in **data** folder
* **Lab 1: 01_workspace_setup.R**
  * *Skills:* Basic Arithmetic, Variable Assignments, Recalling and Inspecting Variables, Calculating CPP (Citations per Publications) metric
* **Lab 2: 02_data_import.R**
  * *Skills:* Imported raw data (sample_export.bib) into a Data Frame, inspected dimensions (`dim`), inspected headers (`head`), extracted all metadata column names ('colnames'), specific metadata field ('$'), and utilized `range()` to compute oldest and latest publication years.
* **Lab 3: 03_biblioshiny.R**
  * *Skills:* Converted data (sample_export.bib) into a Data Frame, a **mydata.RData** file, and executed Biblioshiny
 
### R Programming Week 2 (bibliometrics_week2)
Data - **sample_export.bib** found in **data** folder, **scientometrics** is a part of **package = bibliometrixData**, and **geographic_demo.bib**
Plotted PDF and PNG files of Lab 4-6 in **outputs** folder
Files of **geographic_demo.R** found in **bibliometric_outputs** folder
* **Lab 4: 04_descriptive_analysis.R**
  * *Skills:* Computed Annual Growth Rate, Ran Full Bibliometric Summary, Evaluated author productivity plotted in pdf (**top_authors.pdf**) and png (**top_authors.png**) format 
* **Lab 5: 05_network_mapping.R**
  * *Skills:* Built and Plotted a Co-Authorship Network in fruchterman (**coauthorship_network.pdf**) and kamada (**coauthorship_network2.pdf**) types, Built and Plotted a Keyword Co-Occurence Network using louvian (**keyword_network.pdf**)
* **Lab 6: 06_geographic_synthesis.R**
  * *Skills:* Built and Plotted a Country Co-Authorship Network (**country_network.pdf**, Built a Citation Synthesis Table, and Calculated Relative National Share (S_i)
* **Demo: geographic_demo.R**
  * *Skills:* Installed packages (bibliometrix, dplyr, readr, stringr), created output directory (**bibliometric_outputs** where all files of this demo are found), converted data into a data frame, extracted country information from affiliations, built and extracted Country Collaboration Network (**country_collaboration_network.png** in **figures** folder), National Share Table (**national_share_table.csv** in **tables** folder), Citation Synthesis Table (**citation_synthesis_table.csv** in **tables** folder), Top Cited Papers (**top_25_cited_papers.csv** in **tables** folder), Country Production Table (**country_publication_share.csv** in **tables** folder), and Final Bibliometric Report consisting of Bibliometric Summary (**bibliometric_summary.txt**), Bibliometric Pipeline Summary (**pipeline_summary.txt**) and Analysis Report (**analysis_report.txt**)

### R Programming Week 3 (bibliometrics_week3)
Data - **scientometrics** is a part of **package = bibliometrixData**
Files of Labs 7-9 found in **outputs** folder
* **Lab 7: 07_ggplot2_basics.R**
  * *Skills:* Created a Sample Data Set, inspected the data frame using (`head`) and ('str'), Designed Line Plot (**line_citation_trend.png**), Bar Chart (**bar_author_output.png**), Histogram (**hist_citation_dist.png**),Scatterplot (**scatter_pubs_cities.png**), and custom scatterplot where color = author (**scatter_colored.png**)
* **Lab 8: 08_advanced_networks.R**
  * *Skills:* Built Co-Authorship Network (**net_coauthorship.pdf**), Co-Citation Network (**net_cocitation.pdf**), Keyword Co-Occurence Network (**net_keywords.pdf**), and Bibliographic Coupling Network (**net_coupling.pdf**)
* **Lab 9: 09_poster_figures.R**
  * *Skills:* Created a Sample Data set, Made a raw ggplot2 graph, customized graph by adding titles, axis labels, applying minimal theme, bold title, axis sizing, and finalizing poster dimensions - (**poster_citation_table.pdf** and **poster_citation_table.png**)
---
**Part 2: R Code for Bibliometrics Research Project/Poster**

### Group 8 Cognitive and Computational Neuroscience (bibliometrics_research_project) 
Data - **diane_data.bib** found in **data** folder
* **Keyword Co-Occurrence Network: Keyword_Cooccurrence_Network.R**
  * *Skills:* Defined color palette,converted into data frame, built and plotted a Keyword Co-Occurence Network, added a custom subtitle, and saved the network as a PDF - **Keyword_Cooccurrence_Network.pdf** in **outputs** folder
* **Publicatons Over Time Line Graph: Publication_Year_Graph.R**
  * *Skills:* Converted to data frame, summarized groups, found maximum value, built the plot by adding data points, defining x and y axis, adding title and axis labels, and removed grid lines. Saved the graph as a PDF - **publications_over_time_line_graph.pdf** in **outputs** folder
* **Top 10 Most Cited Papers CSV: top_10_csv.R**
  * *Skills:* Cleaned title formatting, extracted first author, created citation key, calculated citations per year, named table columns, and saved the csv file - **top_10_most_cited_papers.csv** in **tables** folder
* **Top 10 Most Cited Papers Table: top_10_cited_papers.R**
  * *Skills:* Created PDF table styling, loaded saved CSV, and saved the table as a PDF - **top_10_most_cited_papers_table.pdf** in **outputs** folder
* **Top 5 Most Cited Papers Table: top_5_cited_papers.R**
  * *Skills:* Created PDF table styling, loaded saved CSV, filtered down to top 5, and saved the table as a PDF - **top_5_most_cited_papers_table.pdf** in **outputs** folder

### Group 4 Healthcare Access and Disparities (bibliometrics_research_project_2) 
Data - **ThinkNeuro_Group4_Top100_Biblioshiny_Ready.txt** found in **data** folder
* **Keyword Co-Occurence Network: Figure7_Keyword_Network.R**
  * *Skills:* Defined color palette,converted into data frame, built and plotted a Keyword Co-Occurence Network, added a custom subtitle, and saved the network as a PDF - **Figure7_Author_Keyword_Cooccurence_Network.pdf** in **outputs** folder

*Maintained by Vansika Priya Garapati*
