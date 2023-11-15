// Part II - Instrumental variables

/* 

LAB 2 - PART 2 - Intrumental variables 


Uses data: 
Outputs: 
		 
Last edited: 2023-11-xx
Packages needed: ??

*/

set more off
cd "/Users/hst17anwe/Documents/gradstata/Graduate_econ/Lab_2"
clear all
capture log close
log using logfile_lab2.log, replace

* Reading the data
use colonial_legacy.dta

* Creating a macro for our control variables
local controls child_age_cont child_age_cont2 b4 hv007 hv025 elev LATNUM LONGNUM mean_temp mean_rain land_suit malaria_ecology tsi_grid_tsi atlantic_all_years dist_missions

* Regressing vaccination index on times visit prospect and our control variables
reg vaccination_index Times_Prospected `controls', cluster(cluster_id)

* Specify the first stage equation and estimate it
reg Times_Prospected relative_suitability `controls', cluster(cluster_id)

* Saving our new data and closing the logfile. 

save OUTPUT_part2_data, replace
log close
