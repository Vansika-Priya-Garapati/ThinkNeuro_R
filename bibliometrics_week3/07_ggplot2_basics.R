# ============================================================================
# Lab 7: ggplot2 Basics - 07_ggplot2_basics.R
# R Programming for Bibliometrics | Week 3
# ============================================================================

# --- SECTION 1: Install & Load ggplot2 ---
# Run install.packages() once, then comment it out
#install.packages('ggplot2')
library(ggplot2)

# --- SECTION 2: Create a Sample Bibliometric Dataset ---
# Annual citation counts for a hypothetical research topic
papers <- data.frame(
  year = c(2018,2019,2020,2021,2022,2023,2024,2025),
  citations = c(18,31,52,84,101,138,162,44),
  author = c('Ali','Brown','Chen','Davis','Evans','Fei','Gomez','Harris'),
  pub_count = c(3,7,5,12,9,15,11,4)
)
head(papers)
str(papers)

# --- SECTION 3: Line Plot - Citation Trend Over Time ---
p_line <- ggplot(papers, aes(x = year, y = citations)) +
  geom_line(color = '#0E7490', linewidth = 1.2) +
  geom_line(color = '#0E7490', size = 3) +
  labs(
    title = 'Annual Citation Trend',
    x = 'Year',
    y = 'Number of Citations',
  ) +
  theme_minimal()
print(p_line)

# --- SECTION 4: Bar Chart - Publication Count by Author ---
p_bar <- ggplot(papers, aes(x=reorder(author,pub_count), y=pub_count)) +
  geom_bar(stat = 'identity', fill = '#0F766E') +
  coord_flip() +
  labs(
    title = 'Publication Count by Author',
    x = 'Author',
    y = 'Publications'
  ) +
  theme_minimal()
print(p_bar)

# --- SECTION 5: Histogram - Distribution of Citation Counts ---
p_hist <- ggplot(papers, aes(x=citations)) +
  geom_histogram(bins = 5, fill = '#0E7490', color = 'white') +
  labs(
    title = 'Distribution of Annual Citation Counts',
    x = 'Citations',
    y = 'Frequency'
  
  ) +
  theme_classic()
print(p_hist)

# --- SECTION 6: Scatterplot - Publications vs. Citations ---
p_scatter <- ggplot(papers, aes(x = pub_count, y = citations)) +
  geom_point(color = '#0E7490', size = 4, alpha = 0.7) +
  labs(
    title = 'Publication Count vs. Citations',
    x = 'Number of Publications',
    y = 'Number of Citations'
  ) +
  theme_minimal()
print(p_scatter)

# --- SECTION 7: Export All Four Figures ---
dir.create ('outputs', showWarnings = FALSE)
ggsave('outputs/line_citation_trend.png', p_line, width = 8, height = 5, dpi = 300)
ggsave('outputs/bar_author_output.png', p_bar, width = 8, height = 5, dpi = 300)
ggsave('outputs/hist_citation_dist.png', p_hist, width = 8, height = 5, dpi = 300)
ggsave('outputs/scatter_pubs_cites.png', p_scatter, width = 8, height = 5, dpi = 300)
cat('All four figures exported to outputs/.\n')
list.files('outputs/')

#Line graph and scatterplot are the most misleading as they will show an inaccurate sharp drop in data
#Researcher should always note time of data collection to indicate some data might be early access (mid-year)

#theme_bw makes the background white and the graphc black
#Used for professional presentations and to meet scientific guidelines
#theme_void makes the gridlines, axis, labels disappear
#Used for co-authorship, co-citation, and co-occurence maps to clear clutter

#The color layer lets you instantly spot which author is reponsible for a trend (highest or lowest)
# Put color = author in the global aes() mapping
p_scatter <- ggplot(papers, aes(x = pub_count, y = citations, color = author)) +
  # geom_point automatically inherits the color mapping from above
  geom_point(size = 4, alpha = 0.7) +
  labs(
    title = 'Publication Count vs. Citations by Author',
    x = 'Number of Publications',
    y = 'Number of Citations'
  ) +
  theme_minimal()

print(p_scatter)

ggsave('outputs/scatter_colored.png', p_scatter, width = 8, height = 5, dpi = 300)
