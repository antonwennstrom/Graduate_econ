// Part II - Difference-in-Difference
//
//
/*

LAB 3 - PART 2, Difference-in-Difference


Uses data: DID_deaths.dta
Outputs: OUTPUT_part2_data
		 
Last edited: 2023-11-xx

*/

set more off
cd "/Users/emil/Documents/Stata/Lab 3/"
clear all
capture log close
log using logfile_lab3.log, replace
use DID_deaths.dta




* Saving our new data and closing the logfile. 
save OUTPUT_part2_data, replace
log close
