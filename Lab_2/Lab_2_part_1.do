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
cd "/Users/vladdavid/Documents/Graduate_econometrics/Labbar/Graduate_econ/Lab_2"
clear all
capture log close
log using logfile_lab1.log, replace
use exam_results.dta

* Question 1)
* Reading the data and producing some summary statistics.
summarize
codebook, compact

* Question 2)
* Plotting test score against hours studied and calculating correlation. 
scatter test_score hours_studied
correlate test_score hours_studied

* Question 3)
* Estimating an OLS regression with test score as dependent variable and hours studied as independent variable
reg test_score hours_studied

* Question 4)
* Testing our null hypotheses at 10% and 1% significance level respectively. For significance level 5%, please refer to the regression in question 3
reg test_score hours_studied ,level(90)
reg test_score hours_studied ,level(99)

*Question 5)
* Storing the values of the residuals and plotting them against hours studied. 
reg test_score hours_studied
predict U_hat, residuals
scatter U_hat hours_studied, yline(0)

* Changing to a robust regression to deal with heteroscedasticity
rreg test_score hours_studied
predict Y_hat, residuals
scatter Y_hat hours_studied, yline(0)

* Question 6)
* Creating categorical variable and re-running the regression with this new variable. 
recode hours_studied (38/43 = 0 "little studying") (44/50 = 1 "normal studying") (51/56 = 2 "heavy studying"), generate(hours_studied_cat)

reg test_score i.hours_studied_cat

* Question 8)
* Creating a dummy variable for "most_lectures" and then regressing test score on hours study and this new dummy variable. 
generate most_lectures_dummy = 1 if most_lectures == "Yes"
replace most_lectures_dummy = 0 if missing(most_lectures_dummy)

reg test_score hours_studied most_lectures_dummy

//estat endog test_score hours_studied most_lectures

* Saving our new data and closing the logfile. 
save OUTPUT_part1_data, replace
log close
