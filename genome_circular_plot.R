###########################################################################
######################## Genome Circular Plot #############################
###########################################################################
# Required Libraries
library(circlize)
library(dplyr)
library(tidyverse)
library(ComplexHeatmap)

##### FUNCTIONS #####

# Function to initialize the Circos plot
init_circos <- function(ideogram, text_label, start_degree = -90, gap_degree = 10) {
  circos.clear()
  circos.par("start.degree" = start_degree, "gap.degree" = gap_degree)
  circos.initializeWithIdeogram(ideogram, plotType = "axis", major.by = 10000, axis.labels.cex = 4)
  text(0, 0.120, text_label, cex = 6) # Main label
}

# Function to assign values for overlapping regions
assign_values <- function(data) {
  values <- rep(1, nrow(data))
  for (i in 1:(nrow(data) - 1)) {
    for (j in (i + 1):nrow(data)) {
      if (data$start[i] <= data$end[j] && data$end[i] >= data$start[j]) {
        values[i] <- -1
        values[j] <- -1
      } else if (data$codon[i] == "repeat_region" && data$codon[j] == "repeat_region") {
        values[i] <- 0.5
        values[j] <- 0.5
      }
    }
  }
  data$value <- values
  return(data)
}

# Function to assign colors to Functional Category of genome
assign_colors <- function(functions) {
  sapply(functions, function(func) {
    switch(func,
           "Functional Category 1" = "#6aa84f",
           "Functional Category 2" = "#3d85c6",
           "Functional Category 3" = "#999999",
           "Functional Category 4" = "#cc0000",
           "Functional Category 5" = "#e69138",
           "Functional Category 6" = "#783f04") # Default color
  })
}

# Function to create legend
create_legend <- function() {
  Legend(labels = c(
    "Functional Category 1",
    "Functional Category 2",
    "Functional Category 3",
    "Functional Category 4",
    "Functional Category 5",
    "Functional Category 6"
  ), type = "lines",
  labels_gp = gpar(cex = 3.4),
  legend_gp = gpar(col = c("#6aa84f", "#3d85c6", "#999999",
                           "#cc0000", "#e69138", "#783f04"), lwd = 20))
}

##### MAIN SCRIPT #####

# File paths (can be customized)
genome_features_file <- "genome_features.csv"
insertions_file <- "insertions_df.csv"

# Import data
features <- read.csv(genome_features_file, header = TRUE)
segments <- features[-1, ] # Segment-specific dataframe
insertions.df <- read.csv(insertions_file)

# Prepare the ideogram dataframe
cytoband.df <- data.frame(
  chr = "Chr",
  start = as.numeric(features[1, "Start"]),
  end = as.numeric(features[1, "End"]),
  strand = as.character(features[1, "Strand"]),
  codon = as.character(features[1, "Codon"])
)

# Prepare segments dataframe
segments.df <- data.frame(
  chr = "Chr",
  start = as.numeric(segments$Start),
  end = as.numeric(segments$End),
  codon = as.character(segments$Codon),
  name = segments$Name,
  strand = segments$Strand,
  functions = segments$function.,
  t.value = 1
)
segments.df <- assign_values(segments.df)
segments.df$color <- assign_colors(segments.df$functions)

# Initialize plot
init_circos(cytoband.df, "Genome origin species name\length of the genome(bp)")

# Create genomic tracks
circos.genomicTrack(segments.df, ylim = c(-2.5, 2.5),
                    panel.fun = function(region, value, ...) {
                      circos.genomicRect(region, value, ytop.column = 1, ybottom = 0, col = segments.df$color, ...)
                      circos.lines(CELL_META$cell.xlim, c(0, 0), lty = 1, lwd = 8, col = "#000000")
                      circos.genomicText(region, value, y = segments.df$t.value, labels = segments.df$name,
                                         facing = "clockwise", niceFacing = TRUE, cex = 2, font = 2)
                    })

# Add insertion points
circos.genomicTrack(insertions.df, ylim = c(0, 35),
                    panel.fun = function(region, value, ...) {
                      circos.genomicPoints(region, value, numeric.column = 3, cex = 0.5, pch = 20, col = "blue")
                    })

# Add legend
draw(create_legend(), x = unit(0.5, "npc"), y = unit(0.42, "npc"), just = c("center"))

# Optional: Add highlights (customize as needed)
# Example: draw.sector(55, 50, rou1 = 0.85, rou2 = 0.4, col = "#9FBFBF80")

###########################################################################
# For questions, contact: fazel.mo.610@gmail.com
###########################################################################
