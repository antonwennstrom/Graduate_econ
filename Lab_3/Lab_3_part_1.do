// Part I - Regression discontinuity
//
//
/*

LAB 3 - PART 1, Regression discontinuity


Uses data: RDD_data_MLDA_deaths.dta
Outputs: OUTPUT_part1_data
		 
Last edited: 2023-11-xx

*/

set more off
cd "/Users/hst17anwe/Documents/nylabbar/Graduate_econ/Lab_3/"
clear all
capture log close
log using logfile_lab3.log, replace
use RDD_data_MLDA_deaths.dta

summarize



* Recentering our running variable by subtracting 21.

gen recentered_age = agecell - 21

scatter recentered_age all


* Saving our new data and closing the logfile. 
save OUTPUT_part1_data, replace
log close
