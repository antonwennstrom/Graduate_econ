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
cd "/Users/vladdavid/Documents/Graduate_econometrics/Labbar/Graduate_econ/Lab_3"
clear all
capture log close
log using logfile_lab3.log, replace
use DID_deaths.dta

gen legal = 1 if state_name == "Alabama" && year >= 1975 
replace legal = 0 if missing(legal)

// Question 15
gen alabama = mrate if state_name == "Alabama"
gen arkansas = mrate if state_name == "Arkansas"

twoway (scatter arkansas alabama year) (line arkansas year, lpattern(dash)) (line alabama year, lpattern(dash)), xline(1975) ytitle("Mortality rate") xtitle("Year") legend(order(1 "Arkansas" 2 "Alabama"))

* Question 16 Förslag på lösning
gen year_dummy = 1 if year >= 1975
replace year_dummy = 0 if missing(year_dummy)
gen state_dummy = 1 if state_name == "Alabama"
replace state_dummy = 0 if missing(state_dummy)

gen did = state_dummy * year_dummy
reg mrate year_dummy state_dummy did



//graph twoway (function y = -2*x + 40, range(-1 0)) || (function y = -3*x + 27, range(-1 0)) || (function y = -1*x + 40, range(0 1)) || (function y = -8*x + 27, range(0 1)) , xline(0)



* Saving our new data and closing the logfile. 
save OUTPUT_part2_data, replace
log close
