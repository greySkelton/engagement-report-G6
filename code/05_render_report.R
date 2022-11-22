here::i_am("code/05_render_report.R")

library(rmarkdown)
# rendering a report in production mode
render("engagementReport.Rmd", params = list(display = FALSE))