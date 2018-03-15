# sliced
R package to construct and export very large correlation matrices.

## Installation
1. First, install `devtools` on R console by: `install.packages("devtools") `
2. Then, install `sliced` package by: `devtools::install_github("smtnkc/sliced")`
3. Note that, `sliced` package depends on `ff` which can be installed by: `install.packages("ff")`

## Usage
An example R file that is using the `sliced` package should look like:

```
library(readr)
library(sliced)

DATA_FRAME  <- read_csv("your_large_dataset.csv")
N_BLOCKS    <- 5  # Number of blocks you want to slice your dataframe
VERBOSE     <- TRUE 

# Get the first column as a vector
ROW_NAMES <- unlist(DATA_FRAME[,1])

# Transpose without the first column
TRANSPOSED_DF <- as.data.frame(t(DATA_FRAME[,-1]))

# Set colnames as rownames
colnames(TRANSPOSED_DF) <- ROW_NAMES

# Construct the virtual correlation matrix
COR_MATRIX <- sliced.cor(TRANSPOSED_DF, N_BLOCKS, "pearson", VERBOSE)

colnames(COR_MATRIX) <- ROW_NAMES
rownames(COR_MATRIX) <- ROW_NAMES

# Export the matrix as a CSV file
COR_FILE <- "your_output_file.csv"
sliced.write(COR_MATRIX, COR_FILE, N_BLOCKS, VERBOSE)
```

## Important Notes :exclamation::exclamation::exclamation:
* `N_BLOCKS` parameter **do not have to be** a divisor of the number of columns your dataframe has. The package deals with it by adding remainder columns to the last slice. :wink:
* **Transposition** in the example above may not always be necessary. However, keep in mind that, correlation is always performed column based. Since most of the gene expression datasets keeps **genes in rows** and **samples in columns**, transposition is needed to get correlation between genes.
