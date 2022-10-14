import excel "D:\User\Desktop\thesis\data\blockholders\main data\firm\exclude_final_dataa(t+1).xlsx", sheet("Sheet1") firstrow
gen industry_year = group_id * year


eststo v0 : reghdfe Tobins_Q_t1  total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,absorb(stock_id industry_year ) vce(cluster stock_id year)
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

eststo v1 : reghdfe Tobins_Q_t1 Diversity_identity total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,absorb( stock_id industry_year ) vce(cluster stock_id year )
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace


eststo v2 : reghdfe Tobins_Q_t1 Diversity_size total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,absorb( stock_id industry_year ) vce(cluster stock_id year )
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

eststo v3 : reghdfe Tobins_Q_t1 Diversity_horizon total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,absorb( stock_id industry_year ) vce(cluster stock_id year )
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE"Yes" , replace

eststo v4 : reghdfe Tobins_Q_t1 Diversity_Index total_percent_ownership institutional_percent_ownership Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity ,absorb( stock_id industry_year ) vce(cluster stock_id year )
estadd loc Firm_FE "Yes" , replace
estadd loc Industry_Year_FE "Yes" , replace

esttab v0 v1 v2 v3 v4, star(* 0.1 ** 0.05 *** 0.01) s(Firm_FE Industry_Year_FE N  r2 ,  lab("Firm FE" "Industry-Year FE" "Observations""$ R^2 $")) brackets order(institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index ) keep( institutional_percent_ownership  Sales_Growth Firm_Size Fixed_Assets Capital_Expenditures Leverage Amihud_Illiquidity total_percent_ownership Diversity_identity Diversity_size Diversity_horizon Diversity_Index ) labcol2((+) (+) (-) (-) (+) (-) (-) (-) (-) (-) (-) (-) , title("" ExpectSign))



