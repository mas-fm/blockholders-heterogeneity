import excel "D:\User\Desktop\thesis\data\blockholders\main data\firm\exclude_final_dataa(t).xlsx", sheet("Sheet1") firstrow
gen industry_year = group_id * year
	
xtset stock_id industry_year

eststo v0 : xtreg Tobins_Q total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity i.industry_year,fe vce(cluster firm)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

eststo v1 : xtreg Tobins_Q Diversity_identity total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity i.industry_year,fe vce(cluster firm)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace


eststo v2 : xtreg Tobins_Q Diversity_size total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity i.industry_year,fe vce(cluster firm)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace


eststo v3 : xtreg Tobins_Q Diversity_horizon total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity i.industry_year,fe vce(cluster firm)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE"Yes" , replace

eststo v4 : xtreg Tobins_Q Diversity_Index total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size 	Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity i.industry_year,fe vce(cluster firm)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

esttab v0 v1 v2 v3 v4, star(* 0.1 ** 0.05 *** 0.01) s(Firm_FE Industry_Year_FE N  r2 ,  lab("Firm FE" "Industry-Year FE" "Observations""$ R^2 $")) brackets order(institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index ) keep( institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index ) labcol2((+) (+) (-) (-) (+) (-) (-) (-) (-) (-) (-) (-) , title("" ExpectSign)),using "regression4.tex"


//----------------------//
eststo v00: xtreg ROA  total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

eststo v10: xtreg ROA Diversity_identity total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace


eststo v20 : xtreg ROA Diversity_size total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace


eststo v30 : xtreg ROA Diversity_horizon total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE"Yes" , replace

eststo v40 : xtreg ROA Diversity_Index total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

esttab v00 v10 v20 v30 v40 , se star(* 0.1 ** 0.05 *** 0.01) s(Firm_FE Industry_Year_FE N  r2 ,  lab("Firm FE" "Industry-Year FE" "Observations""$ R^2 $")) brackets order( institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index ) keep( institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index )
//,using "table2.tex"//


//-----------------------//


eststo v000: xtreg FCF  total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

eststo v100: xtreg FCF Diversity_identity total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

eststo v200 : xtreg FCF Diversity_size total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace


eststo v300 : xtreg FCF Diversity_horizon total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE"Yes" , replace

eststo v400 : xtreg FCF Diversity_Index total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,fe vce(cluster group_id)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

esttab v000 v100 v200 v300 v400 , se star(* 0.1 ** 0.05 *** 0.01) s(Firm_FE Industry_Year_FE N  r2 ,  lab("Firm FE" "Industry-Year FE" "Observations""$ R^2 $")) brackets order( institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index ) keep( institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index )
//,using "table3.tex"//

///////////
reghdfe Tobins_Q  total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,absorb( stock_id industry_year ) vce(cluster stock_id year )

xtreg Tobins_Q  total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity i.industry_year ,fe cluster( firm )

