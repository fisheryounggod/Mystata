sysuse lifeexp, clear
gen country2 = country

replace country2="加拿大"   if country=="Canada"	
replace country2="古巴"     if country=="Cuba"	
replace country2="多米尼加" if country=="Dominican Republic"	
replace country2="萨尔瓦多" if country=="El Salvador"
replace country2="危地马拉" if country=="Guatemala"	
replace country2="海地"     if country=="Haiti"	
replace country2="宏都拉斯" if country=="Honduras"	
replace country2="牙买加"   if country=="Jamaica"	
replace country2="墨西哥"   if country=="Mexico"	
replace country2="尼加拉瓜" if country=="Nicaragua"	
replace country2="巴拿马"   if country=="Panama"	
replace country2="波多黎各" if country=="Puerto Rico"	
replace country2="多巴哥"   if country=="Trinidad and Tobago"	
replace country2="美国"     if country=="United States"	
