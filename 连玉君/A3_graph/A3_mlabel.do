sysuse lifeexp, clear
gen country2 = country

replace country2="���ô�"   if country=="Canada"	
replace country2="�Ű�"     if country=="Cuba"	
replace country2="�������" if country=="Dominican Republic"	
replace country2="�����߶�" if country=="El Salvador"
replace country2="Σ������" if country=="Guatemala"	
replace country2="����"     if country=="Haiti"	
replace country2="�궼��˹" if country=="Honduras"	
replace country2="�����"   if country=="Jamaica"	
replace country2="ī����"   if country=="Mexico"	
replace country2="�������" if country=="Nicaragua"	
replace country2="������"   if country=="Panama"	
replace country2="�������" if country=="Puerto Rico"	
replace country2="��͸�"   if country=="Trinidad and Tobago"	
replace country2="����"     if country=="United States"	
