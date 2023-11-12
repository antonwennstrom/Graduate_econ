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
cd "/Users/hst17anwe/Documents/Stata/Graduate_econ/Lab_2"
clear all
capture log close
log using logfile_lab1.log, replace


* Reading the data and producing some summary statistics.
use exam_results.dta

describe

* Add some more statistics


* Plotting test score against hours studied and calculating correlation. 
scatter test_score hours_studied
correlate test_score hours_studied

reg test_score hours_studied

* Testing our null hypotheses. 



* Storing the values of the residuals and plotting them against hours studied. 
predict U_hat, residuals
scatter U_hat hours_studied. /* Assumed that he meant hours_studied instead of educ. */



save OUTPUT_data, replace
log close
