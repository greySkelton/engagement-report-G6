# Engagement Report for INFO 550 Fall 2022Videos

> INFO 550 group project to practice the skills learned during the semester with a collaborative project

------------------------------------------------------------------------

## Steps to generate engagementReport.html

The end goal of this project is to produce a nice html report that analyzes  class engagement with the instructional videos.

To generate the report, you can either run these Rscripts in order:

  - `code/00_load_data.R`
  - `code/01_Katie.R`
  - `code/02_Xinyue.R`
  - `code/03_Uzoamaka.R`
  - `code/04_Tiffany.R`
  - `code/05_render_report.R`
  
or you can enter the terminal command `make engagementReport.html`

------------------------------------------------------------------------

## Code description

`code/00_load_data.R`

  - loads the csv file `raw_data/commodities.csv`
  - does some data cleaning
  - saves cleaned data as `data_clean.rds` in `output/` folder

`code/01_Katie.R` through `code/04_Tiffany.R`

  - reads `data_clean.rds` from `output/` folder
  - does some analysis and creates a summary table or figure 
  - saves each table or figure as a `.rds` object in `output/` folder

`code/05_render_report.R`

  - renders `engagementReport.Rmd`

`engagementReport.Rmd`

  - reads tables or figures generated by `code/01_Katie.R` through `code/04_Tiffany.R`
  - adds some explanatory text regarding dataset, tables, figures

------------------------------------------------------------------------

## Instructions for customizing the report

The customize-able feature for this report is allowing the user to include or exclude code chunks in the outputted html.

Instructions to select exclusion or inclusion of code chunks:

1. Open the R script: ` code/05_render_report.R`   
2. Change the `param`s argument to `TRUE` if you would like code chunks to be included in the rendered `engagementReport.html` report. Change it to `FALSE` if you do not want code chunks to be included in the rendered `engagementReport.html` report.