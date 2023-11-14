// Part I - Endogeneity
//
//
/* 

LAB 2 - PART 1, Endogeneity


Uses data: exam_results.dta
Outputs: 
		 
Last edited: 2023-11-xx
Packages needed: ??

*/

set more off
cd "/Users/hst17anwe/Documents/gradstata/Graduate_econ/Lab_2"
clear all
capture log close
log using logfile_lab1.log, replace


* Reading the data and producing some summary statistics.
use exam_results.dta

describe
summarize
* Add some more statistics


* Plotting test score against hours studied and calculating correlation. 
scatter test_score hours_studied
correlate test_score hours_studied

reg test_score hours_studied

* Testing our null hypotheses. 
reg test_score hours_studied ,level(90)
reg test_score hours_studied ,level(99)

* Storing the values of the residuals and plotting them against hours studied. 
predict U_hat, residuals
scatter U_hat hours_studied

* Creating categorical variable and re-running the regression with this new variable. 
recode hours_studied (38/43 = 0 "little studying") (44/50 = 1 "normal studying") (51/56 = 2 "heavy studying"), generate(hours_studied_cat)

* Creating a dummy variable for each category
gen little_studying = 1 if hours_studied_cat = 0
replace little_studying = 0 if missing(little_studying)
gen normal_studying = 1 if hours_studied_cat = 1
replace normal_studying = 0 if missing(normal_studying)
gen heavy_studiyng = 1 if hours_studied_cat = 2
replace heavy_studiyng = 0 if missing(heavy_studiyng)

* Creating a dummy variable for "most_lectures" and then regressing test score on hours study and this new dummy variable. 

generate most_lectures_dummy = 1 if most_lectures == "Yes"
replace most_lectures_dummy = 0 if missing(most_lectures_dummy)

reg test_score hours_studied most_lectures_dummy


* Saving our new data and closing the logfile. 


save OUTPUT_part1_data, replace
log close
