        clear

        input year sales marketing research development
          2002 12 14   2   8
          2003 15 17.5 8.5 10
          end

        label var sales "Sales"
        label var market "Marketing"
        label var research "Research"
        label var develop  "Development"

        #delimit ;
        graph pie sales marketing research development,
             plabel(_all name, size(*1.5) color(white))
             by(year,
                    legend(off)
                    title("Expenditures, XYZ Corp.")
                    note("Source:  2002 Financial Report (fictional data)")
               );
         #delimit cr


