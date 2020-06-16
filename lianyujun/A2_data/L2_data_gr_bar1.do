
        sysuse nlsw88, clear
        
        #delimit ;
        graph bar (mean) wage, over(smsa) over(married) over(collgrad)
                title("Average Hourly Wage, 1988, Women Aged 34-46")
                subtitle("by College Graduation, Marital Status,
                          and SMSA residence")
                note("Source:  1988 data from NLS, U.S. Dept. of Labor,
                      Bureau of Labor Statistics");
        #delimit cr
