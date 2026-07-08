# =============================================================================
# Lab 8: Advanced Network Coding - 08_advanced_networks.R
# R Programming for Bibliometrics | Week 3
# =============================================================================

library(bibliometrix) #Load bibiometrix

# --- SECTION 1: Load Data ---
library(bibliometrix)
library(bibliometrixData)

# --- SECTION 1: Load Data ---
data('scientometrics', package = 'bibliometrixData')
M <- scientometrics
cat('Loaded:', nrow(M), 'papers,', ncol(M), 'fields\n')

# --- SECTION 2: Co-Authorship Network ---
NetMatrix_Auth <- biblioNetwork(M, analysis = 'collaboration',
                                network = 'authors', sep = ';')

net_auth <- networkPlot(NetMatrix_Auth,
                        n = 30,
                        Title = 'Co-Authorship Network (Top 30)',
                        type = 'fruchterman',
                        size = TRUE,
                        labelsize = 0.7,
                        remove.isolates = TRUE, # Remove disconnected nodes
                        curved = FALSE
)

# --- SECTION 3: Co-Citation Network ---
# Change network = 'references' to build co-citation instead
NetMatrix_Cit <- biblioNetwork(M, analysis = 'co-citation',
                               network = 'references', sep = ';')

net_cit <- networkPlot(NetMatrix_Cit,
                       n = 20,
                       Title = 'Co-Citation Network (Top 20 Cited Docs)',
                       type = 'fruchterman',
                       size = TRUE,
                       labelsize = 0.6
                       )

# --- SECTION 4: Keyword Co-Occurrence Network ---
NetMatrix_KW <- biblioNetwork(M, analysis = 'co-occurrences',
                              network = 'keywords', sep = ';')
net_kw <- networkPlot(NetMatrix_KW,
                      n = 30,
                      Title = 'Keyword Co-Occurrence Network',
                      type = 'fruchterman',
                      size = 3,
                      labelsize = 0.7,
                      cluster = 'louvain' # Color by detected community
)

# --- SECTION 5: Bibliographic Coupling Network ---
NetMatrix_Coup <- biblioNetwork(M, analysis = 'coupling', #links papers or authors with same references
                                network = 'authors', sep = ';')
net_coup <- networkPlot(NetMatrix_Coup,
                        n = 20,
                        Title = 'Bibliographic Coupling (Authors)',
                        type = 'auto',
                        size = TRUE,
                        cluster = 'louvain'
)

# --- SECTION 6: Export All Four Networks as PDF ---
dir.create('outputs', showWarnings = FALSE)
pdf('outputs/net_coauthorship.pdf', width = 12, height = 10)
networkPlot(NetMatrix_Auth, n = 30, Title = 'Co-Authorship',
            type = 'fruchterman', size = TRUE, remove.isolates = TRUE)
dev.off()
pdf('outputs/net_cocitation.pdf', width = 12, height = 10)
networkPlot(NetMatrix_Cit, n = 20, Title = 'Co-Citation',
            type = 'fruchterman', size = TRUE)
dev.off()
pdf('outputs/net_keywords.pdf', width = 12, height = 10)
networkPlot(NetMatrix_KW, n = 30, Title = 'Keywords (Louvain)',
            type = 'fruchterman', size = 3, cluster = 'louvain')
dev.off()
pdf('outputs/net_coupling.pdf', width = 12, height = 10)
networkPlot(NetMatrix_Coup, n = 20, Title = 'Bibliographic Coupling',
            type = 'auto', size = TRUE, cluster = 'louvain')
dev.off()

cat('All four network PDFs exported.\n')
list.files('outputs/')

#Bibliographic coupling has one big cluster
#Shows how often both papers cited together
#Co-Citation has two clusters
#Shows how often both papers were cited by others
#I would use bibliographic coupling for a paper published 12 months because reference list is available after publication whereas co-citations can take more time

#4 distinct color clusters
#About 30 distinct keywords
#2-3 keywords from green cluster include bibliometrics, classification, and maps
#Thematic label would be 'Bibliometrics'

#Smaller n value of authors is more useful for research poster because it shows the top most influential authors but the tradeoff is that other authors will not be included
#Bigger n value includes more authors BUT the publication count will start to even out making the end redundant
#