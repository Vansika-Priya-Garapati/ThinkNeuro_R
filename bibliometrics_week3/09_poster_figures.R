# ============================================================
# Lab 9: Poster-Ready Figures — 09_poster_figures.R
# R Programming for Bibliometrics | Week 3
# ============================================================
library(ggplot2)
# --- SECTION 1: Recreate Sample Dataset ---
papers <- data.frame(
  year = c(2018, 2019, 2020, 2021, 2022, 2023, 2024),
  citations = c(18, 31, 52, 84, 101, 138, 162),
  pub_count = c(3, 7, 5, 12, 9, 15, 11)
)
# --- SECTION 2: BEFORE — Default (Un-Customized) Plot ---
# This is what a raw ggplot looks like with no customization.
# Note: no title, generic axis labels, default grey theme
p_before <- ggplot(papers, aes(x = year, y = citations)) +
  geom_line() +
  geom_point()
print(p_before)
# Pause and study this. What is missing for a poster?

# --- SECTION 3: Add Titles and Axis Labels ---
p_v1 <- ggplot(papers, aes(x = year, y = citations)) +
  geom_line() +
  geom_point() +
  labs(
    title = 'Annual Citation Growth (2018 - 2024)',
    subtitle = 'Source: Sample Bibliometric Dataset',
    x = 'Publication Year',
    y = 'Total Citations Received'
  )
print(p_v1)
# --- SECTION 4: Apply a Clean Theme ---
p_v2 <- p_v1 +
  theme_minimal(base_size = 14) # base_size scales all text proportionally
print(p_v2)
# --- SECTION 5: Add Intentional Color and Sizing ---
p_v3 <- ggplot(papers, aes(x = year, y = citations)) +
  geom_line(color = '#0E7490', linewidth = 1.5) +
  geom_point(color = '#0E7490', size = 4) +
  labs(
    title = 'Annual Citation Growth (2018 - 2024)',
    subtitle = 'Source: Sample Bibliometric Dataset',
    x = 'Publication Year',
    y = 'Total Citations Received'
  ) +
  theme_minimal(base_size = 14)
print(p_v3)
# --- SECTION 6: Poster Polish — Bold Title, Axis Sizing ---
p_final <- p_v3 +
  theme(
    plot.title = element_text(face = 'bold', size = 18),
    plot.subtitle = element_text(color = 'grey50', size = 12),
    axis.title = element_text(face = 'bold', size = 14),
    axis.text = element_text(size = 12)
  )
print(p_final)
# --- SECTION 7: Export at Poster Dimensions ---
dir.create('outputs', showWarnings = FALSE)
# High-res PNG for poster embedding
ggsave('outputs/poster_citation_trend.png',
       p_final, width = 10, height = 6, dpi = 300)
# Vector PDF for scaling without pixelation
ggsave('outputs/poster_citation_trend.pdf',
       p_final, width = 10, height = 6)

cat('Poster figure exported as PNG and PDF.\n')
# --- SECTION 8: Self-Audit Checklist (run, then answer in comments) ---
# Open outputs/poster_citation_trend.pdf and check each item:
#
# [CHECK] Is the title clear and descriptive?
# [CHECK] Are both axis labels present and readable?
# [CHECK] Is the text large enough to read at arm's length (poster check)?
# [CHECK] Is there minimal clutter — no unnecessary gridlines or legend items?
# [CHECK] Is the main trend immediately visible within 5 seconds?
# [CHECK] Is the contrast between the line and background strong?
cat('\nSelf-audit complete. Record findings as comments below.\n')

#Title and sub-title for defining topic
#Axis Labels for clarity
#Color for aesthetic and enhancing the graphic
#Customization features for making it ready for professional presentations

#The single element that had the most impact is THE TREND VISIBILITY WITHIN 5 seconds because it fulfills the need of a visualization
# Choosing the right chart type to display networks combined with customization makes the bibliometrics visuals ready for poster

