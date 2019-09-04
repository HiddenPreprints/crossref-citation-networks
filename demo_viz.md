demo\_visualization
================
Hao Ye
2019-09-04

## Generate the citation network

Load the data.

``` r
library(rcrossref)
library(tidyverse)
```

    ## ── Attaching packages ───────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
    ## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
    ## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
    ## ✔ readr   1.3.1     ✔ forcats 0.4.0

    ## ── Conflicts ──────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
crossref_query <- readRDS("test_data.RDS")
crossref_data <- crossref_query$data
```

Extract the citation links from the crossref results:

``` r
source("build_network.R")
links <- extract_citation_links(crossref_data)
```

## Visualize the citation work

``` r
library(ggraph)

net <- igraph::graph_from_data_frame(links)
```

    ## Warning in igraph::graph_from_data_frame(links): In `d' `NA' elements were
    ## replaced with string "NA"

``` r
ggraph(net) +
    geom_node_point() +
    geom_edge_link() + 
    theme_bw()
```

    ## Using `nicely` as default layout

![](demo_viz_files/figure-gfm/make%20graph-1.png)<!-- -->
