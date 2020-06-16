sysuse auto,clear
drop price2

capture drop price2
dis _rc
capture drop price
dis _rc
cap verify price<0
dis _rc

local var price2
capture drop `var'
if _rc != 0{
  dis "`var' not found!"
} 
