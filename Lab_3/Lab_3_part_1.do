// Part I - Regression discontinuity
//
//
/*

LAB 3 - PART 1, Regression discontinuity

Inputs: filepath (current directory)

Uses data: RDD_data_MLDA_deaths.dta
Outputs: OUTPUT_part1_data
		 
Last edited: 2023-11-22

*/

set more off
cd "INSERT FILEPATH"
clear all
capture log close
log using logfile_lab3.log, replace
use RDD_data_MLDA_deaths.dta

* Question 1
summarize
misstable sum, all

line all external internal agecell, legend(size(medsmall))

* Question 5
* Recentering our running variable by subtracting 21.

gen recentered_age = agecell - 21

scatter recentered_age all

* Question 7
* Generating a dummy variable (treatment) that takes the value of 1 if the person is permitted to drink.
gen treatment = 1 if recentered_age >= 0
replace treatment = 0 if missing(treatment)

* Regressing treatment on external causes of death, and then on internal causes of death.
reg external treatment recentered_age
reg internal treatment recentered_age

* Question 9
* Performing the same regressions as above but with reduced bandwidth.
reg external treatment recentered_age if recentered_age > -1 & recentered_age < 1
reg internal treatment recentered_age if recentered_age > -1 & recentered_age < 1

* Question 10
gen treatment_age = treatment * recentred_age
reg external treatment recentered_age treatment_age
reg internal treatment recentered_age treatment_age

* Saving our new data and closing the logfile. 
save OUTPUT_part1_data, replace
log close
