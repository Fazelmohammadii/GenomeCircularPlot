
# Genome Circular Plot Visualization Tool #
![DALL·E 2024-11-27 16 11 59 - A whimsical illustration depicting a group of anthropomorphic viruses collaboratively studying a circular graph  The graph represents a viral genome w](https://github.com/user-attachments/assets/11a9cfc9-327a-4843-8ff8-a17460690d40)


===========================================

This repository provides a script for creating high-quality circular genome plots using the R programming language. The plots include genomic features, functional annotations, and insertion points.

This script has been developed as part of scientific research on oncolytic viruses, aiming to represent their genomic features and functional annotations. DOI: https://doi.org/10.1038/s41551-024-01259-7

## Data Source and Preparation
The genome features data frame can be exported directly from SnapGene, a tool designed for visualizing and analyzing genome data. This software simplifies the preparation of genomic feature files, which are required as input for this script.

===========================================
## Features:
- Circular representation of genome structure.
- Visualization of functional categories with distinct colors.
- Plotting of insertion points with customizable markers.
- Interactive legend for better interpretation.
- Highly customizable for different datasets.

===========================================
## Repository Contents:
1. **Script:**
   - `genome_circular_plot.R` - The main R script for generating the circular genome plot.

2. **Example Data Files:**
   - `genome_features.csv` - Example dataset containing genomic features.
   - `insertions_df.csv` - Example dataset containing insertion points.

===========================================
## Prerequisites:
1. Install R (version 4.0 or higher).
2. Install the following R packages:
   - circlize
   - dplyr
   - tidyverse
   - ComplexHeatmap

To install packages in R, run:
```R
install.packages(c("circlize", "dplyr", "tidyverse"))
BiocManager::install("ComplexHeatmap")
```

===========================================
## Instructions:
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Fazelmohammadii/GenomeCircularPlot.git
   cd GenomeCircularPlot
   ```

2. **Prepare Your Data:**
   - Format your data to match the example file structures:
     - `genome_features.csv`:
       ```
       Start,End,Strand,Codon,Name,Function
       ...
       ```
     - `insertions_df.csv`:
       ```
       Start,End,InsertionValue
       ...
       ```

3. **Customize the Script:**
   - Update the file paths in `genome_circular_plot.R`:
     ```R
     genome_features_file <- "path/to/your/genome_features.csv"
     insertions_file <- "path/to/your/insertions_df.csv"
     ```

4. **Run the Script:**
   - Open `genome_circular_plot.R` in your R environment.
   - Execute the script to generate the circular plot.

5. **Output:**
   - The script produces a high-quality circular genome plot, ready for analysis and publication.

===========================================
## Example Input/Output:
- **Input Data Files:**
  - `genome_features.csv`:
    ```csv
    Start,End,Strand,Codon,Name,Function
    1,1000,+,geneA,Functional Category 1
    1001,2000,-,repeat_region,Functional Category 3
    ...
    ```
  - `insertions_df.csv`:
    ```csv
    Start,End,InsertionValue
    1500,1500,10
    2500,2500,15
    ...
    ```

- **Output Plot:**
  The generated plot visualizes genome segments, functional categories, and insertion points with clear labels and a legend.

===========================================
## Support:
For questions or assistance, contact:
**Fazel Mohammadi**
📧 Email: fazel.mo.610@gmail.com

===========================================
# Thank you for using the Genome Circular Plot Visualization Tool!

