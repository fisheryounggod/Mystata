
        sysuse uslifeexp2, clear
        
        #delimit ;
        scatter le year,
                title("Scatter plot")
                subtitle("Life expectancy at birth, U.S.")
                note("1")
                caption("Source:  National Vital Statistics Report,
                         Vol. 50 No. 6")
                scheme(economist);
        #delimit cr
