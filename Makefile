engagementReport.html: engagementReport.Rmd loadData katie xinyue uzoamaka tiffany
	Rscript code/05_render_report.R

katie: loadData
	Rscript code/01_Katie.R
	
output/xinyue1.rds output/xinyue2.rds&: code/02_Xinyue.R
	Rscript	code/02_Xinyue.R
	
uzoamaka: loadData
	Rscript  code/03_Uzoamaka.R
	
tiffany: loadData
	Rscript	code/04_Tiffany.R

loadData: 
	Rscript code/00_load_data.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f engagementReport.html