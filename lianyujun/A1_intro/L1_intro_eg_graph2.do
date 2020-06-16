
        sysuse census, clear

        generate drate = divorce / pop18p

        label var drate "Divorce rate"

        #delimit ;
        scatter drate medage [w=pop18p] if state!="Nevada", msymbol(Oh)
             note("Stata data excluding Nevada"
             "Area of symbol proportional to state's population aged 18+");
        #delimit cr
